/* With this code, I took the first video where I move the hand, and the graph on the screen changes */

int count = 0;
float v0 = 0, v1 = 0, v2 = 0;
int limit = 100;

void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  analogReadResolution(12);
  analogReference(AR_VDD); // useless?
}

void loop() {
  count++;
  v0 += analogRead(A0) / 4095.0;
  v1 += analogRead(A1) / 4095.0;
  if (count == limit) {
    Serial.print("Dif:");
    Serial.print((v1 - v0)/limit * 100.0);
    Serial.print(", Foo:");
    Serial.println(sqrt((v1-v0) * (v1-v0)));
    count = 0;
    v0 = v1 = v2 = 0;
  }
}
