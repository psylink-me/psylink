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

    def compile(self):
        sample_count = self.current_index
        sample_array = self.features[:sample_count]
        label_count = self.get_label_count()
        label_array = np.full([sample_count, label_count], False, dtype=bool)
        return sample_array, label_array

    def shuffle_split(self):
        """
        Returns (labels_train, labels_validate, samples_train, samples_validate)
        """
        samples, labels = self.compile()
        samples, labels = unison_shuffled_copies(samples, labels)

        split = int(len(samples) * pyocular.config.TRAIN_SPLIT)
        labels_train, labels_validate = np.split(labels, [split])
        samples_train, samples_validate = np.split(samples, [split])
        return labels_train, labels_validate, samples_train, samples_validate

    def get_input_shape(self):
        return (self.get_window_size(), self.channels)

    def get_label_count(self):
        # To support re-training a model with more labels than it was originally
        # trained, we add up to MAX_LABELS unused labels which will get used when
        # the user adds new samples with new labels.
        return max(len(self.all_labels), pyocular.config.MAX_LABELS)

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
        if label not in self.all_labels:
            self.all_labels.append(label)
        self.current_index += 1
        if self.current_index >= self.features.shape[0]:
            # Array full, enlarge it
            pad = pyocular.config.FEATURE_BUFFER_SIZE
            self.features = np.pad(self.features, ((0, pad), (0, 0), (0, 0)))

class AI:
    def __init__(self):
        self.training_data = TrainingData()
        self.model = None
        self.reset_seed()

    def reset_seed(self):
        np.random.seed(pyocular.config.SEED_NUMPY)
        tf.random.set_seed(pyocular.config.SEED_TENSORFLOW)

    def build_model(self):
        input_shape = self.training_data.get_input_shape()
        label_count = self.training_data.get_label_count()

        model = self.model = tf.keras.Sequential()
        model.add(tf.keras.layers.SeparableConv1D(
            filters=128,
            kernel_size=5,
            input_shape=input_shape,
        ))
        model.add(tf.keras.layers.SeparableConv1D(
            filters=128,
            kernel_size=3,
            #activation='relu',
        ))
        model.add(tf.keras.layers.Flatten())
        for _ in range(3):
            model.add(tf.keras.layers.Dense(
                units=128,
                activation='relu',
                #bias_regularizer=tf.keras.regularizers.l1_l2(l1=1e-5, l2=1e-4),
                #activity_regularizer=tf.keras.regularizers.l1_l2(l1=1e-5, l2=1e-4),
                #kernel_regularizer=tf.keras.regularizers.l1_l2(l1=1e-5, l2=1e-4),
            ))
        output_layer = tf.keras.layers.Dense(label_count, activation='softmax')
        model.add(output_layer)
        model.compile(
            optimizer='adam',
            loss='binary_crossentropy',
            metrics=['binary_accuracy']
        )
        return model

    def compile_training_data(self):
        logging.info("Compiling training data")
        self.labels_train, self.labels_validate, self.samples_train, self.samples_validate = \
                self.training_data.shuffle_split()

    def train(self, epochs=pyocular.config.DEFAULT_TRAINING_EPOCHS):
        logging.info("Starting to train")
        history = self.model.fit(
            self.samples_train,
            self.labels_train,
            batch_size=pyocular.config.BATCH_SIZE,
            epochs=epochs,
            validation_data=(self.samples_validate, self.labels_validate),
        )


def unison_shuffled_copies(a, b):
    # https://stackoverflow.com/a/4602224
    assert len(a) == len(b)
    p = np.random.permutation(len(a))
    return a[p], b[p]
