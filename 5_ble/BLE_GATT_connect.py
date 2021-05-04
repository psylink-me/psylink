#!/usr/bin/env python
# sudo hcitool lecc <ADDR>
import BLE_GATT
import time
import pymyocular

address = 'A6:B7:D0:AE:C2:76'
sensor_uuid = pymyocular.BLEDevice.SENSOR_UUID
channel_count_uuid = pymyocular.BLEDevice.OPTION_CHANNELS_UUID

device = BLE_GATT.Central(address)
device.connect()

fps = 0
bps = 0
nextfps = time.time() + 1

decoder = pymyocular.BLEDecoder()
try:
    print(repr(device.chrcs))
    decoder.decode_channel_count(device.char_read(channel_count_uuid))
    while True:
        read = device.char_read(sensor_uuid)
        decoded = decoder.decode_packet(read)
        #print(decoded)
        fps += 1
        bps += len(read)
        if time.time() >= nextfps:
            print(f"FPS: {fps}, BPS: {bps}")
            nextfps += 1
            fps = 0
            bps = 0
finally:
    device.disconnect()
