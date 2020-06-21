import processing.serial.*;

Serial myPort;
Note n;


int rect_w = 125;
int rect_h = 600;
int potVal = 0;
String potVal_s;
Note[] spawnNotes = new Note[200];


void setup() {

  size(500, 600);

  myPort = new Serial(this, "COM3", 115200);
  myPort.bufferUntil('\n');

  for (int i = 0; i < spawnNotes.length; i++) {
    spawnNotes[i] = new Note();
  }
}

void serialEvent (Serial myPort) {
  potVal_s = myPort.readStringUntil('\n');
  if (potVal_s != null) {
    potVal_s = trim(potVal_s);
    potVal = int(potVal_s);
  }
}

void draw() {

  for (int i = 0; i < 500; i += rect_w) {
    //fill(200-i/5);
    fill(i+100,i/2,250-i/10);
    noStroke();
    rect(i, 0, rect_w, 600);
  }


  for (int i = 0; i < spawnNotes.length; i++) {
    spawnNotes[i].display();
    spawnNotes[i].update();
    spawnNotes[i].makeSound();
  }



  fill(255, 210, 255);
  rect(potVal, height-100, 100, 20);
}


