// Dependencies: (Install in ArduinoIDE by clicking on Tools -> Manage Libraries...)
// 1. ArduinoBLE
// 2. Arduino_LSM9DS1

// Feature flags
#define SEND_METRICS true
#define USE_INTERRUPT_TIMER false

#include <ArduinoBLE.h>       // Bluetooth Low Energy
#include <Arduino_LSM9DS1.h>  // Inertial Measurement Unit
#if USE_INTERRUPT_TIMER == true
#include "NRF52_MBED_TimerInterrupt.h"
#endif

// Configuration
#define SAMPLE_RATE 500 // samples per second
#define BLE_NOTIFY_RATE 20 // updates per second
#define BLE_CONNECTION_INTERVAL_MIN 8 // in steps of 1.25ms
#define BLE_CONNECTION_INTERVAL_MAX 8 // in steps of 1.25ms
#define JUMPER_PIN_TO_DISABLE_IMU D2
#define CHANNELS 8
#define BUFFERS 2 // multiple buffers help with concurrency issues, if needed
#define METADATA_BYTES 8
// Metadata format:
// Bytes   |1   |2                            |3-5             |6-8                 |
// Bits    |all |1-4           |5-8           |all             |all                 |
// Content |Tick|MinSampleDelay|MaxSampleDelay|Gryoscope(x,y,z)|Accelerometer(x,y,z)|
// NOTE: MinSampleDelay and MaxSampleDelay will be 0xF when SEND_METRICS is false.

// The DELAY_PARAMs are from a logarithmic regression (f(x)=A+B*log(x)) with
// f(1000)=2 and f(500000)=14, so we can map ranges from <1000us to >500000us to 4 bits.
// Keep this in sync with python/psylink/protocol.py.
#define DELAY_PARAM_A -11.3384217
#define DELAY_PARAM_B 1.93093431
#define COMPRESS_DELAY(x) ((int) min(15, max(1, round(DELAY_PARAM_A + DELAY_PARAM_B * log(x)))))

// Constants
const int SAMPLE_INTERVAL_uS = 1000000 / SAMPLE_RATE;
const int BLE_NOTIFY_INTERVAL_MS = 1000 / BLE_NOTIFY_RATE;
const int SAMPLES_PER_NOTIFY = SAMPLE_RATE / BLE_NOTIFY_RATE;
// Ensure that BLE_CHARACTERISTICS_SIZE does not exceed BLE characteristic length limit of 512 bytes
const int BLE_CHARACTERISTIC_SIZE = METADATA_BYTES + CHANNELS * SAMPLES_PER_NOTIFY;
const int NO_BUFFER = -1;

#if USE_INTERRUPT_TIMER == true
NRF52_MBED_Timer samplingTimer(NRF_TIMER_3);
#endif
BLEDevice connectedDevice;
BLEService sensorService("0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e4");
BLEStringCharacteristic sensorCharacteristic("0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e5", BLERead, BLE_CHARACTERISTIC_SIZE);
BLEIntCharacteristic channelCountCharacteristic("0a3d3fd8-2f1c-46fd-bf46-eaef2fda91e6", BLERead);

volatile bool doSampling = true;
volatile int sendBuffer = NO_BUFFER;
int samples[BUFFERS][CHANNELS][SAMPLES_PER_NOTIFY] = {0};
int currentSample = 0;
int currentBuffer = 0;
unsigned char tick = 1;
char bleString[BLE_CHARACTERISTIC_SIZE] = {0};
bool bleConnected = false;

// Metrics
#if SEND_METRICS == true
volatile unsigned long minSampleDelay, maxSampleDelay, lastSampleMicroSeconds = 0;
#endif

