#!/usr/bin/env python
# sudo hcitool lecc <ADDR>
import BLE_GATT
import time
import myocular_decode

address = 'A6:B7:D0:AE:C2:76'
sensor_uuid = '0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e5'

device = BLE_GATT.Central(address)
device.connect()

fps = 0
bps = 0
nextfps = time.time() + 1
try:
    print(repr(device.chrcs))
    while True:
        read = device.char_read(sensor_uuid)
        decoded = myocular_decode.myocular_decode(read)
        print(decoded)
        fps += 1
        bps += len(decoded)
        if time.time() >= nextfps:
            print(f"FPS: {fps}, BPS: {bps}")
            nextfps += 1
            fps = 0
            bps = 0
finally:
    device.disconnect()
