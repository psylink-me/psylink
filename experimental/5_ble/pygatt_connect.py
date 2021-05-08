#!/usr/bin/env python
import pygatt

adapter = pygatt.GATTToolBackend()

try:
    adapter.start()
    device = adapter.connect('A6:B7:D0:AE:C2:76')
    value = device.char_read("00002a05-0000-1091-8000-00805f9b34fb")
finally:
    adapter.stop()
