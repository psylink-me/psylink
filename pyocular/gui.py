from PIL import Image, ImageTk # pylint: disable=no-name-in-module
import numpy as np
import tkinter as tk
import pyocular.config
from matplotlib import cm

TEXT_UNKNOWN = "Unknown"
CANVAS_HEIGHT = 200
CANVAS_WIDTH = 630


class MyocularUIWindow(tk.Frame):
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
                "Run name", pyocular.config.DEFAULT_RUN_NAME)

        self.ble_address_stringvar = add_entry(settingFrame,
                "BLE address", pyocular.config.DEFAULT_BLE_ADDRESS)

        self.epochs_stringvar = add_entry(settingFrame,
                "Training epochs", pyocular.config.DEFAULT_TRAINING_EPOCHS)

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

        self.connection_value = add_label(stateFrame, 'Connection: ', TEXT_UNKNOWN)
        self.pressed_keys_value = add_label(stateFrame, 'Pressed keys: ', "")
        self.channels_value = add_label(stateFrame, 'Channels: ', TEXT_UNKNOWN)

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
        fileMenu = tk.Menu(menu, tearoff=0, relief=tk.GROOVE)
        fileMenu.add_command(label="Exit", command=self.controller.quit, accelerator='Ctrl+Q')

        menu.add_cascade(label="File", menu=fileMenu)

        connectMenu = tk.Menu(menu, tearoff=0, relief=tk.GROOVE)
        connectMenu.add_command(label="BLE Connect", command=self.controller.connectBLE, accelerator='Ctrl+B')
        connectMenu.add_command(label="BLE Disconnect", command=self.controller.disconnectBLE, accelerator='Ctrl+Shift+B')
        menu.add_cascade(label="Connect", menu=connectMenu)

        self.bind_all("<Control-q>", self.controller.quit)
        self.bind_all("<Control-b>", self.controller.connectBLE)
        self.bind_all("<Control-B>", self.controller.disconnectBLE)
        self.bind_all("<F1>", self.controller.debug_action)

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

    def set_pressed_keys(self, pressed_keys):
        self.pressed_keys_value.config(text=','.join(pressed_keys))

    def set_channels(self, channels):
        self.channels_value.config(text=str(channels))

    def get_BLE_address(self):
        return self.ble_address_stringvar.get()

    def get_run_name(self):
        return self.run_name_stringvar.get()

    def get_epochs(self):
        return self.epochs_stringvar.get()

    def draw_signals(self):
        if self._stop_drawing_signals:
            return

        # https://stackoverflow.com/questions/53308708/
        signals = self.controller.get_signal_image(CANVAS_WIDTH, CANVAS_HEIGHT)
        array = signals
        array = np.uint8(cm.viridis(array)*255)
        image = Image.fromarray(array, mode='RGBA')
        imgtk = ImageTk.PhotoImage(image=image)
        self._asdf69 = imgtk  # avoid garbage collection: https://stackoverflow.com/a/49309510
        self.canvas.create_image(0, 0, image=imgtk, anchor=tk.NW)
        if self._stop_drawing_signals:
            self._stop_drawing_signals = False
        else:
            self.after(100, self.draw_signals)

    def start_drawing_signals(self):
        self._stop_drawing_signals = False
        self.draw_signals()

    def stop_drawing_signals(self):
        self._stop_drawing_signals = True