void setup() {
  //Serial.begin(115200);
  analogReadResolution(12);
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(LEDR, OUTPUT);
  pinMode(LEDG, OUTPUT);
  pinMode(LEDB, OUTPUT);
  pinMode(JUMPER_PIN_TO_DISABLE_IMU, INPUT_PULLUP);  // HIGH by default. IMU disabled on LOW.
  digitalWrite(LEDR, HIGH); // The LED is LOW-activated, let's turn it off.
  digitalWrite(LEDG, HIGH); // The LED is LOW-activated, let's turn it off.
  //digitalWrite(LEDB, HIGH); // The LED is LOW-activated, let's turn it off.
  analogWrite(LEDB, 255); // The LED is LOW-activated, let's turn it off.
  if (!BLE.begin()) {
    digitalWrite(LEDR, LOW); // Turn on red LED
    while (1);
  }
  #if USE_INTERRUPT_TIMER == true
  if (!samplingTimer.attachInterruptInterval(SAMPLE_INTERVAL_uS, samplingTimerHandler)) {
    digitalWrite(LEDR, LOW); // Turn on red LED
    digitalWrite(LEDG, LOW); // Turn on green LED
    while (1);
  }
  samplingTimer.stopTimer();
  #endif
  if (!IMU.begin()) {
    digitalWrite(LEDR, LOW); // Turn on red LED
    digitalWrite(LEDG, LOW); // Turn on green LED
    while (1);
  }
  BLE.setLocalName("PsyLink");
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
  #if USE_INTERRUPT_TIMER == true
  if (doSampling) {
  #else
  if (micros() >= nextFrame) {
  #endif
    readSamples();
    #if USE_INTERRUPT_TIMER == false
    nextFrame = micros() + 1000;
    #endif
  }
  if (sendBuffer != NO_BUFFER) {
    updateSensorCharacteristic();
  }
  BLE.poll();
}

void sensorCharacteristicRead(BLEDevice central, BLECharacteristic characteristic) {
  updateSensorCharacteristic();
}

#if USE_INTERRUPT_TIMER == true
void samplingTimerHandler() {
  doSampling = true;
}
#endif

void readSamples() {
  #if USE_INTERRUPT_TIMER == false
  doSampling = false;
  #endif

  for (int channel = 0; channel < CHANNELS; channel++)
    samples[currentBuffer][channel][currentSample] = analogRead(channel);
  currentSample++;
  if (currentSample >= SAMPLES_PER_NOTIFY) {
    sendBuffer = currentBuffer;
    currentBuffer = (currentBuffer + 1) % BUFFERS;
    currentSample = 0;
    tick++;
    if (tick == 0) {
      tick++;
    }
  }

  #if SEND_METRICS == true
  unsigned long int currentMicroSeconds = micros();
  unsigned long int sampleDelay = currentMicroSeconds - lastSampleMicroSeconds;
  lastSampleMicroSeconds = currentMicroSeconds;
  if (maxSampleDelay < sampleDelay)
    maxSampleDelay = sampleDelay;
  if (minSampleDelay > sampleDelay)
    minSampleDelay = sampleDelay;
  #endif
}

void updateSensorCharacteristic() {
  if (sendBuffer == NO_BUFFER || !bleConnected) return;
  int pos = 0;
  char currentChar;
  float x, y, z;

  // Read configuration pins
  bool enableIMU = digitalRead(JUMPER_PIN_TO_DISABLE_IMU);

  // Metadata
  bleString[pos++] = tick;
  #if SEND_METRICS == true
  bleString[pos++] = (COMPRESS_DELAY(minSampleDelay) << 4) | COMPRESS_DELAY(maxSampleDelay);
  #else
  bleString[pos++] = 0xFF;
  #endif
  if (enableIMU == HIGH && IMU.gyroscopeAvailable()) {
    IMU.readGyroscope(x, y, z);
    bleString[pos++] = min(255, max(1, x+127));
    bleString[pos++] = min(255, max(1, y+127));
    bleString[pos++] = min(255, max(1, z+127));
  }
  else {
    bleString[pos++] = 128;
    bleString[pos++] = 128;
    bleString[pos++] = 128;
  }
  if (enableIMU == HIGH && IMU.accelerationAvailable()) {
    IMU.readAcceleration(x, y, z);
    bleString[pos++] = min(255, max(1, 128*x+127));
    bleString[pos++] = min(255, max(1, 128*y+127));
    bleString[pos++] = min(255, max(1, 128*z+127));
  }
  else {
    bleString[pos++] = 128;
    bleString[pos++] = 128;
    bleString[pos++] = 128;
  }

  // Sample data
  for (int sample = 0; sample < SAMPLES_PER_NOTIFY; sample++) {
    for (int channel = 0; channel < CHANNELS; channel++) {
      // Avoid writing 0x00 since that denotes the end of the string
      currentChar = map(samples[sendBuffer][channel][sample], 1040, 3080, 1, 255);
      bleString[pos++] = max(1, min(currentChar, 255));
    }
  }

  bleString[pos] = 0;  // End the string with 0x00
  sensorCharacteristic.writeValue(bleString);

  // Reset values
  sendBuffer = NO_BUFFER;
  #if SEND_METRICS == true
  minSampleDelay = 999999999;
  maxSampleDelay = 0;
  lastSampleMicroSeconds = micros();
  #endif
}

void bleConnectHandler(BLEDevice central) {
  analogWrite(LEDB, 253);
  connectedDevice = central;
  bleConnected = true;
  currentSample = 0;
  currentBuffer = 0;
  #if SEND_METRICS == true
  minSampleDelay = 999999999;
  maxSampleDelay = 0;
  #endif
  tick = 1;
  sendBuffer = NO_BUFFER;
  for (int buf = 0; buf < BUFFERS; buf++)
    for (int channel = 0; channel < CHANNELS; channel++)
      for (int sample = 0; sample < SAMPLES_PER_NOTIFY; sample++)
        samples[buf][channel][sample] = 0;
  //samplingTimer.restartTimer();
}

void bleDisconnectHandler(BLEDevice central) {
  //samplingTimer.stopTimer();
  analogWrite(LEDB, 255);
  bleConnected = false;
}
