#!/usr/bin/env python
#
# Workflow:
# 1. start recording signals
# 2. make movements with arm, and at the same time, press the keys that the
#    movements should represent
# 3. stop recording, save data
# 4. train AI
# 5. activate AI-enhanced action mapper
# 6. make movements with arm, and watch the corresponding keys getting magically pressed
#

import serial
import csv
import pprint
import sys
import time
from collections import deque
from tkinter import *
from lib import KeyDebouncer, KeyTracker, KeyPressManagerXDoTool
from ai import MyoAI
#from matplotlib.figure import Figure
#from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg

KEY_DEBOUNCER_DELAY = 0.05
SAMPLE_WINDOW_SIZE = 32
NUM_SIGNALS = 8
DATA_FILE = 'records.csv'
MODEL_FILE = 'model.tf'
LABEL_NO_KEY = 'null'
TICKS_PER_PREDICTION = 32

class Backend:
    def __init__(self, num_signals=NUM_SIGNALS):
        self.serial_connection = None
        self.serial_port = '/dev/ttyACM0'
        self.baudrate = 115200
        self.num_signals = num_signals
        self.recordings = []  # a list of lists like [label, signal1, signal2, ...] 
        self.ai = None
        self._ai_tick = 0
        self.reads_per_second_time = 0
        self.reads_per_second_counter = 0
        self.keypress_manager = KeyPressManagerXDoTool()
        self.need_to_rebuild_training_data = True

        # We keep the last SAMPLE_WINDOW_SIZE samples for each signal
        self.sample_buffer = []
        for _ in range(self.num_signals):
            channel = deque(maxlen=SAMPLE_WINDOW_SIZE)
            self.sample_buffer.append(channel)

    def reset(self):
        self._flush_sample_buffer()

    def connect_serial(self):
        if not self.serial_connection:
            self.serial_connection = serial.Serial(
                port=self.serial_port,
                baudrate=self.baudrate,
                timeout=.01
            )

    def ai_activate(self):
        self.connect_serial()
        self.throw_away_first_line()

    def ai_deactivate(self):
        self._flush_sample_buffer()

    def ai_tick(self):
        self.read_data()
        if len(self.sample_buffer[0]) < SAMPLE_WINDOW_SIZE:
            # Sample buffer not full yet
            return

        if self._ai_tick == 0:
            label = self.ai.predict(self.sample_buffer)
            print(label)
            keys = self.label_to_keys(label)
            self.keypress_manager.press(keys)
        self._ai_tick += 1
        if self._ai_tick > TICKS_PER_PREDICTION:
            self._ai_tick = 0

    def record(self, label):
        self.read_data()
        if len(self.sample_buffer[0]) < SAMPLE_WINDOW_SIZE:
            # Sample buffer not full yet
            return

        record = [label]
        record.extend(self.flatten_sample_buffer())
        self.recordings.append(record)
        if '-v' in sys.argv:
            print(label)

    def start_recording(self):
        self.connect_serial()
        self.throw_away_first_line()
        self.need_to_rebuild_training_data = True

    def stop_recording(self):
        self._flush_sample_buffer()

    def _flush_sample_buffer(self):
        for channel in self.sample_buffer:
            channel.clear()

    def throw_away_first_line(self):
        # because we may start reading in the middle of a line
        self.serial_connection.reset_input_buffer()
        self.serial_connection.readline()
        self.reads_per_second_time = time.time()
        self.reads_per_second_counter = 0

    def read_data(self):
        if time.time() > self.reads_per_second_time + 1:
            print("Serial port reads per second: %d" % self.reads_per_second_counter)
            self.reads_per_second_time = time.time()
            self.reads_per_second_counter = 0
        self.reads_per_second_counter += 1

        line = self.serial_connection.readline()
        decoded = line.decode('utf-8').strip()
        elements = decoded.strip().split('\t')
        signals = []
        for channel, element in enumerate(elements):
            try:
                key, value = element.split(':')
            except ValueError as e:
                print(e)
                print(f'element was: {element}')
            else:
                # This automatically throws away the oldest sample due to collections.deque:
                self.sample_buffer[channel].append(float(value))
        #print([channel[-1] for channel in self.sample_buffer])

    def flatten_sample_buffer(self):
        data_points = []
        for channel in self.sample_buffer:
            data_points.extend(channel)
        return data_points

    def serialize_recordings(self, stream):
        writer = csv.writer(stream)
        for record in self.recordings:
            writer.writerow(record)

    def unserialize_recordings(self, stream):
        self.recordings = []
        reader = csv.reader(stream)
        for row in reader:
            for i in range(1, len(row)):
                row[i] = float(row[i])
            self.recordings.append(row)
        self.need_to_rebuild_training_data = True

    def start_train(self):
        if not self.ai:
            self.ai = MyoAI(self.num_signals, SAMPLE_WINDOW_SIZE)
        if self.need_to_rebuild_training_data:
            self.ai.generate_training_data(self.recordings)
            self.need_to_rebuild_training_data = False
        if not self.ai.model:
            self.ai.generate_nn()
        self.ai.nn_fit()

    def save_model(self, path=MODEL_FILE):
        self.ai.save_model(path)

    def load_model(self, path=MODEL_FILE):
        if not self.ai:
            self.ai = MyoAI(self.num_signals, SAMPLE_WINDOW_SIZE)
        self.ai.load_model(path)
        self.need_to_rebuild_training_data = True

    @staticmethod
    def keys_to_label(key_list):
        label = '|'.join(sorted([key for key in key_list if not key.startswith('Alt_')]))
        if len(label) == 0:
            return LABEL_NO_KEY
        return label

    @staticmethod
    def label_to_keys(label):
        if label == LABEL_NO_KEY:
            return None
        return label.split('|')

