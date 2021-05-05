#!/usr/bin/env python
# This is a script to estimate BLE bandwith for the myocular device.
# Usages:
#     python3 bandwidth_test.py [bluetooth_backend]
#     python3 bandwithh_test.py list

import pyocular
import time
import sys

RUN_SECONDS = 6

if 'list' in sys.argv[1:]:
    print('\n'.join(pyocular.bluetooth.BACKENDS))
    sys.exit(0)
try:
    BackendClass = pyocular.bluetooth.BACKENDS[sys.argv[1]]
except IndexError:
    name, BackendClass = list(pyocular.bluetooth.BACKENDS.items())[0]
    print("Warning: Using default BLE backend %s." % name)

backend = pyocular.bluetooth.BLEGATTBackend()
backend.connect()
backend.thread_start(disconnect_on_stop=True)

decoder = pyocular.protocol.BLEDecoder()
channels = decoder.decode_channel_count(backend.read_channels())

t_next = time.time() + 1
t_end = time.time() + RUN_SECONDS
samples_per_second = 0
bytes_per_second = 0
packets_per_second = 0
try:
    while time.time() < t_end:
        packet = backend.pipe.get()
        decoded = decoder.decode_packet(packet)

        packets_per_second += 1
        bytes_per_second += len(packet)
        samples_per_second += len(decoded['samples'])

        if time.time() > t_next:
            print(f"FPS: {packets_per_second}, BPS: {bytes_per_second}, SPS: {samples_per_second} * {channels} = {samples_per_second * channels}")
            t_next += 1
            packets_per_second = bytes_per_second = samples_per_second = 0
except KeyboardInterrupt:
    print()
finally:
    backend.thread_stop()
    backend.disconnect()
