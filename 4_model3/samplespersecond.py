#!/usr/bin/env python
# Usage: ./samplespersecond.py [serial_port_device]

import sys
import subprocess
import serial.threaded
import time

port = sys.argv[1] if len(sys.argv[1:]) else '/dev/ttyACM0'
arduino = serial.Serial(port=port, baudrate=115200, timeout=.1)

class Reader(serial.threaded.LineReader):
    TERMINATOR = b'\n'
    count = 0
    next_print = time.time()

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        pass

    def handle_line(self, line):
        self.count += 1
        if time.time() > self.next_print:
            print(self.count)
            self.count = 0
            self.next_print += 1
        #print(f"{line}")
        #print(arduino.in_waiting)
        #arduino.reset_input_buffer()

def launch():
    return serial.threaded.ReaderThread(arduino, Reader)

thread = launch()
thread.start()
#print(thread.protocol.transport)
while True:
    time.sleep(1000)
#print(thread.connect())
#print(thread.protocol)
