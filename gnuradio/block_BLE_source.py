import numpy as np
import math
import BLE_GATT
import time
import importlib
import os.path
import sys
from threading import Thread, Event
from queue import SimpleQueue
from gnuradio import gr

# NOTE: fill in the path to the pymyocular library
sys.path.insert(0, os.path.expanduser('~/repos/myocular/5_ble'))
import pymyocular

BLUETOOTH_ADAPTER = 'hci0'
DEFAULT_BLE_ADDRESS = 'A6:B7:D0:AE:C2:76'
SIGNAL_COUNT = 8
USE_BLE = True


def run_bluetooth_loop(device, sample_pipe, stop_thread):
    decoder = pymyocular.BLEDecoder()
    sps = 0
    bps = 0
    last_tick = None
    nextsps = time.time() + 1
    device.connect()
    try:
        decoder.decode_channel_count(device.char_read(pymyocular.BLEDevice.OPTION_CHANNELS_UUID))
        while not stop_thread.is_set():
            t = time.time()
            read = device.char_read(pymyocular.BLEDevice.SENSOR_UUID)
            t = time.time() - t
            data = decoder.decode_packet(read)
            #print('[BLE] Received a packet of length %d, duration: %f, tick: %d' % (len(read), t, data['tick']))
            samples = data['samples']
            tick = data['tick']

            if last_tick is not None:
                if last_tick == tick:
                    # This packet has already been received
                    #print('Dropped packet, it has already been received')
                    continue

                # Need to consider overflow of tick value. It's range is between 1 and incl. 255
                #lost_packets = min(max(0, tick - last_tick - 1), tick + 255 - last_tick - 1)
                #if lost_packets:
                #    null_sample = np.zeros((data['channels'], lost_packets * len(samples)))
                #    sample_pipe.put(null_sample)
            last_tick = tick

            #for sample in samples:
                #sample_pipe.put(sample)
            sample_pipe.put(samples)

            bps += len(read)
            sps += len(samples)
            if time.time() >= nextsps:
                print(f"SPS: {sps}, BPS: {bps}")
                nextsps += 1
                sps = 0
                bps = 0
    finally:
        device.disconnect()


class BLESource(gr.basic_block):
    def __init__(self, ble_mac=DEFAULT_BLE_ADDRESS):
        gr.basic_block.__init__(self, name='BLE Source', in_sig=[], out_sig=[np.float32] * SIGNAL_COUNT)
        self.ble_mac = ble_mac
        self.sample_pipe = SimpleQueue()
        self.stop_thread = Event()
        self.last_sample_count = 2048  # some large conservative value
        self.device = BLE_GATT.Central(ble_mac)
        self._bt_thread = None

    def general_work(self, input_items, output_items):
        count = 0
        if USE_BLE:
            limit = len(output_items[0]) - self.last_sample_count
            while not self.sample_pipe.empty() and count < limit:
                samples = self.sample_pipe.get()
                transposed = np.transpose(samples)
                for channel_id, channel in enumerate(output_items):
                    channel[count:count+len(samples)] = transposed[channel_id]
                count += len(samples)
                self.last_sample_count = len(samples)
                limit = len(output_items[0]) - self.last_sample_count
        else:
            for i in range(min(100, len(output_items[0]))):
                output_items[0][i] = math.sin(i)
                count += 1
        return count

    def start(self):
        if not USE_BLE:
            return True
        if self._bt_thread:
            print("Error: Bluetooth Thread already running!")
            return False

        # Reset state
        importlib.reload(pymyocular)
        self.stop_thread.clear()
        while not self.sample_pipe.empty():
            self.sample_pipe.get()

        # Launch thread
        self._bt_thread = Thread(
            target=run_bluetooth_loop,
            args=(self.device, self.sample_pipe, self.stop_thread)
        )
        self._bt_thread.start()
        return True

    def stop(self):
        if not USE_BLE:
            return True
        self.stop_thread.set()
        self._bt_thread = None

        return True
