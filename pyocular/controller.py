"""
The controller glues every other component together and serves as the starting point.

It contains the following threads:

- key_capturer's thread
- signal_capture_thread
- ai_worker_thread
- BLE's thread

"""
from pyocular.gui import MyocularUIWindow
import pyocular
import tkinter as tk
import numpy as np
import logging
import threading
import time


AI_WORKER_RECORD_SAMPLES = 'mic-check'
AI_WORKER_TRAIN = 'choo-choo'
AI_WORKER_PREDICT = 'rub crystal ball'
AI_WORKER_PRESS_KEYS = 'press'


class Controller:
    def __init__(self):
        self.BLE = None
        self.ai_worker_thread = None
        self.ai_worker_active_event = threading.Event()
        self.ai_worker_terminate_event = threading.Event()
        self.ai_worker_action = None
        self.signal_capture_thread = None
        self.signal_capture_active_event = threading.Event()
        self.signal_capture_terminate_event = threading.Event()
        self.BLE_decoder = pyocular.protocol.BLEDecoder(sample_value_offset=0)
        self.channels = None
        self.signals = None
        self.gui = None
        self.ai = pyocular.ai.AI()
        self.signal_buffer = SignalBuffer()
        self.key_capturer = pyocular.keycapturer.KeyCapturer(self.on_key_change)
        self.show_predicted_keys = False

    def run(self):
        self.signal_capture_init()
        self.ai_worker_thread_init()
        self.key_capturer.start_keyboard_listener()
        try:
            self.launch_gui()
        finally:
            if self.gui:
                self.gui.quit()
            self.key_capturer.stop_keyboard_listener()
            self.signal_capture_terminate()
            self.ai_worker_terminate()
            if self.BLE:
                self.disconnectBLE()
                self.BLE.thread_stop()

    def debug_action(self, event=None):
        # Place any debug action here to be triggered when F1 is pressed
        print("Debug action triggered")

    def start_sampling(self, event=None):
        if self.BLE and self.BLE.is_connected():
            self.set_worker_action(AI_WORKER_RECORD_SAMPLES)
        else:
            logging.error("Need to connect to device before recording samples")

    def stop_current_process(self, event=None):
        self.set_worker_action(None)

    def _start_ai_key_prediction_common(self):
        if self.BLE and self.BLE.is_connected():
            if self.ai.has_model():
                return True
            else:
                logging.error("Need to train a model before starting key prediction")
        else:
            logging.error("Need to connect to device before starting key prediction")

    def start_ai_dry(self, event=None):
        if self._start_ai_key_prediction_common():
            self.set_worker_action(AI_WORKER_PREDICT)

    def start_ai_simulate_keypresses(self, event=None):
        if self._start_ai_key_prediction_common():
            self.set_worker_action(AI_WORKER_PRESS_KEYS)

    def start_ai_training(self, event=None):
        self.set_worker_action(AI_WORKER_TRAIN)

    def set_worker_action(self, action, run=True):
        if action is None and run:
            self.ai_worker_active_event.clear()

        if self.ai_worker_action != action:
            if self.ai_worker_action == AI_WORKER_PREDICT:
                self.show_predicted_keys = False
            elif action == AI_WORKER_PREDICT:
                self.show_predicted_keys = True

            self.ai_worker_action = action
            if run and action:
                self.ai_worker_active_event.set()

    def on_key_change(self, all_pressed_keys):
        if self.gui and not self.show_predicted_keys:
            self.gui.set_pressed_keys(all_pressed_keys)

    def ai_worker_thread_init(self):
        self.ai_worker_thread = threading.Thread(
            target=self.ai_worker_loop,
            args=(self.ai_worker_active_event, self.ai_worker_terminate_event),
        )
        self.ai_worker_thread.start()

    def ai_worker_loop(self, active, terminate):
        next_action = 0
        while not terminate.is_set():
            if not active.wait(timeout=0.1):
                continue

            if self.ai_worker_action == AI_WORKER_RECORD_SAMPLES:
                time_delay = next_action - time.time()
                if time_delay > 0:
                    time.sleep(time_delay)
                    continue
                next_action = time.time() + pyocular.config.RECORD_SAMPLES_INTERVAL
                window_size = self.ai.training_data.get_window_size()
                features = self.signal_buffer.data[:window_size]
                latency = self.BLE.get_latency()
                keys = self.key_capturer.get_pressed_keys(at_time=time.time() - latency)
                label = self.keys_to_label(keys)
                self.ai.training_data.append(features, label)

            if self.ai_worker_action == AI_WORKER_TRAIN:
                signal_capture = self.signal_capture_is_active()
                if signal_capture:
                    self.signal_capture_deactivate()

                self.ai.build_model()
                self.ai.compile_training_data()
                self.ai.train()

                if signal_capture:
                    self.signal_capture_activate()
                active.clear()

            if self.ai_worker_action == AI_WORKER_PREDICT:
                time_delay = next_action - time.time()
                if time_delay > 0:
                    time.sleep(time_delay)
                    continue
                next_action = time.time() + pyocular.config.PREDICT_INTERVAL
                window_size = self.ai.training_data.get_window_size()
                features = self.signal_buffer.data[:window_size]
                predicted_label = self.ai.predict(features)
                keys = self.label_to_keys(predicted_label)
                print(f"Predicted: {keys}")
                if self.gui:
                    self.gui.set_pressed_keys(keys)

    @staticmethod
    def keys_to_label(keys):
        return pyocular.config.LABEL_SEPARATOR.join(keys)

    @staticmethod
    def label_to_keys(label):
        return label.split(pyocular.config.LABEL_SEPARATOR)

    def ai_worker_terminate(self):
        self.ai_worker_terminate_event.set()

    def signal_capture_init(self):
        self.signal_capture_thread = threading.Thread(
            target=self.signal_capture_loop,
            args=(self.signal_capture_active_event, self.signal_capture_terminate_event),
        )
        self.signal_capture_thread.start()

    def signal_capture_activate(self):
        self.signal_capture_active_event.set()
        if self.signal_capture_thread is None:
            self.signal_capture_init()

    def signal_capture_deactivate(self):
        self.signal_capture_active_event.clear()

    def signal_capture_is_active(self):
        return self.signal_capture_active_event.is_set()

    def signal_capture_terminate(self):
        self.signal_capture_terminate_event.set()

    def signal_capture_loop(self, active, terminate):
        logging.info("Packet capture thread started")
        t_next = time.time() + 1
        samples_per_second = 0
        bytes_per_second = 0
        packets_per_second = 0
        while not terminate.is_set():
            if not active.wait(timeout=0.1):
                continue
            packet = self.BLE.pipe.get()
            if not active.wait(timeout=0.1):
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

    def get_recorded_samples(self):
        return self.ai.training_data.get_recorded_samples()

    def get_number_of_labels(self):
        return self.ai.training_data.get_label_count()

    def get_active_ble_address(self):
        if self.BLE and self.BLE.is_connected():
            return self.BLE.address
        return None

    def launch_gui(self):
        root = tk.Tk()
        self.gui = MyocularUIWindow(root, self)
        root.geometry("640x480")
        root.wm_title("MyocularUI")
        root.mainloop()

    def save_records(self, event=None):
        self.ai.save_training_data(self.gui.get_run_name())

    def load_records(self, event=None):
        self.ai.load_training_data(self.gui.get_run_name())
        channels = self.ai.training_data.get_channels()
        self.set_device_config(channels)

    def save_model(self, event=None):
        self.ai.save_model(self.gui.get_run_name())

    def load_model(self, event=None):
        self.ai.load_model(self.gui.get_run_name())
        channels = self.ai.training_data.get_channels()
        self.set_device_config(channels)

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
        self.signal_capture_activate()
        self.gui.start_drawing_signals()
        self.gui.log(f'Connected to {address}.')

    def readBLEconfig(self):
        channels = self.BLE_decoder.decode_channel_count(self.BLE.read_channels())
        self.set_device_config(channels)

    def set_device_config(self, channels):
        self.channels = channels
        self.ai.training_data.set_channels(channels)
        self.gui.set_channels(channels)
        self.signal_buffer.resize(channels, pyocular.config.SIGNAL_BUFFER_SIZE)

    def disconnectBLE(self, event=None):
        self.gui.log('Disconnecting from device...')
        self.signal_capture_deactivate()
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