class Window(Frame):

    def __init__(self, master=None):
        self.myo = Backend()
        Frame.__init__(self, master)
        self.master = master

        self.do_record = False
        self.ai_active = False

        menu = Menu(self.master)
        self.master.config(menu=menu)

        fileMenu = Menu(menu)
        fileMenu.add_command(label="Start/Resume Recording", command=self.start_recording, accelerator='F1')
        fileMenu.add_command(label="Stop Recording or AI", command=self.stop, accelerator='Esc')
        fileMenu.add_command(label="Train AI", command=self.start_train, accelerator='Ctrl+w')
        fileMenu.add_command(label="Activate AI", command=self.start_ai, accelerator='Ctrl+a')
        fileMenu.add_command(label="Save neural network", command=self.myo.save_model, accelerator='Ctrl+S')
        fileMenu.add_command(label="Load neural network", command=self.myo.load_model, accelerator='Ctrl+L')
        fileMenu.add_command(label="Save recorded data", command=self.save_record, accelerator='Ctrl+Shift+S')
        fileMenu.add_command(label="Load recorded data", command=self.load_record, accelerator='Ctrl+Shift+L')
        fileMenu.add_command(label="Reset recordings", command=self.reset, accelerator='Ctrl+R')
        fileMenu.add_command(label="Exit", command=self.quit, accelerator='Ctrl+Q')
        menu.add_cascade(label="File", menu=fileMenu)
        self.bind_all("<Control-a>", self.start_ai)
        self.bind_all("<Control-w>", self.start_train)
        self.bind_all("<Control-q>", self.quit)
        self.bind_all("<Control-s>", lambda event: self.myo.save_model())
        self.bind_all("<Control-l>", lambda event: self.myo.load_model())
        self.bind_all("<Control-S>", self.save_record)
        self.bind_all("<Control-L>", self.load_record)
        self.bind_all("<Control-r>", self.reset)
        self.bind_all("<F1>", self.start_recording)
        self.bind_all("<Escape>", self.stop)

        self.keytracker = KeyTracker()
        self.keydebouncer = KeyDebouncer(self.keytracker.keypress,
                self.keytracker.keyrelease, KEY_DEBOUNCER_DELAY)
        root.bind_all('<KeyPress>', self.keydebouncer.pressed)
        root.bind_all('<KeyRelease>', self.keydebouncer.released)

    def quit(self, event=None):
        exit()

    def start_recording(self, event=None):
        if self.do_record:
            print('Already recording.')
            return
        print('Start/Resume recording!')
        self.do_record = True
        self.myo.start_recording()
        self.record_tick()

    def record_tick(self):
        if self.do_record:
            label = self.myo.keys_to_label(self.keytracker.pressed_keys)
            self.myo.record(label)
            self.after(1, self.record_tick)

    def stop(self, event=None):
        if self.ai_active:
            print(f'Disabling AI')
            self.myo.ai_deactivate()
            self.ai_active = False
        elif self.do_record:
            print(f'Paused recording. Got {len(self.myo.recordings)} data points so far.')
            self.do_record = False
        else:
            print('Not recording, AI not running either. Nothing to do.')

    def start_ai(self, event=None):
        self.ai_active = True
        self.myo.ai_activate()
        self.ai_tick()

    def ai_tick(self):
        if self.ai_active:
            self.myo.ai_tick()
            self.after(1, self.ai_tick)

    def save_record(self, event=None):
        print(f'Saving {len(self.myo.recordings)} data points...')
        with open(DATA_FILE, 'w') as stream:
            self.myo.serialize_recordings(stream)
        print(f'Saved {len(self.myo.recordings)} data points')

    def load_record(self, event=None):
        print(f'Loading data points...')
        with open(DATA_FILE, 'r') as stream:
            self.myo.unserialize_recordings(stream)
        #pprint.pprint(self.myo.recordings)
        print(f'Loaded {len(self.myo.recordings)} data points')

    def reset(self, event=None):
        self.stop()
        print('Clearing recorded datapoints')
        self.myo.reset()

    def start_train(self, event=None):
        self.myo.start_train()

#    def plot(self):
#        fig = Figure(figsize=(5, 5),
#                     dpi=100)
#        y = [i**2 for i in range(101)]
#        plot1 = fig.add_subplot(111)
#        plot1.plot(y) 
#        canvas = FigureCanvasTkAgg(fig, master=self.master)  
#        canvas.draw()
#        canvas.get_tk_widget().pack()
        
root = Tk()
app = Window(root)
root.geometry("500x500")
root.wm_title("Calibrator")
root.mainloop()
