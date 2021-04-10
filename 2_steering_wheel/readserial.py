#/usr/bin/python
# Usage: ./readserial.py [any_argument]
# Without arguments: Don't press keys, just show read values
# With any argument: Press keys

import sys
import subprocess
import serial
import time
arduino = serial.Serial(port='/dev/ttyACM1', baudrate=115200, timeout=.1)

PRESS = len(sys.argv) > 1

def parse(arduino_output):
    decoded = arduino_output.decode('utf-8')
    elements = decoded.strip().split('\t')
    elements = list(map(float, elements))
    return elements


if __name__ == '__main__':
    pressed_key = [None]
    def press_key(key):
        if pressed_key[0] is not None:
            subprocess.call(['xdotool', 'keyup', pressed_key[0]])
        if key is not None:
            subprocess.call(['xdotool', 'keydown', key])
        pressed_key[0] = key

    try:
        while True:
            electrode1, electrode2 = parse(arduino.readline())
            sys.stdout.write(f'{electrode1: 9}  {electrode2: 9}  ')
            if electrode1 > 3000 and electrode2 > 2500:
                if PRESS: press_key('Right')
                sys.stdout.write("R")
            elif electrode1 > 1000 and electrode1 < 2000 and electrode2 < 1000:
                if PRESS: press_key('Left')
                sys.stdout.write("L")
            else:
                if PRESS: press_key(None)
            print()
            time.sleep(0.2)
    except KeyboardInterrupt:
        if PRESS: press_key(None)
