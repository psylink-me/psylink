/* I used this for the steering wheel video */
#include "arduinoFFT.h"
 
#define SAMPLES 64             //Must be a power of 2
#define SAMPLING_FREQUENCY 1000 //Hz, must be less than 10000 due to ADC
 
arduinoFFT FFT = arduinoFFT();
 
unsigned int sampling_period_us;
unsigned long microseconds;
 
double vReal[SAMPLES];
double vImag[SAMPLES];
double vReal2[SAMPLES];
double vImag2[SAMPLES];
double vReal3[SAMPLES];
double vImag3[SAMPLES];
double vReal4[SAMPLES];
double vImag4[SAMPLES];
double vReal5[SAMPLES];
double vImag5[SAMPLES];
double vReal6[SAMPLES];
double vImag6[SAMPLES];
double vReal7[SAMPLES];
double vImag7[SAMPLES];
double vReal8[SAMPLES];
double vImag8[SAMPLES];

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
        //Serial.println("1");
        microseconds = micros();    //Overflows after around 70 minutes!

        //Serial.println("2");
        vReal[i] = analogRead(A0);
        vImag[i] = 0;
        vReal2[i] = analogRead(A1);
        vImag2[i] = 0;
        vReal3[i] = analogRead(A2);
        vImag3[i] = 0;
        vReal4[i] = analogRead(A3);
        vImag4[i] = 0;
        vReal5[i] = analogRead(A4);
        vImag5[i] = 0;
        vReal6[i] = analogRead(A5);
        vImag6[i] = 0;
        vReal7[i] = analogRead(A6);
        vImag7[i] = 0;
        vReal8[i] = analogRead(A7);
        vImag8[i] = 0;

        /*for (int j = 1; j < SAMPLES; j++) {
          vReal2[i] -=vReal[i];
          vReal3[i] -=vReal[i];
          vReal4[i] -=vReal[i];
          vReal5[i] -=vReal[i];
          vReal6[i] -=vReal[i];
          vReal7[i] -=vReal[i];
          vReal8[i] -=vReal[i];
        }*/

        //Serial.println("3");
        while(micros() < (microseconds + sampling_period_us)){
        }
    }
 
    /*FFT*/
    FFT.Windowing(vReal, SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
    FFT.Compute(vReal, vImag, SAMPLES, FFT_FORWARD);
    FFT.ComplexToMagnitude(vReal, vImag, SAMPLES);
    
    FFT.Windowing(vReal2, SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
    FFT.Compute(vReal2, vImag2, SAMPLES, FFT_FORWARD);
    FFT.ComplexToMagnitude(vReal2, vImag2, SAMPLES);

    FFT.Windowing(vReal3, SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
    FFT.Compute(vReal3, vImag3, SAMPLES, FFT_FORWARD);
    FFT.ComplexToMagnitude(vReal3, vImag3, SAMPLES);

    FFT.Windowing(vReal4, SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
    FFT.Compute(vReal4, vImag4, SAMPLES, FFT_FORWARD);
    FFT.ComplexToMagnitude(vReal4, vImag4, SAMPLES);

    FFT.Windowing(vReal5, SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
    FFT.Compute(vReal5, vImag5, SAMPLES, FFT_FORWARD);
    FFT.ComplexToMagnitude(vReal5, vImag5, SAMPLES);

    FFT.Windowing(vReal6, SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
    FFT.Compute(vReal6, vImag6, SAMPLES, FFT_FORWARD);
    FFT.ComplexToMagnitude(vReal6, vImag6, SAMPLES);

    FFT.Windowing(vReal7, SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
    FFT.Compute(vReal7, vImag7, SAMPLES, FFT_FORWARD);
    FFT.ComplexToMagnitude(vReal7, vImag7, SAMPLES);

    FFT.Windowing(vReal8, SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
    FFT.Compute(vReal8, vImag8, SAMPLES, FFT_FORWARD);
    FFT.ComplexToMagnitude(vReal8, vImag8, SAMPLES);
    //double peak = FFT.MajorPeak(vReal, SAMPLES, SAMPLING_FREQUENCY);
 
    /*PRINT RESULTS*/
    //Serial.println(peak);     //Print out what frequency is the most dominant.

    float v1 = 0.0, v2 = 0.0, v3 = 0.0, v4 = 0.0;
    float v5 = 0.0, v6 = 0.0, v7 = 0.0, v8 = 0.0;
    for(int i=0; i<(SAMPLES/2); i++)
    {
        /*View all these three lines in serial terminal to see which frequencies has which amplitudes*/
         
        //Serial.print((i * 1.0 * SAMPLING_FREQUENCY) / SAMPLES, 1);
        //Serial.print(" ");
        if (i > 0.10 * SAMPLES && i < 0.25 * SAMPLES) {
          v1 += vReal[i];
          v2 += vReal2[i];
          v3 += vReal3[i];
          v4 += vReal4[i];
          v5 += vReal5[i];
          v6 += vReal6[i];
          v7 += vReal7[i];
          v8 += vReal8[i];
          //Serial.println(vReal[i], 1);    //View only this line in serial plotter to visualize the bins
        }
        else {
          //Serial.println(0.0);
        }
    }
    Serial.print(v1);
    Serial.print("\t");
    Serial.print(v2);
    Serial.print("\t");
    Serial.print(v3);
    Serial.print("\t");
    Serial.print(v4);
    Serial.print("\t");
    Serial.print(v5);
    Serial.print("\t");
    Serial.print(v6);
    Serial.print("\t");
    Serial.print(v7);
    Serial.print("\t");
    Serial.print(v8);
    Serial.println("");
 
    //delay(100);  //Repeat the process every second OR:
    //while(1);       //Run code once
}
