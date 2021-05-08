/* This plots the root mean square difference of each sample from 4 electrodes. */

int count = 0;
const int avgspan = 300;
const int electrodes = 4;

float sample[electrodes];
float samples[electrodes][avgspan];

void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  analogReadResolution(12);
  analogReference(AR_VDD);

  // Initialize arrays
  for (int i = 0; i < electrodes; i++) {
    for (int j = 0; j < avgspan; j++) {
      samples[i][j] = 0;
    }
  }
}

float calc_rmsd(float samples0[], float samples1[], int maxsamples) {
  float accumulator = 0.0;
  for (int i = 0; i < maxsamples; i++) {
    accumulator += (samples0[i] - samples1[i]) * (samples0[i] - samples1[i]);
  }
  accumulator = sqrt(accumulator / maxsamples);
  return accumulator;
}
float sumdif(float samples0[], float samples1[], int maxsamples) {
  float sum0 = 0.0, sum1 = 0.0;
  for (int i = 0; i < maxsamples; i++) {
    sum0 += samples0[i];
    sum1 += samples1[i];
  }
  return sqrt((sum0 - sum1) * (sum0 - sum1) / maxsamples);
}

#define combiner sumdif

void loop() {
  count++;

  sample[0] = analogRead(A0); 
  sample[1] = analogRead(A1);
  sample[2] = analogRead(A2);
  sample[3] = analogRead(A3);

  //Serial.print(  "Sample0:"); Serial.print(sample[0] / 4095.0);
  //Serial.print(", Sample1:"); Serial.print(sample[1] / 4095.0);
  //Serial.print(", Sample2:"); Serial.print(sample[2] / 4095.0);
  //Serial.print(", Sample3:"); Serial.print(sample[3] / 4095.0);
  //Serial.print(  "Samp0-1:"); Serial.print((sample[0]-sample[1]) / 4095.0 * 100.0);
  //Serial.print(", Samp2-3:"); Serial.print((sample[2]-sample[3]) / 4095.0 * 100.0);

  //Serial.print(", ");

  for (int i = 0; i < electrodes; i++) {
    samples[i][count % avgspan] = sample[i] / 4095.0;
  }

  float rms0_1 = combiner(samples[0], samples[1], avgspan);
  float rms2_3 = combiner(samples[2], samples[3], avgspan);
  
  float rms0_2 = combiner(samples[0], samples[2], avgspan);
  float rms1_3 = combiner(samples[1], samples[3], avgspan);
  float rms0_3 = combiner(samples[0], samples[3], avgspan);
  float rms1_2 = combiner(samples[1], samples[2], avgspan);
  

  if (count > avgspan && (3 * count) % avgspan == 0) {
    const float ampl = 20.0;
    Serial.print("Min:0, Max:10, ");
    Serial.print("WhiteBlack:");
    Serial.print(rms0_1 * ampl);
    Serial.print(", GreenRed:");
    Serial.print(rms2_3 * ampl);
    Serial.print(", WhiteGreen:");
    Serial.print(rms0_2 * ampl);
    Serial.print(", BlackRed:");
    Serial.print(rms1_3 * ampl);
    Serial.print(", WhiteRed:");
    Serial.print(rms0_3 * ampl);
    Serial.print(", BlackGreen:");
    Serial.print(rms1_2 * ampl);
  }
  Serial.println("");
}
