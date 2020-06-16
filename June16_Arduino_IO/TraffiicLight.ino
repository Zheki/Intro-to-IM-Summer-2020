//Zheki

const int Potentiometer = A0;
const int PhotoResistor = A1;
const int outPin_1 = 9;
const int outPin_2 = 10;
const int outPin_3 = 11;

int potValue = 0;        
//int outputValue = 0;        
int photoResValue = 0;

void setup() {
  Serial.begin(250000);
}

void loop() {

  potValue = analogRead(Potentiometer);
  photoResValue = analogRead(PhotoResistor);

  if (potValue < 340) {
    analogWrite(outPin_1, 255);
  }
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


  Serial.print("sensor = ");
  Serial.print(potValue);
  Serial.print("\t output = ");
  Serial.println(photoResValue);

  if (photoResValue < 50) {
    digitalWrite(outPin_1, HIGH);
    digitalWrite(outPin_2, HIGH);
    digitalWrite(outPin_3, HIGH);
  }

  delay(2);
}
