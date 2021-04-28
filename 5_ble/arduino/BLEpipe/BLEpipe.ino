#include <ArduinoBLE.h>
#include "NRF52_MBED_TimerInterrupt.h"

// Configuration
#define SAMPLE_RATE 200
#define BLE_NOTIFY_RATE 35 // DO NOT exceed BLE characteristic length limit of 512 (255?) bytes
#define CHANNELS 8
#define BUFFERS 2

// Constants
const int SAMPLE_INTERVAL_uS = 1000000 / SAMPLE_RATE;
const int BLE_NOTIFY_INTERVAL_MS = 1000 / BLE_NOTIFY_RATE;
const int SAMPLES_PER_INTERVAL = SAMPLE_RATE / BLE_NOTIFY_RATE;
const int BLE_CHARACTERISTIC_SIZE = CHANNELS * SAMPLES_PER_INTERVAL;
const int NO_BUFFER = -1;

NRF52_MBED_Timer samplingTimer(NRF_TIMER_3);
BLEDevice connectedDevice;
BLEService sensorService("0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e4");
BLEStringCharacteristic sensorCharacteristic("0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e5",
    BLERead | BLENotify, BLE_CHARACTERISTIC_SIZE);

volatile bool doSampling = true;
volatile int sendBuffer = NO_BUFFER;
int samples[BUFFERS][CHANNELS][SAMPLES_PER_INTERVAL] = {0};
int currentSample = 0;
int currentBuffer = 0;
char bleString[BLE_CHARACTERISTIC_SIZE] = {0};
int fps = 0;
unsigned int nextframe = 0;

volatile int tick1, tick2, tick3;

void setup() {
  Serial.begin(115200);
  analogReadResolution(12);
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(LEDR, OUTPUT);
  pinMode(LEDG, OUTPUT);
  pinMode(LEDB, OUTPUT);
  digitalWrite(LEDR, HIGH); // The LED is LOW-activated, let's turn it off.
  digitalWrite(LEDG, HIGH); // The LED is LOW-activated, let's turn it off.  
  digitalWrite(LEDB, HIGH); // The LED is LOW-activated, let's turn it off.  
  if (!BLE.begin()) {
    digitalWrite(LEDR, LOW); // Turn on red LED
    while (1);
  }
  if (!samplingTimer.attachInterruptInterval(SAMPLE_INTERVAL_uS, samplingTimerHandler)) {
    digitalWrite(LEDR, LOW); // Turn on red LED
    digitalWrite(LEDG, LOW); // Turn on green LED
    while (1);
  }
  samplingTimer.stopTimer();
  BLE.setLocalName("Myocular");
  BLE.setAdvertisedService(sensorService);
  sensorService.addCharacteristic(sensorCharacteristic);
  BLE.addService(sensorService);
  BLE.setEventHandler(BLEConnected, bleConnectHandler);
  BLE.setEventHandler(BLEDisconnected, bleDisconnectHandler);
  sensorCharacteristic.writeValue("0");
  BLE.advertise();
  for (int i = 0; i < BLE_CHARACTERISTIC_SIZE; i++) { bleString[i] = i+1; }
}

void loop() {
  if (doSampling) {
    readSamples();
    if (sendBuffer != NO_BUFFER && connectedDevice && connectedDevice.connected()) {
      tick1 = millis();
      updateSensorCharacteristic();
      tick2 = millis() - tick1;
    }
  }
  //Serial.println(samples[currentBuffer][1][currentSample]);

  tick1 = millis();
  BLE.poll();
  tick3 = millis() - tick1;

  //Serial.print(tick2);
  //Serial.print(" ");
  //Serial.println(tick3);
}

void samplingTimerHandler() {
  doSampling = true;
}

void readSamples() {
  doSampling = false;
  for (int channel = 0; channel < 0; channel++)
    samples[currentBuffer][channel][currentSample] = analogRead(channel);
  currentSample++;
  if (currentSample >= SAMPLES_PER_INTERVAL) {
    sendBuffer = currentBuffer;
    currentBuffer = (currentBuffer + 1) % BUFFERS;
    currentSample = 0;
  }
  fps++;
  if (millis() > nextframe) {
    Serial.println(fps);
    fps = 0;
    nextframe += 1000;
  }
}

void updateSensorCharacteristic() {
  sensorCharacteristic.writeValue(bleString); return;
  if (sendBuffer == NO_BUFFER) return;
  int pos = 0;
  for (int sample = 0; sample < SAMPLES_PER_INTERVAL; sample++) {
    for (int channel = 0; channel < CHANNELS; channel++) {
      bleString[pos++] = map(samples[sendBuffer][channel][sample], 0, 4095, 0, 254) + 1;
    }
  }
  bleString[pos] = 0;
  sensorCharacteristic.writeValue(bleString);
  sendBuffer = NO_BUFFER;
}

void bleConnectHandler(BLEDevice central) {
  digitalWrite(LEDB, LOW);
  connectedDevice = central;
  currentSample = 0;
  currentBuffer = 0;
  sendBuffer = NO_BUFFER;
  for (int buf = 0; buf < BUFFERS; buf++)
    for (int channel = 0; channel < CHANNELS; channel++)
      for (int sample = 0; sample < SAMPLES_PER_INTERVAL; sample++)
        samples[buf][channel][sample] = 0;
  samplingTimer.restartTimer();
  nextframe = millis() + 1000;
}

void bleDisconnectHandler(BLEDevice central) {
  samplingTimer.stopTimer();
  digitalWrite(LEDB, HIGH);
}
