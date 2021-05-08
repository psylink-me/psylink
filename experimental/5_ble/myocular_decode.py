import numpy as np

def myocular_decode(bytes_):
    samples = np.zeros(len(bytes_), dtype=np.int)
    for i, b in enumerate(bytes_):
        samples[i] = b
    return samples
    #return int.from_bytes(bytes_, 'little')
