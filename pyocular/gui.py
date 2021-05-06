from PIL import Image, ImageTk
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

        ble_address_label = tk.Label(settingFrame, text="BLE Address")
        ble_address_label.pack(side=tk.LEFT)

        self.ble_address_stringvar = tk.StringVar()
        self.ble_address_stringvar.set(pyocular.config.DEFAULT_BLE_ADDRESS)
        ble_address_entry = tk.Entry(settingFrame, textvariable=self.ble_address_stringvar)
        ble_address_entry.pack(side=tk.RIGHT)

        # ===============
        # State
        # ===============
        stateFrame = tk.LabelFrame(paneSettingsState, text="State")
        paneSettingsState.add(stateFrame)

        connection_frame = tk.Frame(stateFrame)
        connection_frame.pack(side=tk.TOP, fill='x')
        connection_label = tk.Label(connection_frame, text="Connection: ")
        connection_label.pack(side=tk.LEFT)
        self.connection_value = tk.Label(connection_frame, text=TEXT_UNKNOWN)
        self.connection_value.pack(side=tk.LEFT)

        pressed_keys_frame = tk.Frame(stateFrame)
        pressed_keys_frame.pack(side=tk.TOP, fill='x')
        pressed_keys_label = tk.Label(pressed_keys_frame, text="Pressed keys: ")
        pressed_keys_label.pack(side=tk.LEFT)
        self.pressed_keys_value = tk.Label(pressed_keys_frame, text="")
        self.pressed_keys_value.pack(side=tk.LEFT)

        channels_frame = tk.Frame(stateFrame)
        channels_frame.pack(side=tk.TOP, fill='x')
        channels_label = tk.Label(channels_frame, text="Channels: ")
        channels_label.pack(side=tk.LEFT)
        self.channels_value = tk.Label(channels_frame, text=TEXT_UNKNOWN)
        self.channels_value.pack(side=tk.LEFT)

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
