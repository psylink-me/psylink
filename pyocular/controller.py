from pyocular.gui import MyocularUIWindow
import pyocular
import tkinter as tk
import numpy as np
import logging
import threading
import time

SIGNAL_BUFFER_SIZE = 2048

class Controller:
    def __init__(self):
        self.BLE = None
        self.capture_thread = None
        self.capture_active = threading.Event()
        self.capture_terminate_event = threading.Event()
        self.BLE_decoder = pyocular.protocol.BLEDecoder(sample_value_offset=0)
        self.channels = None
        self.signals = None
        self.signal_buffer = None

    def run(self):
        self.launch_gui()
        self.capture_init()

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
        print("capture loop started")
        t_next = time.time() + 1
        samples_per_second = 0
        bytes_per_second = 0
        packets_per_second = 0
        while not capture_terminate_event.is_set():
            if not capture_active.wait(timeout=0.01):
                continue
            packet = self.BLE.pipe.get()
            decoded = self.BLE_decoder.decode_packet(packet)

            # Append captured signals to signal_buffer
            signals = decoded['samples']
            signal_count = len(signals)
            self.signal_buffer = np.roll(self.signal_buffer, signal_count, 0)
            self.signal_buffer[:signal_count] = signals

            packets_per_second += 1
            bytes_per_second += len(packet)
            samples_per_second += decoded['sample_count']

            if time.time() > t_next:
                channels = decoded['channels']
                print(f"FPS: {packets_per_second}, BPS: {bytes_per_second}, SPS: {samples_per_second} * {channels} = {samples_per_second * channels}")
                t_next += 1
                packets_per_second = bytes_per_second = samples_per_second = 0

    def get_signal_image(self, width, height):
        steps = 16
        max_difference = 64.0

        image = np.zeros((height, width))
        channels = self.channels
        signals_by_channel = np.transpose(self.signal_buffer)  # copy because of multithreading
        total_signals = signals_by_channel.shape[1]
        for channel in range(channels):
            x_start = int(width / channels * channel)
            x_end = int(width / channels * (channel + 1))
            for step in range(steps):
                y_start = int(height / steps * step)
                y_end = int(height / steps * (step + 1))
                sig_start = int(total_signals / steps * step)
                sig_end = int(total_signals / steps * (step + 1))

                relevant_signals = signals_by_channel[channel][sig_start:sig_end]

                maxval = relevant_signals.max()
                minval = relevant_signals.min()
                value = min(1, (maxval-minval)/max_difference)
                #print(f"{maxval}, {minval}, {value}")

                image[y_start:y_end, x_start:x_end] = value

        return image
        return np.transpose(self.signal_buffer)

    def launch_gui(self):
        root = tk.Tk()
        self.gui = MyocularUIWindow(root, self)
        root.geometry("640x480")
        root.wm_title("MyocularUI")
        root.mainloop()

    def quit(self, event=None):
        self.capture_terminate()
        self.disconnectBLE()
        self.BLE.thread_stop()
        self.gui.root.quit()

    def connectBLE(self, event=None):
        self.gui.log('connecting...')
        if not self.BLE:
            address = self.gui.ble_address_stringvar.get()
            BackendClass = list(pyocular.bluetooth.BACKENDS.values())[0]
            self.BLE = BackendClass(address)
        self.BLE.connect()
        self.readBLEconfig()
        self.BLE.thread_start()
        self.capture_activate()
        self.gui.draw_signals()

    def readBLEconfig(self):
        self.channels = self.BLE_decoder.decode_channel_count(self.BLE.read_channels())
        self.signal_buffer = np.zeros((SIGNAL_BUFFER_SIZE, self.channels))

    def disconnectBLE(self, event=None):
        self.gui.log('disconnecting...')
        if self.BLE:
            self.BLE.disconnect()
        else:
            logging.error("BLE not initialized yet")
        self.capture_deactivate()
        self.gui.stop_drawing_signals()
