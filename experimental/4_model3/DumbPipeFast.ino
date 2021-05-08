// This produces samples at a fixed rate.
// When increasing the rate or changing the sampling method, ensure that the
// rate is still reached, e.g. by running samplespersecond.py
#define NPINS 8
#define AVGSAMPLES 2
#define SAMPLERATE 1000
#define INTERVAL (1000000.0/SAMPLERATE)

int store[8];
char output[1024];
int linespersecond = 0;
int linecount = 0;
unsigned int nextsecond, nextsample;

void setup() {
  Serial.begin(115200);
  analogReadResolution(12);
  for (int pin = 0; pin < NPINS; pin++) {
    store[pin] = 0;
  }
  nextsecond = millis() + 1000;
}

void loop() {
  while (micros() <= nextsample) {}
  nextsample += INTERVAL;  // this had less variance than "micros()+INTERVAL"
  for (int pin = 0; pin < NPINS; pin++) {
    store[pin] = 0;
  }
  for (int i = 0; i < AVGSAMPLES; i++) {
    for (int pin = 0; pin < NPINS; pin++) {
      store[pin] += analogRead(pin);
    }
  }
  //if (millis() > nextsecond) {
  //  nextsecond = millis() + 1000;
  //  linespersecond = linecount;
  //  linecount = 0;
  //}
  for (int pin = 0; pin < NPINS - 1; pin++) {
    // subtract the last pin, which is not connected and serves as a baseline
    store[pin] = store[pin] - store[NPINS - 1];
  }
  //linecount++;
  //sprintf(output, "%d %d %d %d %d %d %d\n",// linespersecond,
  sprintf(output, "%d %d %d %d %d %d %d\n",// linespersecond,
    store[0], store[1], store[2], store[3], store[4], store[5], store[6]);
  Serial.print(output);
}
