#!/usr/bin/python
#
# Workflow:
# 1. start recording signals
# 2. make movements with arm, and at the same time, press the keys that the
#    movements should represent
# 3. stop recording, save data
# 4. TODO
# 5. Profit
#

import serial
import csv
import pprint
import sys
from collections import deque
from tkinter import * 
from lib import KeyDebouncer, KeyTracker
#from matplotlib.figure import Figure
#from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg

KEY_DEBOUNCER_DELAY = 0.05
SAMPLE_WINDOW_SIZE = 64
NUM_SIGNALS = 8

class Backend:
    def __init__(self, num_signals=NUM_SIGNALS):
        self.serial_connection = None
        self.serial_port = '/dev/ttyACM0'
        self.baudrate = 115200
        self.num_signals = num_signals
        self.recordings = []  # a list of lists like [label, signal1, signal2, ...] 

        # We keep the last SAMPLE_WINDOW_SIZE samples for each signal
        self.sample_buffer = []
        for _ in range(self.num_signals):
            channel = deque(maxlen=SAMPLE_WINDOW_SIZE)
            self.sample_buffer.append(channel)

    def connect_serial(self):
        if not self.serial_connection:
            self.serial_connection = serial.Serial(
                port=self.serial_port,
                baudrate=self.baudrate,
                timeout=.01
            )

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

    def stop_recording(self):
        for channel in self.sample_buffer:
            channel.clear()

    def throw_away_first_line(self):
        # because we may start reading in the middle of a line
        self.serial_connection.readline()

    def read_data(self):
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

    @staticmethod
    def keys_to_label(key_list):
        label = '|'.join(sorted(key_list))
        if len(label) == 0:
            return 'null'
        return label

class Window(Frame):
    DATA_FILE = 'records.csv'

    def __init__(self, master=None):
        self.myo = Backend()
        Frame.__init__(self, master)
        self.master = master

        self.do_record = False

        menu = Menu(self.master)
        self.master.config(menu=menu)

        fileMenu = Menu(menu)
        fileMenu.add_command(label="Start/Resume Recording", command=self.start_recording, accelerator='F1')
        fileMenu.add_command(label="Stop Recording", command=self.stop_recording, accelerator='Esc')
        fileMenu.add_command(label="Start training")
        #fileMenu.add_command(label="Save neural network", accelerator='Ctrl+S')
        fileMenu.add_command(label="Save recorded data", command=self.save_record, accelerator='Ctrl+Shift+S')
        fileMenu.add_command(label="Load recorded data", command=self.load_record, accelerator='Ctrl+Shift+L')
        fileMenu.add_command(label="Exit", command=self.quit, accelerator='Ctrl+Q')
        menu.add_cascade(label="File", menu=fileMenu)
        self.bind_all("<Control-q>", self.quit)
        self.bind_all("<Control-S>", self.save_record)
        self.bind_all("<Control-L>", self.load_record)
        self.bind_all("<F1>", self.start_recording)
        self.bind_all("<Escape>", self.stop_recording)

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
        self.myo.connect_serial()
        self.myo.throw_away_first_line()
        self.record_tick()

    def record_tick(self):
        if self.do_record:
            label = self.myo.keys_to_label(self.keytracker.pressed_keys)
            self.myo.record(label)
            self.after(1, self.record_tick)

    def stop_recording(self, event=None):
        if not self.do_record:
            print('Not recording.')
            return
        print(f'Paused recording. Got {len(self.myo.recordings)} data points so far.')
        self.do_record = False

    def save_record(self, event=None):
        with open(self.DATA_FILE, 'w') as stream:
            self.myo.serialize_recordings(stream)
        print(f'Saved {len(self.myo.recordings)} data points')

    def load_record(self, event=None):
        with open(self.DATA_FILE, 'r') as stream:
            self.myo.unserialize_recordings(stream)
        #pprint.pprint(self.myo.recordings)
        print(f'Loaded {len(self.myo.recordings)} data points')

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
