from tensorflow import keras
import json
import logging
import math
import numpy as np
import pyocular
import tensorflow as tf
import os.path

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
        self.label_order = []
        self.current_index = 0

    def compile(self):
        """
        Returns 2 numpy arrays of samples and labels.

        samples.shape == (recording_count, window_size, channel_count)
        labels.shape == (recording_count, label_count)
        """

        sample_count = self.current_index
        sample_array = self.features[:sample_count]

        label_count = self.get_label_count()
        label_array = np.full([sample_count, label_count], False, dtype=bool)

        for index, label in enumerate(self.labels):
            label_id = self.label_order.index(label)
            label_array[index][label_id] = True

        return sample_array, label_array

    def load(self, samples, labels, label_order):
        """
        Takes a numpy array for samples and a list of strings for labels & label_order

        samples.shape == (recording_count, window_size, channel_count)
        len(labels) == recording_count
        """
        assert len(samples) == len(labels)
        self.features = samples
        self.labels = labels
        self.label_order = label_order
        self.current_index = len(labels)
        self.channels = samples.shape[2]

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
        return len(self.label_order)

    def get_window_size(self):
        return pyocular.config.FEATURE_WINDOW_SIZE

    def get_recorded_samples(self):
        return self.current_index

    def set_channels(self, channels):
        if channels != self.channels:
            self.channels = channels
            logging.warning("Number of channels has changed. Resetting training data.")
            self.clear()

    def get_channels(self):
        return self.channels

    def append(self, features, label):
        """
        feature: a 2D numpy array in shape = (self.channels, self.get_window_size())
        label: string
        """
        self.features[self.current_index] = features
        self.labels.append(label)
        if label not in self.label_order:
            self.label_order.append(label)
        self.current_index += 1
        if self.current_index >= self.features.shape[0]:
            # Array full, enlarge it
            pad = pyocular.config.FEATURE_BUFFER_SIZE
            self.features = np.pad(self.features, ((0, pad), (0, 0), (0, 0)))

class AI:
    def __init__(self):
        self.training_data = TrainingData()
        self.label_order = None
        self.model = None
        self.reset_seed()

    def reset_seed(self):
        np.random.seed(pyocular.config.SEED_NUMPY)
        tf.random.set_seed(pyocular.config.SEED_TENSORFLOW)

    def has_model(self):
        return self.model is not None

    def build_model(self):
        input_shape = self.training_data.get_input_shape()
        label_count = self.training_data.get_label_count()

        model = self.model = tf.keras.Sequential()
        model.add(tf.keras.layers.SeparableConv1D(
            filters=128,
            kernel_size=5,
            input_shape=input_shape,
        ))
        #model.add(tf.keras.layers.SeparableConv1D(
        #    filters=128,
        #    kernel_size=3,
        #    #activation='relu',
        #))
        model.add(tf.keras.layers.Flatten())
        for _ in range(2):
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
        self.label_order = self.training_data.label_order
        self.labels_train, self.labels_validate, self.samples_train, self.samples_validate = \
                self.training_data.shuffle_split()
        print(f"self.labels_train.shape: {self.labels_train.shape}")
        print(f"self.labels_validate.shape: {self.labels_validate.shape}")
        print(f"self.samples_train.shape: {self.samples_train.shape}")
        print(f"self.samples_validate.shape: {self.samples_validate.shape}")

    def train(self, epochs=pyocular.config.DEFAULT_TRAINING_EPOCHS):
        logging.info("Starting to train")
        history = self.model.fit(
            self.samples_train,
            self.labels_train,
            batch_size=pyocular.config.BATCH_SIZE,
            epochs=epochs,
            validation_data=(self.samples_validate, self.labels_validate),
        )

    def predict(self, samples):
        samples = samples.reshape((1, samples.shape[0], samples.shape[1]))
        prediction = self.model.predict(samples)
        label_id = np.argmax(prediction)
        label = self.label_order[label_id]
        print(f"label_id: {label_id}, label: {label}, prediction: {prediction}, labels: {self.label_order}")
        return label

    @staticmethod
    def _run_name_to_signals_file_name(run_name):
        return f'{run_name}_signals.npy'

    @staticmethod
    def _run_name_to_labels_file_name(run_name):
        return f'{run_name}_labels.json'

    @staticmethod
    def _run_name_to_model_path(run_name):
        return f'{run_name}_model'

    @staticmethod
    def _run_name_to_label_order_file_name(run_name):
        return f'{run_name}_label_order.json'

    def save_training_data(self, run_name):
        signals_fname = self._run_name_to_signals_file_name(run_name)
        labels_fname = self._run_name_to_labels_file_name(run_name)

        samples, _ = self.training_data.compile()
        np.save(signals_fname, samples, allow_pickle=False)

        labels = self.training_data.labels
        with open(labels_fname, 'w') as f:
            json.dump(labels, f)
        self.save_label_order(run_name)

    def load_training_data(self, run_name):
        signals_fname = self._run_name_to_signals_file_name(run_name)
        labels_fname = self._run_name_to_labels_file_name(run_name)

        samples = np.load(signals_fname, allow_pickle=False)
        with open(labels_fname, 'r') as f:
            labels = json.load(f)
        self.load_label_order(run_name)

        self.training_data.load(samples, labels, self.label_order)

    def save_label_order(self, run_name):
        fname = self._run_name_to_label_order_file_name(run_name)
        with open(fname, 'w') as f:
            json.dump(self.label_order, f)

    def load_label_order(self, run_name):
        fname = self._run_name_to_label_order_file_name(run_name)
        with open(fname, 'r') as f:
            self.label_order = json.load(f)

    def save_model(self, run_name):
        if not self.model:
            logging.error("No model to save")
            return
        model_path = self._run_name_to_model_path(run_name)
        self.model.save(model_path)
        self.save_label_order(run_name)

    def load_model(self, run_name):
        model_path = self._run_name_to_model_path(run_name)
        self.model = keras.models.load_model(model_path)
        self.load_label_order(run_name)

        first_layer = self.model.layers[0]
        channels = first_layer.input_shape[2]
        self.training_data.set_channels(channels)


def unison_shuffled_copies(a, b):
    # https://stackoverflow.com/a/4602224
    assert len(a) == len(b)
    p = np.random.permutation(len(a))
    return a[p], b[p]
