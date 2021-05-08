unsigned long End;
unsigned short Count;

void setup( void )
{
  Serial.begin( 115200 );
  analogReadResolution(12);
  End = millis() + 1000;
}

#define N 1
#define NPINS 8
int store[N*8];
int i, j;
void loop( void )
{
  if ( millis() < End )
  {
    int j = 0;
    for(i = 0; i < N; i++) {
      for(j = 0; j < NPINS; j++) {
        store[j] = (analogRead(j)+analogRead(j)+analogRead(j)+analogRead(j))/4.0;
      }
    }
    Count += NPINS;
  }
  else
  {
    Serial.println( Count );
    Count = 0;
    End = millis() + 1000;
  }
}
