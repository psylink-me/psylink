#define CAP 4095.0

void setup() {
  Serial.begin(115200);
  analogReadResolution(12);
}

void loop() {
  Serial.print("A0:");
  Serial.print(analogRead(A0) / CAP);
  Serial.print("\tA1:");
  Serial.print(analogRead(A1) / CAP);
  Serial.print("\tA2:");
  Serial.print(analogRead(A2) / CAP);
  Serial.print("\tA3:");
  Serial.print(analogRead(A3) / CAP);
  Serial.print("\tA4:");
  Serial.print(analogRead(A4) / CAP);
  Serial.print("\tA5:");
  Serial.print(analogRead(A5) / CAP);
  Serial.print("\tA6:");
  Serial.print(analogRead(A6) / CAP);
  Serial.print("\tA7:");
  Serial.print(analogRead(A7) / CAP);
  Serial.println();
}
