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
from tkinter import * 
from lib import KeyDebouncer, KeyTracker
#from matplotlib.figure import Figure
#from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg

KEY_DEBOUNCER_DELAY = 0.05

class Backend:
    def __init__(self):
        self.serial_connection = None
        self.serial_port = '/dev/ttyACM0'
        self.baudrate = 115200
        self.recording = []  # a list of lists like [label, signal1, signal2, ...] 

    def connect_serial(self):
        if not self.serial_connection:
            self.serial_connection = serial.Serial(
                port=self.serial_port,
                baudrate=self.baudrate,
                timeout=.1
            )

    def record(self, label):
        self.recording.append([label] + self.parse())

    def throw_away_first_line(self):
        # because we may start reading in the middle of a line
        self.serial_connection.readline()

    def parse(self):
        line = self.serial_connection.readline()
        decoded = line.decode('utf-8').strip()
        elements = decoded.strip().split('\t')
        signals = []
        for element in elements:
            try:
                key, value = element.split(':')
            except ValueError as e:
                print(e)
                print(f'element was: {element}')
            else:
                signals.append(float(value))
        return signals

    def serialize_recording(self, stream):
        writer = csv.writer(stream)
        for record in self.recording:
            writer.writerow(record)

    def unserialize_recording(self, stream):
        self.recording = []
        reader = csv.reader(stream)
        for row in reader:
            for i in range(1, len(row)):
                row[i] = float(row[i])
            self.recording.append(row)

    @staticmethod
    def keys_to_label(key_list):
        return '|'.join(sorted(key_list))

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
        print(f'Paused recording. Got {len(self.myo.recording)} data points so far.')
        self.do_record = False

    def save_record(self, event=None):
        with open(self.DATA_FILE, 'w') as stream:
            self.myo.serialize_recording(stream)
        print(f'Saved {len(self.myo.recording)} data points')

    def load_record(self, event=None):
        with open(self.DATA_FILE, 'r') as stream:
            self.myo.unserialize_recording(stream)
        pprint.pprint(self.myo.recording)
        print(f'Loaded {len(self.myo.recording)} data points')

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
