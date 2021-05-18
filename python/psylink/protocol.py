import numpy as np
import math
import logging
from psylink.config import IMU_CHANNELS

SAMPLE_VALUE_OFFSET = -127

# Keep these in sync with arduino code.
DELAY_PARAM_A = -11.3384217
DELAY_PARAM_B = 1.93093431

class BLEDecoder:
    def __init__(self, sample_value_offset=SAMPLE_VALUE_OFFSET):
        self.channels = None
        self.sample_value_offset = sample_value_offset
        self.last_tick = None

    def decode_packet(self, packet):
        """
        Argument: a packet as received from BLEBackend.thread_loop
        packet = {
            'timestamp': time.time() at the time of receiving the packet,
            'content': bytes() as sent by the PsyLink device,
        }

        returns {
            'channels': Number of channels,
            'tick': a number between 1 and 256 that gets incremented on each chraracteristic update
            'timestamp': time.time() at the time of receiving the packet,
            'sample_count': Number of samples,
            'min_sampling_delay': The approx. minimum time in milliseconds between sample reads,
            'max_sampling_delay': The approx. maximum time in milliseconds between sample reads,
            'samples': np.array([...], dtype=np.int),
            'is_duplicate': Boolean,
            'lost_packets': Number of skipped packets since last reads,
        }
        """
        timestamp = packet['timestamp']
        bytes_ = packet['content']

        if self.channels is None:
            raise Exception("Please read and decode the characteristic for the"
                " channel count before running this method. Alternatively, set"
                " the channel count manually with e.g. `decoder.channels = 1`")

        # Decoding Metadata (as documented in Arduino code)
        tick = bytes_[0]
        delays = bytes_[1]
        min_sampling_delay = self._decompress_delay((delays & 0xf0) >> 4)
        max_sampling_delay = self._decompress_delay(delays & 0x0f)

        lost_packets = 0
        is_duplicate = False
        if self.last_tick is not None:
            is_duplicate = tick == self.last_tick

            # Need to consider overflow of tick value. Its range is between 1 and incl. 255
            lost_packets = min(max(0, tick - self.last_tick - 1), tick + 255 - self.last_tick - 1)
            if lost_packets:
                logging.warn(f"Lost packets: {lost_packets}")

        gyroscope_accelerometer = list(bytes_[2:2+IMU_CHANNELS])
        assert len(gyroscope_accelerometer) == IMU_CHANNELS

        # Decoding Sample data
        sample_values = bytes_[8:]
        emg_channels = self.emg_channels

        if len(sample_values) % emg_channels != 0:
            # ensure it's divisible by number of EMG channels:
            sample_values[-(len(sample_values) % emg_channels):] = []
        sample_count = math.floor(len(sample_values) / emg_channels)
        samples = np.zeros((sample_count, self.channels), dtype=np.int)

        channel = 0
        sample_id = 0
        for sample_value in sample_values:
            samples[sample_id][channel] = sample_value + self.sample_value_offset
            channel += 1
            if channel >= emg_channels:
                channel = 0
                sample_id += 1

        # Filling in gyroscope/accelerometer channels
        for sample_id, channels in enumerate(samples):
            assert len(channels) == emg_channels + IMU_CHANNELS
            channels[emg_channels:] = gyroscope_accelerometer

        self.last_tick = tick

        return {
            'channels': self.channels,
            'tick': tick,
            'min_sampling_delay': min_sampling_delay,
            'max_sampling_delay': max_sampling_delay,
            'sample_count': sample_count,
            'samples': samples,
            'is_duplicate': is_duplicate,
            'lost_packets': lost_packets,
            'timestamp': timestamp,
        }

    @staticmethod
    def _decompress_delay(delay):
        # this reverses COMPRESS_DELAY in Arduino code
        return math.exp((delay - DELAY_PARAM_A) / DELAY_PARAM_B)

    def decode_channel_count(self, byte):
        self.emg_channels = int.from_bytes(byte, 'little')
        self.channels = self.emg_channels + IMU_CHANNELS
        return self.channels
