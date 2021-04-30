import numpy as np

SAMPLE_VALUE_OFFSET = -127

def decode_ble_packet(bytes_):
    """
    Takes bytes as argument, as received from the BLE characteristic of Myocular

    returns {
        'channels': Number of channels,
        'sample_count': Number of samples,
        'samples': np.array([...], dtype=np.int),
    }
    """
    channels = bytes_[0]
    sample_values = bytes_[1:]
    sample_count = len(sample_values)
    samples = np.zeros((sample_count, channels), dtype=np.int)

    channel = 0
    sample_id = 0
    for sample_value in sample_values:
        samples[sample_id][channel] = sample_value + SAMPLE_VALUE_OFFSET
        channel += 1
        if channel >= channels:
            channel = 0
            sample_id += 1

    return {
        'channels': channels,
        'sample_count': sample_count,
        'samples': samples,
    }
