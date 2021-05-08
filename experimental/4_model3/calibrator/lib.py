import serial.threaded
import subprocess
import numpy
import time
from collections import deque
from threading import Timer

from config import (
        SAMPLE_WINDOW_SIZE,
        SERIAL_PORT,
        SERIAL_BAUDRATE,
        SAMPLES_PER_SECOND_PRINT_INTERVAL,
)

# Based on: https://github.com/adamheins/tk-debouncer/blob/d0987b4f855f99cf2c9e3613a7c3992c8d303f7e/debouncer.py
class KeyDebouncer:
    ''' Debounces key events for Tkinter apps, so that press-and-hold works. '''
    def __init__(self, pressed_cb, released_cb, max_delay=0.05):
        self.key_pressed = False
        self.key_released_timer = None
        self.max_delay = max_delay

        self.pressed_cb = pressed_cb
        self.released_cb = released_cb

    def _key_released_timer_cb(self, event):
        ''' Called when the timer expires for a key up event, signifying that a
            key press has actually ended. '''
        self.key_pressed = False
        self.released_cb(event)

    def pressed(self, event):
        ''' Callback for a key being pressed. '''
        # If timer set by up is active, cancel it, because the press is still
        # active.
        if self.key_released_timer:
            self.key_released_timer.cancel()
            self.key_released_timer = None

        # If the key is not currently pressed, mark it so and call the callback.
        if not self.key_pressed:
            self.key_pressed = True
            self.pressed_cb(event)

    def released(self, event):
        ''' Callback for a key being released. '''
        # Set a timer. If it is allowed to expire (not reset by another down
        # event), then we know the key has been released for good.
        self.key_released_timer = Timer(self.max_delay, self._key_released_timer_cb, [event])
        self.key_released_timer.start()


class KeyTracker:
    def __init__(self):
        self.pressed_keys = set()

    def keypress(self, event):
        self.pressed_keys.add(event.keysym)

    def keyrelease(self, event):
        try:
            self.pressed_keys.remove(event.keysym)
        except KeyError:
            pass

class KeyPressManagerXDoTool:
    def __init__(self):
        self.pressed_keys = set()

    def press(self, keys):
        if keys == None:
            keys = set()
        else:
            keys = set(keys)
        down = keys - self.pressed_keys
        up = self.pressed_keys - keys
        self.pressed_keys = keys

        for key in down:
            self.raw_keydown(key)
        for key in up:
            self.raw_keyup(key)

    def raw_keydown(self, key):
        # TODO: Fork process to avoid block
        subprocess.call(['xdotool', 'keydown', key])

    def raw_keyup(self, key):
        # TODO: Fork process to avoid block
        subprocess.call(['xdotool', 'keyup', key])


class SerialReader(serial.threaded.LineReader):
    TERMINATOR = b'\n'
    read_first_line = False
    signal_count = None
    signals_per_second_counter = 0
    sample_buffer = None
    #connection = None

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.next_print = time.time() + 1
        self._init_buffer()

    def reset(self):
        #if self.connection:
            #self.connection.reset_input_buffer()
        self._init_buffer()

    def handle_line(self, line):
        signals = line.split(' ')
        if self.signal_count is None:
            self.signal_count = len(signals)
            self._init_buffer()
        elif not self.read_first_line:
            # Throw away first line so that we don't count signals in a half-read line
            self.read_first_line = True
            return
        for i, signal in enumerate(signals):
            self.sample_buffer[i].append(int(signal))

        if time.time() >= self.next_print:
            print("Serial signals per second: %d" %
                    (self.signals_per_second_counter / SAMPLES_PER_SECOND_PRINT_INTERVAL))
            self.signals_per_second_counter = 0
            self.next_print = time.time() + SAMPLES_PER_SECOND_PRINT_INTERVAL
        self.signals_per_second_counter += 1

        #if self.connection.in_waiting > 0:
            #print("WARNING: SERIAL BUFFER IS OVERFLOWING")
            #self.connection.reset_input_buffer()

    def get_flattened_buffer(self):
        data_points = []
        for channel in self.sample_buffer:
            data_points.extend(channel)
        return data_points

    def is_buffer_ready(self):
        try:
            return self.sample_buffer and len(self.sample_buffer[0]) == SAMPLE_WINDOW_SIZE
        except TypeError:
            import pprint; pprint.pprint(len(self.sample_buffer))

    def _init_buffer(self):
        if self.signal_count is None:
            self.sample_buffer = []
        else:
            self.sample_buffer = []
            for _ in range(self.signal_count):
                # We keep the last SAMPLE_WINDOW_SIZE samples for each signal
                self.sample_buffer.append(deque(maxlen=SAMPLE_WINDOW_SIZE))

    @staticmethod
    def activate():
        connection = serial.Serial(port=SERIAL_PORT, baudrate=SERIAL_BAUDRATE, timeout=.1)
        thread = serial.threaded.ReaderThread(connection, SerialReader)
        thread.start()
        for _ in range(50):
            if not thread.protocol:
                time.sleep(0.1)
        return thread.protocol
