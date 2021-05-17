import numpy as np
import math

SAMPLE_VALUE_OFFSET = -127

# Keep these in sync with arduino code.
DELAY_PARAM_A = -11.3384217
DELAY_PARAM_B = 1.93093431

class BLEDecoder:
    def __init__(self, sample_value_offset=SAMPLE_VALUE_OFFSET):
        self.channels = None
        self.sample_value_offset = sample_value_offset
        self.last_tick = None

    def decode_packet(self, bytes_):
        """
        Takes bytes as argument, as received from the BLE characteristic of PsyLink

        returns {
            'channels': Number of channels,
            'tick': a number between 1 and 256 that gets incremented on each chraracteristic update
            'sample_count': Number of samples,
            'min_sampling_delay': The approx. minimum time in milliseconds between sample reads,
            'max_sampling_delay': The approx. maximum time in milliseconds between sample reads,
            'samples': np.array([...], dtype=np.int),
            'is_duplicate': Boolean,
        }
        """
        if self.channels is None:
            raise Exception("Please read and decode the characteristic for the"
                " channel count before running this method. Alternatively, set"
                " the channel count manually with e.g. `decoder.channels = 1`")

        # Decoding Metadata (as documented in Arduino code)
        tick = bytes_[0]
        delays = bytes_[1]
        min_sampling_delay = self._decompress_delay((delays & 0xf0) >> 4)
        max_sampling_delay = self._decompress_delay(delays & 0x0f)

        is_duplicate = False
        if self.last_tick is not None:
            is_duplicate = tick == self.last_tick

        # Decoding Sample data
        sample_values = bytes_[2:]
        channels = self.channels
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

        self.last_tick = tick

        return {
            'channels': channels,
            'tick': tick,
            'min_sampling_delay': min_sampling_delay,
            'max_sampling_delay': max_sampling_delay,
            'sample_count': sample_count,
            'samples': samples,
            'is_duplicate': is_duplicate,
        }

    @staticmethod
    def _decompress_delay(delay):
        # this reverses COMPRESS_DELAY in Arduino code
        return math.exp((delay - DELAY_PARAM_A) / DELAY_PARAM_B)

    def decode_channel_count(self, byte):
        self.channels = int.from_bytes(byte, 'little')
        print("Channels = %d" % self.channels)
        return self.channels
