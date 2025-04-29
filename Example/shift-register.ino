#include <SPI.h>

uint8_t t = 0;

void setup() {
  pinMode(2, OUTPUT);
  digitalWrite(2, LOW);

  SPI.begin();
  SPI.setBitOrder(LSBFIRST);
  SPI.setClockDivider(SPI_CLOCK_DIV4);
  Serial.begin(115200);
}

void loop() {
  uint64_t v = ~(3ULL << t);
  t = (t+1) % 64;

  SPI.transfer(&v, sizeof v);
  digitalWrite(2, HIGH);
  digitalWrite(2, LOW);
  delay(20);
}
