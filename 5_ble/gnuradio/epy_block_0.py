import numpy as np
import math
import gatt
import time
from threading import Thread
from queue import Queue
from gnuradio import gr


BLUETOOTH_ADAPTER = 'hci0'
MY_MAC = 'A6:B7:D0:AE:C2:76'
MY_SVC_UUID = '0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e4'
MY_CHR_UUID = '0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e5'
SIGNAL_COUNT = 1
SAMPLE_RATE = 1000
USE_BLE = True


def run_bluetooth_loop(manager, device, signal_pipe):
    device.signal_pipe = signal_pipe
    device.connect()
    try:
        manager.run()
    finally:
        device.disconnect()


class BLESource(gr.basic_block):
    def __init__(self, ble_mac=MY_MAC, service_uuid=MY_SVC_UUID, characteristic_uuid=MY_CHR_UUID):
        gr.basic_block.__init__(self, name='BLE Source', in_sig=[], out_sig=[np.float32] * SIGNAL_COUNT)
        self.ble_mac = ble_mac
        self.service_uuid = service_uuid
        self.characteristic_uuid = characteristic_uuid
        self.signal_pipe = Queue()
        self.manager = gatt.DeviceManager(adapter_name='hci0')
        self.device = BLEDevice(mac_address=MY_MAC, manager=self.manager)
        self._bt_thread = None

    def general_work(self, input_items, output_items):
        count = 0
        if USE_BLE:
            for i in range(min(100, len(output_items[0]))):
                if self.signal_pipe.empty():
                    break
                data = self.signal_pipe.get()
                output_items[0][i] = data
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

        self._bt_thread = Thread(target=run_bluetooth_loop, args=(
            self.manager, self.device, self.signal_pipe, ))
        self._bt_thread.start()
        return True

    def stop(self):
        if not USE_BLE:
            return True
        self.manager.stop()
        return True


class BLEDevice(gatt.Device):
    signal_pipe = None
    last_samplepersecond_time = 0
    samples_per_second = 0

    def connect_succeeded(self):
        super().connect_succeeded()
        print("[%s] Connected" % (self.mac_address))

    def services_resolved(self):
        super().services_resolved()

        print("[%s] Resolved services" % (self.mac_address))
        for service in self.services:
            print("[%s]  Service [%s]" % (self.mac_address, service.uuid))
            for characteristic in service.characteristics:
                print("[%s]    Characteristic [%s]" % (self.mac_address, characteristic.uuid))

        svc = next(s for s in self.services if s.uuid == MY_SVC_UUID)
        chrc = next(c for c in  svc.characteristics if c.uuid == MY_CHR_UUID)
        chrc.enable_notifications()

    def characteristic_value_updated(self, characteristic, value):
        if self.signal_pipe:
            data = int.from_bytes(value, 'big')
            self.samples_per_second += 1
            for i in range(10):
                self.signal_pipe.put(data)
            if time.time() > self.last_samplepersecond_time + 1:
                print('[%s] Samples per second: %d' % (self.mac_address, self.samples_per_second))
                self.samples_per_second = 0
                self.last_samplepersecond_time = time.time()
