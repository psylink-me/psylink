"""
Captures keys and saves them in a history, to allow you to find out which keys
were pressed at a certain time. This compensates for bluetooth delay.

KeyCapturer.key_history looks like:
    deque([
        (1620259925.2486, ['a']),
        (1620259955.671136, ['a', 's']),
        (1620259982.468571, ['a', 's', 'd']),
        ...
    ])

Test cases:

>>> kc = KeyCapturer()
>>> kc.get_pressed_keys()
[]
>>> kc.on_key_down('a', override_time=1620259925.2486)
>>> kc.get_pressed_keys()
['a']
>>> kc.on_key_down('s', override_time=1620259955.671136)
>>> kc.on_key_down('d', override_time=1620259982.468571)
>>> kc.get_pressed_keys()
['a', 'd', 's']
>>> kc.get_pressed_keys(at_time=1620259900)
[]
>>> kc.get_pressed_keys(at_time=1620259950)
['a']
>>> kc.get_pressed_keys(at_time=1620259970)
['a', 's']
>>> kc.get_pressed_keys(at_time=1620259985)
['a', 'd', 's']
>>> kc.on_key_up('s', override_time=1620260013.6233)
>>> kc.get_pressed_keys()
['a', 'd']
"""

import logging
import time
import doctest
from collections import deque
from pynput import keyboard

MAX_HISTORY_SIZE = 32

class KeyCapturer:
    def __init__(self, on_change_callback=None):
        self.key_history = deque(maxlen=MAX_HISTORY_SIZE)
        self.key_listener = None
        self.keys_pressed = set()
        self.on_change_callback = on_change_callback

    def get_pressed_keys(self, at_time=None):
        if not self.key_history:
            return []
        if at_time:
            pressed_keys = []
            for timestamp, keys in self.key_history:
                if timestamp > at_time:
                    break
                pressed_keys = keys
            return pressed_keys
        else:
            return self.key_history[-1][1]

    def on_key_down(self, key, override_time=None):
        # override_time is purely for unit testing
        if key in self.keys_pressed:
            logging.warning("Key `%s' pressed before it was released" % key)
        else:
            self.keys_pressed.add(str(key))
            self._update_history(override_time=override_time)

    def on_key_up(self, key, override_time=None):
        # override_time is purely for unit testing
        try:
            self.keys_pressed.remove(str(key))
        except KeyError:
            logging.warning("Key `%s' released before it was pressed" % key)
        else:
            self._update_history(override_time=override_time)

    def _update_history(self, override_time):
        # override_time is purely for unit testing
        t = override_time if override_time else time.time()
        keys = list(sorted(self.keys_pressed))
        self.key_history.append([t, keys])
        if self.on_change_callback:
            self.on_change_callback(keys)

    def reset(self):
        self.keys_pressed.clear()
        self.key_history.clear()

    def start_keyboard_listener(self):
        self.key_listener = keyboard.Listener(
                on_press=self.on_key_down,
                on_release=self.on_key_up)
        self.key_listener.start()

    def stop_keyboard_listener(self):
        if self.key_listener is not None:
            self.key_listener.stop()
        else:
            logging.warning("Tried to stop key listener while it wasn't running")


if __name__ == '__main__':
    import doctest
    doctest.testmod()
