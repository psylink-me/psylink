import numpy as np
import math

SAMPLE_VALUE_OFFSET = -127

class BLEDecoder:
    def __init__(self, sample_value_offset=SAMPLE_VALUE_OFFSET):
        self.channels = None
        self.sample_value_offset = sample_value_offset

    def decode_packet(self, bytes_):
        """
        Takes bytes as argument, as received from the BLE characteristic of Myocular

        returns {
            'channels': Number of channels,
            'tick': a number between 1 and 256 that gets incremented on each chraracteristic update
            'sample_count': Number of samples,
            'samples': np.array([...], dtype=np.int),
        }
        """
        if self.channels is None:
            raise Exception("Please read and decode the characteristic for the"
                " channel count before running this method. Alternatively, set"
                " the channel count manually with e.g. `decoder.channels = 1`")

        channels = self.channels
        tick = bytes_[0]
        sample_values = bytes_[1:]
        if len(sample_values) % channels != 0:
            # ensure it's divisible by number of channels:
            sample_values[-(len(sample_values) % channels):] = []
        sample_count = math.floor(len(sample_values) / channels)
        samples = np.zeros((sample_count, channels), dtype=np.int)

        channel = 0
        sample_id = 0
        for sample_value in sample_values:
            samples[sample_id][channel] = sample_value + self.sample_value_offset
            channel += 1
            if channel >= channels:
                channel = 0
                sample_id += 1

        return {
            'channels': channels,
            'tick': tick,
            'sample_count': sample_count,
            'samples': samples,
        }

    def decode_channel_count(self, byte):
        self.channels = int.from_bytes(byte, 'little')
        print("Channels = %d" % self.channels)
        return self.channels
