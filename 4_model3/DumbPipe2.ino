#define AVERAGES 1
#define CAP 4095.0
#define OFFSET (-2048 * AVERAGES)
//#define FACTOR 1.0 / CAP
#define FACTOR 1
#define PIN_NUMBER 8
#define SAMPLE_INTERVAL_MICROS 5000

unsigned long next_sample_time;
int input_pins[] = {A0, A1, A2, A3, A4, A5, A6, A7};
unsigned int samples[PIN_NUMBER];
int avg;

void setup() {
  Serial.begin(115200);
  //analogReadResolution(12);
  next_sample_time = 0;
  //analogReference(AR_INTERNAL1V2);
}
void loop() {
  while(micros() < next_sample_time){}
  next_sample_time = micros() + SAMPLE_INTERVAL_MICROS;

  for (int i = 0; i < PIN_NUMBER; i++) {
    avg = 0;
    for (int j = 0; j < AVERAGES; j++) {
      avg += analogRead(input_pins[i]);
    }
    samples[i] = avg * FACTOR;
  }
  Serial.print(samples[0]);
  for (int i = 1; i < PIN_NUMBER; i++) {
    Serial.print("\t");
    Serial.print(samples[i]);
  }
  Serial.println();
}
