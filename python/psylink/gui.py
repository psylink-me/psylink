from PIL import Image, ImageTk # pylint: disable=no-name-in-module
import numpy as np
import tkinter as tk
import psylink.config
from matplotlib import cm

TEXT_UNKNOWN = "Unknown"
TEXT_NOT_CONNECTED = 'Not connected'
CANVAS_HEIGHT = 200
CANVAS_WIDTH = 630


class PsyLinkUIWindow(tk.Frame):
    def __init__(self, root, controller):
        tk.Frame.__init__(self, root)
        self.root = root
        self.controller = controller
        self._stop_drawing_signals = False
        self.has_quit = False
        self.pack(side=tk.TOP, fill='x')
        self.setup_widgets()

    def setup_widgets(self):
        menu = tk.Menu(self.root, relief=tk.FLAT)
        self.root.config(menu=menu)

        paneSettingsState = tk.PanedWindow(self, orient=tk.HORIZONTAL)
        paneSettingsState.pack(fill='x')

        # ===============
        # Settings
        # ===============
        settingFrame = tk.LabelFrame(paneSettingsState, text="Configuration")
        paneSettingsState.add(settingFrame)

        def add_entry(parent, label, text):
            tmpframe = tk.Frame(parent)
            tmpframe.pack(side=tk.TOP, fill='x')
            tmplabel = tk.Label(tmpframe, text=label)
            tmplabel.pack(side=tk.LEFT)
            tmpstringvar = tk.StringVar()
            tmpstringvar.set(text)
            tmpentry = tk.Entry(tmpframe, textvariable=tmpstringvar)
            tmpentry.pack(side=tk.RIGHT)
            return tmpstringvar

        self.run_name_stringvar = add_entry(settingFrame,
                "Run name", psylink.config.DEFAULT_RUN_NAME)

        self.ble_address_stringvar = add_entry(settingFrame,
                "BLE address", psylink.config.DEFAULT_BLE_ADDRESS)

        self.epochs_stringvar = add_entry(settingFrame,
                "Training epochs", psylink.config.DEFAULT_TRAINING_EPOCHS)

        # ===============
        # State
        # ===============
        stateFrame = tk.LabelFrame(paneSettingsState, text="State")
        paneSettingsState.add(stateFrame)

        def add_label(parent, label, text):
            tmpframe = tk.Frame(parent)
            tmpframe.pack(side=tk.TOP, fill='x')
            tmplabel1 = tk.Label(tmpframe, text=label)
            tmplabel1.pack(side=tk.LEFT)
            tmplabel2 = tk.Label(tmpframe, text=text)
            tmplabel2.pack(side=tk.LEFT)
            return tmplabel2

        self.connection_value = add_label(stateFrame, 'Connection: ', TEXT_NOT_CONNECTED)
        self.pressed_keys_value = add_label(stateFrame, 'Pressed keys: ', "")
        self.channels_value = add_label(stateFrame, 'Channels: ', TEXT_UNKNOWN)
        self.recorded_samples_value = add_label(stateFrame, 'Recorded samples: ', '0')
        self.label_count_value = add_label(stateFrame, 'Number of recorded key combinations: ', '0')
        self.delays = add_label(stateFrame, 'Approx. sampling intervals: ', TEXT_UNKNOWN)

        # ===============
        # Signals
        # ===============
        signalFrame = tk.LabelFrame(self, text="Signals")
        signalFrame.pack(side=tk.TOP, fill='x', expand='yes')

        self.canvas = tk.Canvas(signalFrame, height=CANVAS_HEIGHT, width=CANVAS_WIDTH)
        self.canvas.pack()

        # ===============
        # Log
        # ===============
        logFrame = tk.LabelFrame(self, text="Messages")
        logFrame.pack(side=tk.TOP, fill='x')
        self.logText = tk.Text(logFrame, state=tk.DISABLED, relief=tk.FLAT, padx=6, pady=6)
        self.logText.pack()
        self.log("Welcome!")

        # ===============
        # Menu
        # ===============
        tmpMenu = tk.Menu(menu, tearoff=0, relief=tk.GROOVE)
        tmpMenu.add_command(label="Stop current process",
                command=self.controller.stop_current_process, accelerator='Esc')
        tmpMenu.add_command(label="Save recorded samples",
                command=self.controller.save_records, accelerator='Ctrl+Shift+S')
        tmpMenu.add_command(label="Load recorded samples",
                command=self.controller.load_records, accelerator='Ctrl+Shift+L')
        tmpMenu.add_command(label="Save AI model",
                command=self.controller.save_model, accelerator='Ctrl+S')
        tmpMenu.add_command(label="Load AI model",
                command=self.controller.load_model, accelerator='Ctrl+L')
        tmpMenu.add_command(label="Exit", command=self.controller.quit, accelerator='Ctrl+Q')
        menu.add_cascade(label="File", menu=tmpMenu)

        tmpMenu = tk.Menu(menu, tearoff=0, relief=tk.GROOVE)
        tmpMenu.add_command(label="Clear messages", command=self.log_clear, accelerator='Ctrl+M')
        menu.add_cascade(label="View", menu=tmpMenu)

        tmpMenu = tk.Menu(menu, tearoff=0, relief=tk.GROOVE)
        tmpMenu.add_command(label="Start recording samples",
                command=self.controller.start_sampling, accelerator='F1')
        tmpMenu.add_command(label="Stop recording samples",
                command=self.controller.stop_current_process, accelerator='Esc')
        tmpMenu.add_separator()
        tmpMenu.add_command(label="Start training AI",
                command=self.controller.start_ai_training, accelerator='Ctrl+W')
        tmpMenu.add_command(label="Activate AI (dry run)",
                command=self.controller.start_ai_dry, accelerator='Ctrl+A')
        tmpMenu.add_command(label="Activate AI (simulate key presses)",
                command=self.controller.start_ai_simulate_keypresses, accelerator='Ctrl+Shift+A')
        tmpMenu.add_command(label="Deactivate AI",
                command=self.controller.stop_current_process, accelerator='Esc')
        tmpMenu.add_command(label="Reset AI",
                command=self.controller.reset_ai, accelerator='Ctrl+Shift+R')
        menu.add_cascade(label="AI", menu=tmpMenu)

        tmpMenu = tk.Menu(menu, tearoff=0, relief=tk.GROOVE)
        tmpMenu.add_command(label="BLE Connect", command=self.controller.connectBLE, accelerator='Ctrl+B')
        tmpMenu.add_command(label="BLE Disconnect", command=self.controller.disconnectBLE, accelerator='Ctrl+Shift+B')
        menu.add_cascade(label="Connect", menu=tmpMenu)

        self.bind_all("<Control-q>", self.controller.quit)
        self.bind_all("<Control-S>", self.controller.save_records)
        self.bind_all("<Control-L>", self.controller.load_records)
        self.bind_all("<Control-s>", self.controller.save_model)
        self.bind_all("<Control-l>", self.controller.load_model)
        self.bind_all("<Control-b>", self.controller.connectBLE)
        self.bind_all("<Control-B>", self.controller.disconnectBLE)
        self.bind_all("<Control-m>", self.log_clear)
        self.bind_all("<Control-w>", self.controller.start_ai_training)
        self.bind_all("<Control-a>", self.controller.start_ai_dry)
        self.bind_all("<Control-A>", self.controller.start_ai_simulate_keypresses)
        self.bind_all("<Control-R>", self.controller.reset_ai)
        self.bind_all("<F1>", self.controller.start_sampling)
        self.bind_all("<Escape>", self.controller.stop_current_process)
        self.bind_all("<F12>", self.controller.debug_action)

        self.refresh_values()

    def quit(self):
        if not self.has_quit:
            self.root.quit()
            self.has_quit = True

    def log(self, text):
        if self.has_quit:
            print(text)
            return
        text = str(text)
        if not text.endswith('\n'):
            text += '\n'
        self.logText['state'] = tk.NORMAL
        self.logText.insert(tk.END, text)
        self.logText['state'] = tk.DISABLED
        self.update()

    def log_clear(self, event=None):
        self.logText['state'] = tk.NORMAL
        self.logText.delete('1.0', tk.END)
        self.logText['state'] = tk.DISABLED

    def set_pressed_keys(self, pressed_keys):
        self.pressed_keys_value.config(text=','.join(pressed_keys))

    def set_channels(self, channels):
        self.channels_value.config(text=str(channels))

    def set_recorded_samples(self, count):
        self.recorded_samples_value.config(text=str(count))

    def get_BLE_address(self):
        return self.ble_address_stringvar.get()

    def get_run_name(self):
        return self.run_name_stringvar.get()

    def get_epochs(self):
        return self.epochs_stringvar.get()

    def refresh_values(self):
        self.set_recorded_samples(self.controller.get_recorded_samples())
        connection = self.controller.get_active_ble_address()
        if connection is None:
            connection = TEXT_NOT_CONNECTED
        self.connection_value.config(text=connection)
        self.label_count_value.config(text=self.controller.get_number_of_labels())
        self.delays.config(text="%0.1f - %0.1fms" % self.controller.get_sampling_delays())
        self.after(1000, self.refresh_values)

    def draw_signals(self):
        if self._stop_drawing_signals:
            return

        # https://stackoverflow.com/questions/53308708/
        signals = self.controller.get_signal_image(CANVAS_WIDTH, CANVAS_HEIGHT)
        if signals is None:
            self.after(psylink.config.REDRAW_SIGNALS_DELAY, self.draw_signals)
            return

        array = signals
        array = np.uint8(cm.viridis(array)*255)
        image = Image.fromarray(array, mode='RGBA')
        imgtk = ImageTk.PhotoImage(image=image)
        self._asdf69 = imgtk  # avoid garbage collection: https://stackoverflow.com/a/49309510
        self.canvas.create_image(0, 0, image=imgtk, anchor=tk.NW)
        if self._stop_drawing_signals:
            self._stop_drawing_signals = False
        else:
            self.after(psylink.config.REDRAW_SIGNALS_DELAY, self.draw_signals)

    def start_drawing_signals(self):
        self._stop_drawing_signals = False
        self.draw_signals()

    def stop_drawing_signals(self):
        self._stop_drawing_signals = True
