#!/usr/bin/env python
# Seems to only work with the "Notify" property active, not with "Indicate".
# Unfortunately, Notify introduces a ~200ms block in the arduino, messing up
# the sampling, so I don't think I can keep using this.

import gatt
import myocular_decode
import time

manager = gatt.DeviceManager(adapter_name='hci0')

class AnyDevice(gatt.Device):
    def connect_succeeded(self):
        super().connect_succeeded()
        self.fps = 0
        self.bps = 0
        self.nextframe = time.time() + 1
        #print("[%s] Connected" % (self.mac_address))

    def services_resolved(self):
        super().services_resolved()

        print("[%s] Resolved services" % (self.mac_address))
        for service in self.services:
            print("[%s]  Service [%s]" % (self.mac_address, service.uuid))
            for characteristic in service.characteristics:
                print("[%s]    Characteristic [%s]" % (self.mac_address, characteristic.uuid))

        svc = next(s for s in self.services
            if s.uuid == '0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e4')

        chrc = next(c for c in svc.characteristics
            if c.uuid == '0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e5')

        #while True:
            #chrc.read_value()
            #time.sleep(0.001)
        chrc.enable_notifications()

    #def characteristic_enable_notification_succeeded(self, characteristic):
        #print("Subscribed to %s!" % characteristic)

    #def characteristic_enable_notification_failed(self, characteristic):
        #print("Subscribed to %s!" % characteristic)

    def characteristic_value_updated(self, characteristic, value):
        if time.time() >= self.nextframe:
            print(f"FPS: {self.fps}  BPS: {self.bps}")
            self.fps = 0
            self.bps = 0
            self.nextframe = time.time() + 1
        decoded = myocular_decode.myocular_decode(value)
        self.bps += len(decoded)
        self.fps += 1
        #print(dec)


device = AnyDevice(mac_address='A6:B7:D0:AE:C2:76', manager=manager)
device.connect()

try:
    manager.run()
except KeyboardInterrupt:
    pass
finally:
    device.disconnect()
