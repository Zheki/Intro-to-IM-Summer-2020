#include "notes.h"

const int pot = A0;
const int buzz = 9;
const int pinR = 3;
const int pinG = 5;
const int pinB = 6;


void setup() {
  Serial.begin(115200);
  pinMode(pot, INPUT);
  pinMode(buzz, OUTPUT);
  pinMode(pinR, OUTPUT);
  pinMode(pinG, OUTPUT);
  pinMode(pinB, OUTPUT);


}

void loop() {
  int potVal = map(analogRead(pot), 0, 1023, 0, 400);
  Serial.println(potVal);

  char soundZone = Serial.read();
  if (soundZone == '1') {
    tone(buzz, NOTE_C4, 200);
    analogWrite(pinR, 100);
    analogWrite(pinG, 0);
    analogWrite(pinB, 250);
  }
  if (soundZone == '2') {
    tone(buzz, NOTE_D4, 200);
    analogWrite(pinR, 225);
    analogWrite(pinG, 62);
    analogWrite(pinB, 238);
  }
  if (soundZone == '3') {
    tone(buzz, NOTE_E4, 200);
    analogWrite(pinR, 255);
    analogWrite(pinG, 125);
    analogWrite(pinB, 225);
  }
  if (soundZone == '4') {
    tone(buzz, NOTE_F4, 200);
    analogWrite(pinR, 255);
    analogWrite(pinG, 185);
    analogWrite(pinB, 215);
  }


}
