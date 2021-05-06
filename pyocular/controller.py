from pyocular.gui import MyocularUIWindow
import pyocular
import tkinter as tk
import numpy as np
import logging
import threading
import time


class Controller:
    def __init__(self):
        self.BLE = None
        self.capture_thread = None
        self.capture_active = threading.Event()
        self.capture_terminate_event = threading.Event()
        self.BLE_decoder = pyocular.protocol.BLEDecoder(sample_value_offset=0)
        self.channels = None
        self.signals = None
        self.gui = None
        self.signal_buffer = SignalBuffer()
        self.key_capturer = pyocular.keycapturer.KeyCapturer(self.on_key_change)

    def run(self):
        self.capture_init()
        self.key_capturer.start_keyboard_listener()
        try:
            self.launch_gui()
        finally:
            if self.gui:
                self.gui.quit()
            self.key_capturer.stop_keyboard_listener()
            self.capture_terminate()
            if self.BLE:
                self.disconnectBLE()
                self.BLE.thread_stop()

    def debug_action(self, event=None):
        # Place any debug action here to be triggered when F1 is pressed
        print("Debug action triggered")

    def on_key_change(self, all_pressed_keys):
        if self.gui:
            self.gui.set_pressed_keys(all_pressed_keys)

    def capture_init(self):
        self.capture_thread = threading.Thread(
            target=self.capture_loop,
            args=(self.capture_active, self.capture_terminate_event),
        )
        self.capture_thread.start()

    def capture_activate(self):
        self.capture_active.set()
        if self.capture_thread is None:
            self.capture_init()

    def capture_deactivate(self):
        self.capture_active.clear()

    def capture_terminate(self):
        self.capture_terminate_event.set()

    def capture_loop(self, capture_active, capture_terminate_event):
        logging.info("Packet capture thread started")
        t_next = time.time() + 1
        samples_per_second = 0
        bytes_per_second = 0
        packets_per_second = 0
        while not capture_terminate_event.is_set():
            if not capture_active.wait(timeout=0.01):
                continue
            packet = self.BLE.pipe.get()
            if not capture_active.wait(timeout=0.01):
                continue
            decoded = self.BLE_decoder.decode_packet(packet)

            self.signal_buffer.append(decoded['samples'])

            packets_per_second += 1
            bytes_per_second += len(packet)
            samples_per_second += decoded['sample_count']

            if time.time() > t_next:
                channels = decoded['channels']
                print(f"FPS: {packets_per_second}, BPS: {bytes_per_second}, SPS: {samples_per_second} * {channels} = {samples_per_second * channels}")
                t_next += 1
                packets_per_second = bytes_per_second = samples_per_second = 0

    def get_signal_image(self, width, height):
        return self.signal_buffer.render_image(width, height)

    def launch_gui(self):
        root = tk.Tk()
        self.gui = MyocularUIWindow(root, self)
        root.geometry("640x480")
        root.wm_title("MyocularUI")
        root.mainloop()

    def quit(self, event=None):
        self.gui.quit()

    def connectBLE(self, event=None):
        if not self.BLE:
            address = self.gui.get_BLE_address()
            BackendClass = list(pyocular.bluetooth.BACKENDS.values())[0]
            self.BLE = BackendClass(address)
        else:
            address = self.BLE.address
        self.gui.log(f'Connecting to {address}...')
        self.BLE.connect()
        self.readBLEconfig()
        self.BLE.thread_start()
        self.capture_activate()
        self.gui.start_drawing_signals()
        self.gui.log(f'Connected to {address}.')

    def readBLEconfig(self):
        self.channels = self.BLE_decoder.decode_channel_count(self.BLE.read_channels())
        self.gui.set_channels(self.channels)
        self.signal_buffer.resize(self.channels, pyocular.config.SIGNAL_BUFFER_SIZE)

    def disconnectBLE(self, event=None):
        self.gui.log('Disconnecting from device...')
        self.capture_deactivate()
        self.gui.stop_drawing_signals()
        if self.BLE:
            self.BLE.thread_stop()
            self.BLE.disconnect()
        else:
            logging.error("BLE not initialized yet.")


class SignalBuffer:
    def __init__(self):
        self.channels = None
        self.signals = None
        self.data = None
        self.image_buffer = None

    def resize(self, channels, signals):
        self.channels = channels
        self.signals = signals
        self.data = np.zeros((signals, channels))

    def append(self, samples):
        sample_count = len(samples)
        self.data = np.roll(self.data, sample_count, 0)
        self.data[:sample_count] = samples

    def render_image(self, width, height):
        step_height = 2
        steps = 5
        max_difference = 64.0
        redraw_delay_ms = 100  # see after() call in gui.MyocularUIWindow.draw_signals

        if self.image_buffer is None or self.image_buffer.shape != (height, width):
            self.image_buffer = np.zeros((height, width))
        else:
            self.image_buffer = np.roll(self.image_buffer, steps * step_height, 0)

        signals_by_channel = np.transpose(self.data)  # copy because of multithreading
        channels, total_signals = signals_by_channel.shape

        # Get approximately all the samples that arrived since the last redraw
        samples_per_step = pyocular.config.SAMPLE_RATE / (1000 / redraw_delay_ms) / steps
        if samples_per_step * steps > total_signals:
            samples_per_step = int(total_signals / steps)

        for channel in range(channels):
            x_start = int(width / channels * channel)
            x_end = int(width / channels * (channel + 1))
            for step in range(steps):
                y_start = int(step_height * step)
                y_end = int(step_height * (step + 1))
                sig_start = int(samples_per_step * step)
                sig_end = int(samples_per_step * (step + 1))

                relevant_signals = signals_by_channel[channel][sig_start:sig_end]

                maxval = relevant_signals.max()
                minval = relevant_signals.min()
                value = min(1, (maxval-minval)/max_difference)

                self.image_buffer[y_start:y_end, x_start:x_end] = value

        return self.image_buffer
