from threading import Timer
import subprocess

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
