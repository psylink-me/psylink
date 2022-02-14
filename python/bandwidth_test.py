#!/usr/bin/env python
# This is a script to estimate BLE bandwith for the psylink device.
# Usages:
#     python3 bandwidth_test.py [bluetooth_backend] [address]
#     python3 bandwithh_test.py list

import psylink.bluetooth
import psylink.protocol
import time
import sys

RUN_SECONDS = 60000000

if 'list' in sys.argv[1:]:
    print('\n'.join(psylink.bluetooth.BACKENDS))
    sys.exit(0)
try:
    BackendClass = psylink.bluetooth.BACKENDS[sys.argv[1]]
except IndexError:
    name, BackendClass = list(psylink.bluetooth.BACKENDS.items())[0]
    print("Warning: Using default BLE backend %s." % name)

if len(sys.argv) > 2:
    address = sys.argv[2]
    backend = BackendClass(address=address)
else:
    backend = BackendClass()

backend.connect()
backend.thread_start(disconnect_on_stop=True)

decoder = psylink.protocol.BLEDecoder()
channels = decoder.decode_channel_count(backend.read_channels())

t_next = time.time() + 1
t_end = time.time() + RUN_SECONDS
samples_per_second = 0
bytes_per_second = 0
packets_per_second = 0
max_bytes_in_a_packet = 0
try:
    while time.time() < t_end:
        packet = backend.pipe.get()
        decoded = decoder.decode_packet(packet)

        max_bytes_in_a_packet = max(max_bytes_in_a_packet, len(packet['content']))
        packets_per_second += 1
        bytes_per_second += len(packet)
        samples_per_second += len(decoded['samples'])

        if time.time() > t_next:
            print(f"FPS: {packets_per_second}, BPS: {bytes_per_second}, BPP: {max_bytes_in_a_packet}, SPS: {samples_per_second} * {channels} = {samples_per_second * channels}")
            t_next += 1
            packets_per_second = bytes_per_second = samples_per_second = max_bytes_in_a_packet = 0
except KeyboardInterrupt:
    print()
finally:
    backend.thread_stop()
    backend.disconnect()
