# Inspired by https://colab.research.google.com/github/tensorflow/tensorflow/blob/8855f56500ff8efa449662a95fe69f24bb78c0a6/tensorflow/lite/micro/examples/hello_world/train/train_hello_world_model.ipynb
import tensorflow as tf
from tensorflow import keras
import numpy as np
#import pandas as pd
#import matplotlib.pyplot as plt
import math

class MyoAI:
    BATCH_SIZE = 64
    def __init__(self, num_channels, window_size):
        # Set seed for experiment reproducibility
        seed = 1
        np.random.seed(seed)
        tf.random.set_seed(seed)
        self.num_channels = num_channels
        self.window_size = window_size
        self.training_data_generated = False

    def generate_training_data(self, values, train_split=0.6, test_split=0.2):
        # "values" is a flat array of [label, v1c1, v2c1, v3c1, ..., v1c2, ...]
        # where "v1c2" means "signal value at time step 1 of channel/electrode 2"

        print('Generating training data...')

        #window_size = int((len(values[0]) - 1.0) / self.num_channels)

        self.possible_labels = list(sorted(set(item[0] for item in values)))

        self.labels = np.zeros([len(values), len(self.possible_labels)])
        #self.samples = np.zeros([len(values), len(values[0])-1])
        self.samples = np.zeros([len(values), self.num_channels, self.window_size])
        # Index meanings: self.samples[which_sample][which_signal][which_time_step] = signal_value

        # Split up the flat "values" list into distinct channels
        for sample_id, sample in enumerate(values):
            self.labels[sample_id][self.possible_labels.index(sample[0])] = 1
            for channel in range(self.num_channels):
                start = 1 + channel * self.window_size
                end = 1 + (channel + 1) * self.window_size
                self.samples[sample_id][channel] = sample[start:end]

        #import pprint; pprint.pprint(self.samples)
        #import pprint; pprint.pprint(self.labels)

        train_split_index = int(len(self.samples) * train_split)
        test_split_index = int(len(self.samples) * test_split) + train_split_index

        self.labels, self.samples = unison_shuffled_copies(self.labels, self.samples)

        self.labels_train, self.labels_test, self.labels_validate = np.split(
                self.labels, [train_split_index, test_split_index])
        self.samples_train, self.samples_test, self.samples_validate = np.split(
                self.samples, [train_split_index, test_split_index])

        print('Generating training data... DONE')
        self.training_data_generated = True

    def generate_nn(self):
        if not self.training_data_generated:
            print("No training data generated yet!")
            return

        self.model = model = tf.keras.Sequential()

        #input_shape = (self.BATCH_SIZE, self.num_channels, self.window_size)
        input_shape = (self.num_channels, self.window_size)
        conv_layer_1 = tf.keras.layers.Conv1D(
                filters=64,  # number of outputs
                kernel_size=5,
                strides=1,
                padding='same',
                #dilation_rate=????,
                groups=1,
                activation='relu',
                input_shape=input_shape,
        )
        model.add(conv_layer_1)
        model.add(tf.keras.layers.Flatten())

        dense_layer_1 = tf.keras.layers.Dense(64, activation='relu')
        model.add(dense_layer_1)

        dense_layer_2 = tf.keras.layers.Dense(64, activation='relu')
        model.add(dense_layer_2)

        output_layer = tf.keras.layers.Dense(len(self.possible_labels), activation='softmax')
        model.add(output_layer)

        model.compile(
                optimizer='adam', 
                loss='binary_crossentropy',
                metrics=['accuracy']
        )
        #model.compile(optimizer='adam', loss='mse', metrics=['mae'])
        print(model)

        return model

    def nn_fit(self):
        print(f'samples_train shape: {self.samples_train.shape}')
        print(f'labels_train shape: {self.labels_train.shape}')
        history = self.model.fit(
                self.samples_train,
                self.labels_train,
                batch_size=self.BATCH_SIZE,
                epochs=300,
        )

def unison_shuffled_copies(a, b):
    # https://stackoverflow.com/a/4602224
    assert len(a) == len(b)
    p = np.random.permutation(len(a))
    return a[p], b[p]
