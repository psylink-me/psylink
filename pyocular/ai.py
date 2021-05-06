from tensorflow import keras
from tensorflow.keras.models import load_model
import logging
import math
import numpy as np
import pyocular
import tensorflow as tf

class TrainingData:
    def __init__(self):
        self.channels = pyocular.config.DEFAULT_CHANNELS
        self.clear()

    def clear(self):
        self.features = np.zeros((
            pyocular.config.FEATURE_BUFFER_SIZE,
            self.get_window_size(),
            self.channels,
        ), dtype=np.uint8)
        self.labels = []
        self.all_labels = []
        self.current_index = 0

    def get_window_size(self):
        return pyocular.config.FEATURE_WINDOW_SIZE

    def get_recorded_samples(self):
        return self.current_index

    def set_channels(self, channels):
        if channels != self.channels:
            self.channels = channels
            logging.warning("Number of channels has changed. Resetting training data.")
            self.clear()

    def append(self, features, label):
        """
        feature: a 2D numpy array in shape = (self.channels, self.get_window_size())
        label: string
        """
        self.features[self.current_index] = features
        self.labels.append(label)
        print(label)
        self.current_index += 1
        if self.current_index >= self.features.shape[0]:
            # Array full, enlarge it
            pad = pyocular.config.FEATURE_BUFFER_SIZE
            self.features = np.pad(self.features, ((0, pad), (0, 0), (0, 0)))

class AI:
    def __init__(self):
        self.training_data = TrainingData()
