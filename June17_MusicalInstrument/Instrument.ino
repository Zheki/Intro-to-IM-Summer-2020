//Zheki 17.06.2020
//Code for the ultrasonic sensor distance measurement inspired by Ultrasonic Sensor HC-SR04 and Arduino Tutorial, Dejan Nedelkovski, www.HowToMechatronics.com

#include "notes.h"

const int buttonRed = 2;       //Red push button pin.
const int buttonBlue = 4;      //Blue push button pin.
const int buzz = 8;            //Buzzer pin.
const int trigger = 9;         //Ultra sonic sensor trigger pin.
const int echo = 10;           //Ultra sonic sensor echo pin.
const int lightSens = A0;      //Photo resistor pin.

int redVal, blueVal, lightVal = 0;   //Values for the push buttons(later HIGH and LOW) and the photoresistor(analog).
int distance;                        //Distance variable for calculating the distance given by the sensor.
long duration;                       //Duration of the pulse of the sensor (time between transmiting and recieving the singal).




void setup() {
  Serial.begin(9600);
  pinMode(buttonRed, INPUT);         //Assigning pin modes if Input or Output.
  pinMode(buttonBlue, INPUT);
  pinMode(echo, INPUT);
  pinMode(trigger, OUTPUT);


}

void loop() {

  digitalWrite(trigger, LOW);            //Clearing the trigger.
  delayMicroseconds(2);
  digitalWrite(trigger, HIGH);           //Turning the trigger on for 10 micro seconds.
  delayMicroseconds(10);
  digitalWrite(trigger, LOW);            //Turning the trigger off.
  duration = pulseIn(echo, HIGH);        //Reads the echo pin's value and returns how fast the pusle was (change from low-high-low) in microseconds.
  distance = duration * 0.034 / 2;       //Distance is calculated by using the duration read from the previous line, a constant for the speed of sound, divided by two for both ways (echo).

  redVal = digitalRead(buttonRed);       //Assigning values of the buttons
  blueVal = digitalRead(buttonBlue);
  lightVal = analogRead(lightSens);


  if (lightVal > 50 || blueVal == HIGH ) {              //Checking if the room is dark.
    while (redVal == HIGH && distance <= 7) {           //Checking if the button is pushed, and checking the distance.
      tone(buzz, NOTE_C4);                              //Playing the appropriate note for the distance.
      redVal = digitalRead(buttonRed);
      blueVal = digitalRead(buttonBlue);

    }
    while (redVal == HIGH && distance <= 11 && distance > 7 ) {
      tone(buzz, NOTE_D4);
      redVal = digitalRead(buttonRed);
      blueVal = digitalRead(buttonBlue);
    }

    while (redVal == HIGH && distance <= 15 && distance > 11 ) {
      tone(buzz, NOTE_E4);
      redVal = digitalRead(buttonRed);
      blueVal = digitalRead(buttonBlue);

    }
    while (redVal == HIGH && distance <= 19 && distance > 15 ) {
      tone(buzz, NOTE_F4);
      redVal = digitalRead(buttonRed);
      blueVal = digitalRead(buttonBlue);
    }

    while (redVal == HIGH && distance <= 23 && distance > 19 ) {
      tone(buzz, NOTE_G4);
      redVal = digitalRead(buttonRed);
      blueVal = digitalRead(buttonBlue);
    }
    while (redVal == HIGH && distance <= 27 && distance > 23 ) {
      tone(buzz, NOTE_A4);
      redVal = digitalRead(buttonRed);
      blueVal = digitalRead(buttonBlue);
    }
    while (redVal == HIGH && distance <= 31 && distance > 27 ) {
      tone(buzz, NOTE_B4);
      redVal = digitalRead(buttonRed);
      blueVal = digitalRead(buttonBlue);
    }
    while (redVal == HIGH && distance <= 35 && distance > 31 ) {
      tone(buzz, NOTE_C5);
      redVal = digitalRead(buttonRed);
      blueVal = digitalRead(buttonBlue);
    }
    noTone(buzz);                                                       //If the button is released, stop playing the sound.
  }
}
//End of code.
