#!/usr/bin/env python
from bleak import BleakClient
import pymyocular
import time
import asyncio

address = 'A6:B7:D0:AE:C2:76'
sensor_uuid = pymyocular.BLEDevice.SENSOR_UUID
channel_count_uuid = pymyocular.BLEDevice.OPTION_CHANNELS_UUID

def run(address):
    fps = 0
    bps = 0
    nextfps = time.time() + 1
    decoder = pymyocular.BLEDecoder()
    client = BleakClient(address)
    asyncio.get_event_loop().run_until_complete(client.connect())
    try:
        read = asyncio.get_event_loop().run_until_complete(client.read_gatt_char(channel_count_uuid))
        print(decoder.decode_channel_count(read))

        while True:
            read = asyncio.get_event_loop().run_until_complete(client.read_gatt_char(sensor_uuid))
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
        asyncio.get_event_loop().run_until_complete(client.disconnect())

run(address)
