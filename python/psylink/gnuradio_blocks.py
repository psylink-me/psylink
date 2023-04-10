"""
This file contains various GNURadio blocks, which you can import from GNURadio.
"""

import importlib
import os.path
import sys

import numpy as np
from gnuradio import gr

import psylink.config
from psylink.config import DEFAULT_BLE_ADDRESS

EMG_CHANNELS = 8  # This is normally obtained from the PsyLink on the fly, but GNURadio needs to know it in advance.
SIGNAL_COUNT = EMG_CHANNELS + psylink.config.IMU_CHANNELS


class BLESource(gr.basic_block):
    """
    This block connects to the PsyLink device with the provided MAC address and streams its signals.
    """
    def __init__(self, ble_mac=DEFAULT_BLE_ADDRESS):
        import psylink.protocol

        gr.basic_block.__init__(self, name='BLE Source', in_sig=[], out_sig=[np.float32] * SIGNAL_COUNT)
        self.ble_mac = ble_mac
        self.last_sample_count = 2048  # some large conservative value
        self.BLE = None
        self.BLE_decoder = psylink.protocol.BLEDecoder(sample_value_offset=0)
        self.actual_channels = SIGNAL_COUNT  # will be updated with data from device

    def general_work(self, input_items, output_items):
        count = 0
        pipe = self.BLE.pipe
        limit = len(output_items[0]) - self.last_sample_count
        while not pipe.empty() and count < limit:
            packet = pipe.get()
            data = self.BLE_decoder.decode_packet(packet)
            samples = data['samples']
            transposed = np.transpose(samples)
            for channel_id in range(min(SIGNAL_COUNT, self.actual_channels)):
                channel = output_items[channel_id]
                channel[count:count+len(samples)] = transposed[channel_id] / 256
            count += len(samples)
            self.last_sample_count = len(samples)
            limit = len(output_items[0]) - self.last_sample_count
        return count

    def start(self):
        import psylink.bluetooth
        import psylink.protocol

        if self.BLE:
            print("Error: Bluetooth Thread already running!")
            return False

        # Reset state
        importlib.reload(psylink.bluetooth)
        importlib.reload(psylink.protocol)

        BackendClass = list(psylink.bluetooth.BACKENDS.values())[0]
        self.BLE = BackendClass(self.ble_mac)
        self.BLE.connect()
        self.actual_channels = self.BLE_decoder.decode_channel_count(self.BLE.read_channels())
        self.BLE.thread_start()

        return True

    def stop(self):
        if self.BLE:
            self.BLE.disconnect()
            self.BLE.thread_stop()
            self.BLE = None
        return True


class ShiftBlock(gr.interp_block):
    """
    By default, GNURadio plotting blocks ("QT GUI Time Sink") buffer a number
    of signals and once the buffer is filled, it displays them all at once.

    Instead, we want to watch signals as soon as they come in.

    This block works like a shift register for incoming signals. It outputs the
    last N signals repeatedly, fast enough to keep the buffers of the "QT GUI
    Time Sinks" always filled. This forces the time sinks to operate in a
    "rolling window" mode.
    """

    def __init__(self, number_of_points=1024):
        gr.interp_block.__init__(
            self,
            name='Shifting Block',
            interp=10 * number_of_points,  # a large number to ensure that output_items is large enough
            in_sig=[np.float32] * SIGNAL_COUNT,
            out_sig=[np.float32] * SIGNAL_COUNT,
        )
        self.number_of_points = number_of_points
        self.buffer = np.zeros((SIGNAL_COUNT, self.number_of_points), dtype=np.float64)

    def work(self, input_items, output_items):
        n_inputs = min(self.number_of_points, len(input_items[0]))
        self.buffer = np.roll(self.buffer, shift=-n_inputs, axis=1)
        for channel in range(SIGNAL_COUNT):
            self.buffer[channel][-n_inputs:] = input_items[channel][:n_inputs]
            output_items[channel][:self.number_of_points] = self.buffer[channel]
            self.consume(channel, n_inputs)
        return self.number_of_points
