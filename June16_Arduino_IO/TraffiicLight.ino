//Zheki 16.06.2020

//Declaring variables for:
const int Potentiometer = A0;  //Potentiometer connected to analog A0 pin
const int PhotoResistor = A1;  //Photo resistor connected to analog A1 pin
const int outPin_1 = 9;
const int outPin_2 = 10;       //The three digital output pins to which the LEDs are conneceted
const int outPin_3 = 11;

int potValue = 0;              //Declaring the variables for the sensors' values.
int photoResValue = 0;

void setup() {
  Serial.begin(250000);        //High com rate for smoother LED glow.
}

void loop() {

  potValue = analogRead(Potentiometer);
  photoResValue = analogRead(PhotoResistor);

  if (potValue < 340) {
    analogWrite(outPin_1, 255);                 //IF conditionals to check the value of the potentiometer
  }                                             //and give the appropriate output.
  else {
    analogWrite(outPin_1, 0);
  }
  if (potValue > 340 && potValue < 680) {
    analogWrite(outPin_2, 255);
  }
  else {
    analogWrite(outPin_2, 0);
  }
  if (potValue > 680) {
    analogWrite(outPin_3, 255);
  }
  else {
    analogWrite(outPin_3, 0);
  }

  if (photoResValue < 50) {
    digitalWrite(outPin_1, HIGH);
    digitalWrite(outPin_2, HIGH);              //If conditional which checks if the photo resistor value is below a the specified threshold.
    digitalWrite(outPin_3, HIGH);
  }

  delay(2);
}
