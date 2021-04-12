void setup() {
  Serial.begin(115200);
  analogReadResolution(12);
}

void loop() {
  Serial.print("A0:");
  Serial.print(analogRead(A0));
  Serial.print("\tA1:");
  Serial.print(analogRead(A1));
  Serial.print("\tA2:");
  Serial.print(analogRead(A2));
  Serial.print("\tA3:");
  Serial.print(analogRead(A3));
  Serial.print("\tA4:");
  Serial.print(analogRead(A4));
  Serial.print("\tA5:");
  Serial.print(analogRead(A5));
  Serial.print("\tA6:");
  Serial.print(analogRead(A6));
  Serial.print("\tA7:");
  Serial.print(analogRead(A7));
  Serial.println();
}
