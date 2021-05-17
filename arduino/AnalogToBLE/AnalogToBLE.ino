#include <ArduinoBLE.h>
//#include "NRF52_MBED_TimerInterrupt.h"

// Configuration
#define SAMPLE_RATE 500 // samples per second
#define BLE_NOTIFY_RATE 10 // updates per second
#define BLE_CONNECTION_INTERVAL_MIN 8 // in steps of 1.25ms
#define BLE_CONNECTION_INTERVAL_MAX 8 // in steps of 1.25ms
#define CHANNELS 7
#define BUFFERS 2 // multiple buffers help with concurrency issues, if needed
#define SEND_METRICS true
#define METADATA_BYTES 1
// Metadata format:
// Byte    |1   |2                            |
// Bit     |1-8 |1-4           |5-8           |
// Content |Tick|MinSampleDelay|MaxSampleDelay|
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

// Metrics
#if SEND_METRICS == true
volatile unsigned long minSampleDelay, maxSampleDelay;
#endif

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
  #if SEND_METRICS == true
  unsigned long int sampleDelay = micros();
  #endif

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

  #if SEND_METRICS == true
  sampleDelay = micros() - sampleDelay;
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

  // Metadata
  bleString[pos++] = tick;
  #if SEND_METRICS == true
  bleString[pos++] = (COMPRESS_DELAY(minSampleDelay) << 4) | COMPRESS_DELAY(maxSampleDelay);
  #else
  bleString[pos++] = 0xFF;
  #endif

  // Sample data
  for (int sample = 0; sample < SAMPLES_PER_INTERVAL; sample++) {
    for (int channel = 0; channel < CHANNELS; channel++) {
      // Avoid writing 0x00 since that denotes the end of the string
      currentChar = map(samples[sendBuffer][channel][sample], 1921, 2176, 1, 255);
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
      for (int sample = 0; sample < SAMPLES_PER_INTERVAL; sample++)
        samples[buf][channel][sample] = 0;
  //samplingTimer.restartTimer();
}

void bleDisconnectHandler(BLEDevice central) {
  //samplingTimer.stopTimer();
  analogWrite(LEDB, 255);
  bleConnected = false;
}
