/* I used this for the steering wheel video */
#include "arduinoFFT.h"
 
#define SAMPLES 64             //Must be a power of 2
#define SAMPLING_FREQUENCY 1000 //Hz, must be less than 10000 due to ADC
#define SHOW_BINS 0

arduinoFFT FFT = arduinoFFT();
 
unsigned int sampling_period_us;
unsigned long microseconds;

double vReal[8][SAMPLES];
double vImag[8][SAMPLES];
unsigned int pins[8] = {A0, A1, A2, A3, A4, A5, A6, A7};

void setup() {
    Serial.begin(115200);
    analogReadResolution(12);

    //Serial.println("1");
    sampling_period_us = round(1000000*(1.0/SAMPLING_FREQUENCY));
}
 
void loop() {
    /*SAMPLING*/
    for(int i=0; i<SAMPLES; i++)
    {
        microseconds = micros();    //Overflows after around 70 minutes!

        for (int pin = 0; pin < 8; pin++) {
            vReal[pin][i] = analogRead(pins[pin]);
            vImag[pin][i] = 0;
        }

        while(micros() < (microseconds + sampling_period_us)){
        }
    }
 
    /*FFT*/
    for (int pin = 0; pin < 8; pin++) {
        FFT.Windowing(vReal[pin], SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
        FFT.Compute(vReal[pin], vImag[pin], SAMPLES, FFT_FORWARD);
        FFT.ComplexToMagnitude(vReal[pin], vImag[pin], SAMPLES);
    }
    //double peak = FFT.MajorPeak(vReal, SAMPLES, SAMPLING_FREQUENCY);
 
    /*PRINT RESULTS*/
    //Serial.println(peak);     //Print out what frequency is the most dominant.

    float sums[8] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    for(int freq = 0; freq < (SAMPLES/2); freq++)
    {
        /*View all these three lines in serial terminal to see which frequencies has which amplitudes*/
         
        //Serial.print((i * 1.0 * SAMPLING_FREQUENCY) / SAMPLES, 1);
        //Serial.print(" ");
        if (freq >= 0.10 * SAMPLES && freq < 0.75 * SAMPLES) {
            for (int pin = 0; pin < 8; pin++) {
                if (SHOW_BINS) {
                    if (pin > 0) { Serial.print("\t"); }
                    Serial.print(vReal[pin][freq], 1);
                } else {
                    sums[pin] += vReal[pin][freq];
                }
            }
            if (SHOW_BINS) {
                Serial.println();
            }
        }
        else {
            if (SHOW_BINS) {
                Serial.println("0\t0\t0\t0\t0\t0\t0\t0");
            }
        }
    }

    if (!SHOW_BINS) {
        for (int pin = 0; pin < 7; pin++) {
            Serial.print(sums[pin]);
            Serial.print("\t");
        }
        Serial.println(sums[7]);
    }

    if (SHOW_BINS) {
        for (int i = 0; i < 30; i++) { Serial.println("0\t0\t0\t0\t0\t0\t0\t0"); }
        delay(2000);  //Repeat the process every second OR:
    }
}
