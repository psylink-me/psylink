#include <ArduinoBLE.h>
//#include "NRF52_MBED_TimerInterrupt.h"

// Configuration
#define SAMPLE_RATE 500 // samples per second
#define BLE_NOTIFY_RATE 10 // updates per second
#define BLE_CONNECTION_INTERVAL_MIN 8 // in steps of 1.25ms
#define BLE_CONNECTION_INTERVAL_MAX 8 // in steps of 1.25ms
#define CHANNELS 8
#define BUFFERS 2 // multiple buffers help with concurrency issues, if needed
#define METADATA_BYTES 1
// Metadata format:
// Byte    |1   |
// Bit     |1-8 |
// Content |Tick|

// Constants
const int SAMPLE_INTERVAL_uS = 1000000 / SAMPLE_RATE;
const int BLE_NOTIFY_INTERVAL_MS = 1000 / BLE_NOTIFY_RATE;
const int SAMPLES_PER_INTERVAL = SAMPLE_RATE / BLE_NOTIFY_RATE;
// Ensure that BLE_CHARACTERISTICS_SIZE does not exceed BLE characteristic length limit of 512 (255?) bytes
const int BLE_CHARACTERISTIC_SIZE = METADATA_BYTES + CHANNELS * SAMPLES_PER_INTERVAL;
const int NO_BUFFER = -1;

//NRF52_MBED_Timer samplingTimer(NRF_TIMER_3);
BLEDevice connectedDevice;
BLEService sensorService("0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e4");
BLEStringCharacteristic sensorCharacteristic("0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e5", BLERead, BLE_CHARACTERISTIC_SIZE);
BLEIntCharacteristic channelCountCharacteristic("0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e6", BLERead);

volatile bool doSampling = true;
volatile int sendBuffer = NO_BUFFER;
int samples[BUFFERS][CHANNELS][SAMPLES_PER_INTERVAL] = {0};
int currentSample = 0;
int currentBuffer = 0;
unsigned char tick = 1;
char bleString[BLE_CHARACTERISTIC_SIZE] = {0};
bool bleConnected = false;

void setup() {
  //Serial.begin(115200);
  analogReadResolution(12);
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(LEDR, OUTPUT);
  pinMode(LEDG, OUTPUT);
  pinMode(LEDB, OUTPUT);
  digitalWrite(LEDR, HIGH); // The LED is LOW-activated, let's turn it off.
  digitalWrite(LEDG, HIGH); // The LED is LOW-activated, let's turn it off.
  //digitalWrite(LEDB, HIGH); // The LED is LOW-activated, let's turn it off.
  analogWrite(LEDB, 255); // The LED is LOW-activated, let's turn it off.
  if (!BLE.begin()) {
    digitalWrite(LEDR, LOW); // Turn on red LED
    while (1);
  }
//  if (!samplingTimer.attachInterruptInterval(SAMPLE_INTERVAL_uS, samplingTimerHandler)) {
//    digitalWrite(LEDR, LOW); // Turn on red LED
//    digitalWrite(LEDG, LOW); // Turn on green LED
//    while (1);
//  }
  //samplingTimer.stopTimer();
  BLE.setLocalName("Myocular");
  BLE.setAdvertisedService(sensorService);
  sensorService.addCharacteristic(sensorCharacteristic);
  sensorService.addCharacteristic(channelCountCharacteristic);
  BLE.addService(sensorService);
  BLE.setEventHandler(BLEConnected, bleConnectHandler);
  BLE.setEventHandler(BLEDisconnected, bleDisconnectHandler);
  //sensorCharacteristic.setEventHandler(BLERead, sensorCharacteristicRead);
  sensorCharacteristic.writeValue("0");
  channelCountCharacteristic.writeValue(CHANNELS);
  BLE.setConnectionInterval(BLE_CONNECTION_INTERVAL_MIN, BLE_CONNECTION_INTERVAL_MAX);
  BLE.advertise();
  for (int i = 0; i < BLE_CHARACTERISTIC_SIZE; i++) { bleString[i] = i+1; }
}

unsigned long nextFrame = 0;
void loop() {
  //if (doSampling) {
  if (micros() >= nextFrame) {
    readSamples();
    nextFrame = micros() + 1000;
  }
  if (sendBuffer != NO_BUFFER) {
    updateSensorCharacteristic();
  }
  BLE.poll();
}

void sensorCharacteristicRead(BLEDevice central, BLECharacteristic characteristic) {
  updateSensorCharacteristic();
}

void samplingTimerHandler() {
  doSampling = true;
}

void readSamples() {
  doSampling = false;
  for (int channel = 0; channel < CHANNELS; channel++)
    samples[currentBuffer][channel][currentSample] = analogRead(channel);
  currentSample++;
  if (currentSample >= SAMPLES_PER_INTERVAL) {
    sendBuffer = currentBuffer;
    currentBuffer = (currentBuffer + 1) % BUFFERS;
    currentSample = 0;
    tick++;
    if (tick == 0) {
      tick++;
    }
  }
}

void updateSensorCharacteristic() {
  if (sendBuffer == NO_BUFFER || !bleConnected) return;
  int pos = 0;
  char currentChar;

  // Metadata
  bleString[pos++] = tick;

  // Sample data
  for (int sample = 0; sample < SAMPLES_PER_INTERVAL; sample++) {
    for (int channel = 0; channel < CHANNELS; channel++) {
      // Avoid writing 0x00 since that denotes the end of the string
      currentChar = map(samples[sendBuffer][channel][sample], 1536, 3071, 1, 255);
      bleString[pos++] = max(1, min(currentChar, 255));
    }
  }
  bleString[pos] = 0;
  sensorCharacteristic.writeValue(bleString);
  sendBuffer = NO_BUFFER;
}

void bleConnectHandler(BLEDevice central) {
  analogWrite(LEDB, 253);
  connectedDevice = central;
  bleConnected = true;
  currentSample = 0;
  currentBuffer = 0;
  tick = 1;
  sendBuffer = NO_BUFFER;
  for (int buf = 0; buf < BUFFERS; buf++)
    for (int channel = 0; channel < CHANNELS; channel++)
      for (int sample = 0; sample < SAMPLES_PER_INTERVAL; sample++)
        samples[buf][channel][sample] = 0;
  //samplingTimer.restartTimer();
}

void bleDisconnectHandler(BLEDevice central) {
  //samplingTimer.stopTimer();
  analogWrite(LEDB, 255);
  bleConnected = false;
}
