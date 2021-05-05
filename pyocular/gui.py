import tkinter as tk
import pyocular.config


TEXT_NOT_RECORDING = "Not recording"
TEXT_UNKNOWN = "Unknown"
CANVAS_HEIGHT = 200
CANVAS_WIDTH = 630


class MyocularUIWindow(tk.Frame):
    def __init__(self, root, controller):
        tk.Frame.__init__(self, root)
        self.root = root
        self.controller = controller
        self.pack(side=tk.TOP, fill='x')

        menu = tk.Menu(self.root, relief=tk.FLAT)
        self.root.config(menu=menu)

        paneSettingsState = tk.PanedWindow(self, orient=tk.HORIZONTAL)
        paneSettingsState.pack(fill='x')

        # ===============
        # Settings
        # ===============
        settingFrame = tk.LabelFrame(paneSettingsState, text="Configuration")
        paneSettingsState.add(settingFrame)
        #settingFrame.pack(side=tk.TOP, fill='both', expand='yes')

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
        #stateFrame.pack(side=tk.TOP, fill='both', expand='yes')

        connection_frame = tk.Frame(stateFrame)
        connection_frame.pack(side=tk.TOP, fill='x')
        connection_label = tk.Label(connection_frame, text="Connection: ")
        connection_label.pack(side=tk.LEFT)
        self.connection_value = tk.Label(connection_frame, text=TEXT_UNKNOWN)
        self.connection_value.pack(side=tk.LEFT)

        recording_frame = tk.Frame(stateFrame)
        recording_frame.pack(side=tk.TOP, fill='x')
        recording_label = tk.Label(recording_frame, text="Pressed keys: ")
        recording_label.pack(side=tk.LEFT)
        self.recording_value = tk.Label(recording_frame, text=TEXT_NOT_RECORDING)
        self.recording_value.pack(side=tk.LEFT)

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
        self.canvas.config(bg=pyocular.util.viridis_map(0, 0, 256))

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

    def log(self, text):
        text = str(text)
        if not text.endswith('\n'):
            text += '\n'
        self.logText['state'] = tk.NORMAL
        self.logText.insert(tk.END, text)
        self.logText['state'] = tk.DISABLED