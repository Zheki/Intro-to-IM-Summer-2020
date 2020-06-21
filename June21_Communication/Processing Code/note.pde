class Note {
  float xPos;
  float yPos;
  float randomVel = random(2, 5);
  boolean checkCol = false;
  float zone;
  char sound_x_2;

  Note() {
    int xRandom = int(random(1, 5));
    int yRandom = int(random(0, 20000));
    xPos = xRandom * rect_w - rect_w/2;
    yPos = yRandom * -1;
  }

  void update() {
    yPos += 4;
  }

  void makeSound() {
    if (xPos+20 > potVal && xPos-20 < potVal+100) {
      if (yPos >= height-100 && yPos <= height-80) {
        zone = int(map(xPos, 0, 500, 1, 5));
        checkCol = true;
        sound_x_2 = '1';
        String sound_x = String.valueOf(zone);
        myPort.write(sound_x);
        println(sound_x);
      }
    }
  }

  void display() {
    if (checkCol == false) {
      fill(255, 255, 200);
      circle(xPos, yPos, 40);
    }
  }
}
