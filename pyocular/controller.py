from pyocular.gui import MyocularUIWindow
import pyocular
import tkinter as tk
import numpy as np
import logging

class Controller:
    def __init__(self):
        self.BLE = None

    def run(self):
        self.launch_gui()

    def launch_gui(self):
        root = tk.Tk()
        self.gui = MyocularUIWindow(root, self)
        root.geometry("640x480")
        root.wm_title("MyocularUI")
        root.mainloop()

    def quit(self, event=None):
        raise SystemExit(0)

    def connectBLE(self, event=None):
        self.gui.log('connecting...')
        if not self.BLE:
            address = self.gui.ble_address_stringvar.get()
            BackendClass = list(pyocular.bluetooth.BACKENDS.values())[0]
            self.BLE = BackendClass(address)
        self.BLE.connect()

    def disconnectBLE(self, event=None):
        self.gui.log('disconnecting...')
        if self.BLE:
            self.BLE.disconnect()
        else:
            logging.error("BLE not initialized yet")
