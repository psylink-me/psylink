"""
Keeps a copy of the last N signals and outputs them at a constant rate,
so that you can use QT GUI sinks in a "rolling" mode.
"""

import numpy as np
from gnuradio import gr


class ShiftBlock(gr.interp_block):
    def __init__(self, number_of_points=1024):
        gr.interp_block.__init__(
            self,
            name='Shifting Block',
            interp=10 * number_of_points,  # a large number to ensure that output_items is large enough
            in_sig=[np.float32],
            out_sig=[np.float32]
        )
        self.number_of_points = number_of_points
        self.buffer = np.zeros(self.number_of_points, dtype=np.float64)

    def work(self, input_items, output_items):
        n_inputs = min(self.number_of_points, len(input_items[0]))
        self.buffer = np.roll(self.buffer, -n_inputs)
        self.buffer[-n_inputs:] = input_items[0][:n_inputs]
        output_items[0][:self.number_of_points] = self.buffer
        self.consume(0, n_inputs)
        return self.number_of_points
