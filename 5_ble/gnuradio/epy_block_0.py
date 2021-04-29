import numpy as np
import math
import BLE_GATT
import time
import importlib
import os.path
import sys
from threading import Thread, Event
from queue import Queue
from gnuradio import gr

# NOTE: fill in the path to the pymyocular library
sys.path.insert(0, os.path.expanduser('~/repos/myocular/5_ble'))
import pymyocular

BLUETOOTH_ADAPTER = 'hci0'
MY_MAC = 'A6:B7:D0:AE:C2:76'
MY_CHR_UUID = '0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e5'
SIGNAL_COUNT = 1
SAMPLE_RATE = 1000
USE_BLE = True


def run_bluetooth_loop(device, sample_pipe, stop_thread):
    device.connect()
    fps = 0
    bps = 0
    nextfps = time.time() + 1
    try:
        while not stop_thread.is_set():
            read = device.char_read(MY_CHR_UUID)
            print('[BLE] Received a packet of length %d' % len(read))
            data = pymyocular.decode_ble_packet(read)
            samples = data['samples']
            for sample in samples:
                sample_pipe.put(sample)

            bps += len(read)
            fps += len(samples)
            if time.time() >= nextfps:
                print(f"FPS: {fps}, BPS: {bps}")
                nextfps += 1
                fps = 0
                bps = 0
    finally:
        device.disconnect()


class BLESource(gr.basic_block):
    def __init__(self, ble_mac=MY_MAC, characteristic_uuid=MY_CHR_UUID):
        gr.basic_block.__init__(self, name='BLE Source', in_sig=[], out_sig=[np.float32] * SIGNAL_COUNT)
        self.ble_mac = ble_mac
        self.characteristic_uuid = characteristic_uuid
        self.sample_pipe = Queue()
        self.stop_thread = Event()
        self.device = BLE_GATT.Central(MY_MAC)
        self._bt_thread = None

    def general_work(self, input_items, output_items):
        count = 0
        if USE_BLE:
            for i in range(min(100, len(output_items[0]))):
                if self.sample_pipe.empty():
                    break
                channels = self.sample_pipe.get()
                for channel, samples in enumerate(channels):
                    output_items[channel][i] = samples
                count += 1
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
