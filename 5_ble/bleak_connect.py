#!/usr/bin/env python
import asyncio
from bleak import BleakClient
import pymyocular
import time

address = 'A6:B7:D0:AE:C2:76'
sensor_uuid = pymyocular.BLEDevice.SENSOR_UUID
channel_count_uuid = pymyocular.BLEDevice.OPTION_CHANNELS_UUID

async def run(address):
    fps = 0
    bps = 0
    nextfps = time.time() + 1
    decoder = pymyocular.BLEDecoder()
    async with BleakClient(address) as client:
        read = await client.read_gatt_char(channel_count_uuid)
        print(decoder.decode_channel_count(read))

        while True:
            read = await client.read_gatt_char(sensor_uuid)
            decoded = decoder.decode_packet(read)
            #print(decoded)
            fps += 1
            bps += len(read)
            if time.time() >= nextfps:
                print(f"FPS: {fps}, BPS: {bps}")
                nextfps += 1
                fps = 0
                bps = 0

loop = asyncio.get_event_loop()
loop.run_until_complete(run(address))
