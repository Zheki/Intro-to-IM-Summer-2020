// Zheki 25.06.2020

//Including neccesary libraries
#include <Wire.h>
#include <Adafruit_MotorShield.h>
#include "utility/Adafruit_MS_PWMServoDriver.h"
#include <Servo.h>
#include <NewPing.h>

Adafruit_MotorShield AFMS = Adafruit_MotorShield();
Servo myservo;
Adafruit_DCMotor *motorRight = AFMS.getMotor(1);
Adafruit_DCMotor *motorLeft = AFMS.getMotor(3);

//Creating variables and constants
const int trigPin = 9;        //Sonar trigger pin
const int echoPin = 8;        //Sonar echo pin
const int maxDistance = 300;  //Sonar maximum distance

NewPing sonar(trigPin, echoPin, maxDistance); //Assigning values to variables for the sonar library

int distance;                 //Sonar distance variable

void setup() {
  myservo.attach(10); //Servo is attached to digital pin 10
  pinMode(trigPin, OUTPUT); // Sonar trigger pin is output
  pinMode(echoPin, INPUT); // Sonar echo pin is input
  Serial.begin(9600); // Starts the serial communication
  AFMS.begin();       //Starts the motor shield
}

void loop() {
  checkFront();                       //Checking in front of car and assigning values for distance(left and right are not definite, only increased field of view)
  int distance_front = checkFront();
  checkRight();
  int distance_right = checkRight();
  checkLeft;
  int distance_left = checkLeft();

  if (distance_left < 30 || distance_right < 30 || distance_front < 30) {   //30cm is the treshold. If any object is within 30cm in front of the car:
    stopCar();                                                              //Stop the car
    delay(500);
    backward();                                                             //Slightly move backward.
    delay(900);
    if (distance_left < distance_right) {                                   //Depending on the field of view values, turn car left or right
      right();
      delay(450);
    }
    else {
      left();
      delay(450);
    }
  }
  else {                                                                    //Otherwise the car moves forward.
    checkFront();
    forward();
  }
}

void forward() {              //Function for moving forward

  motorRight->setSpeed(150);  //PWM output (same for all movement functions)
  motorRight->run(FORWARD);   //Direction  (same for all movement functions)
  motorLeft->setSpeed(150);
  motorLeft->run(FORWARD);

}

void backward() {            //Function for moving backward

  motorRight->setSpeed(120);
  motorRight->run(BACKWARD);
  motorLeft->setSpeed(120);
  motorLeft->run(BACKWARD);

}

void right() {               //Function for turning right

  motorRight->setSpeed(150);
  motorRight->run(FORWARD);
  motorLeft->setSpeed(0);
  motorLeft->run(FORWARD);

}

void left() {                //Function for turning left

  motorRight->setSpeed(0);
  motorRight->run(FORWARD);
  motorLeft->setSpeed(150);
  motorLeft->run(FORWARD);

}

void stopCar() {             //Stops the car from moving

  motorRight->setSpeed(0);
  motorRight->run(FORWARD);
  motorLeft->setSpeed(0);
  motorLeft->run(FORWARD);

}
int checkFront() {           //Function for checking in front of the car
  myservo.write(90);         //Move servo so the sonar would look forward
  delay(50);
  checkDistance();           //Checking distance from the distance function
  return distance;

}


int checkLeft() {            //Function for checking left of the car
  myservo.write(70);
  delay(50);
  checkDistance();
  return distance;

}

int checkRight() {           //Fucntion for checking right of the car
  myservo.write(120);
  delay(50);
  checkDistance();
  return distance;



}

void checkDistance() {       //Function for checking the distance through the sonar. (Made incredibly easy thanks to the library NewPing made by Tim Eckel)
  distance = sonar.ping_cm();
  if (distance == 0)         //Sometimes the sonar misbehaves and gives a value of 0 without an object in front of the car. This fixes that problem).
    distance = maxDistance;
}

