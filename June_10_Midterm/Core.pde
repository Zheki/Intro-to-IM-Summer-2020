//Zheljko Nenadikj 10.06.2020 Midterm

//This is the final version of the space shooter game. The objective of this game is to kill all of the on-screen enemies by shooting them with a laser bullet.
//There are 12 alien enemies which are firing at random rates. Make sure to dodge the bullets, since you only have 3 lives. Each enemy needs to be shot once to be killed.
//If you lose the 3 lives, the game instantly stops, and you are required to run it again in order to play.
//If you win the game by killing all of the enemies, your reward is listening to the awesome background music for as long as you wish.
//How to play:
//Use the A and D buttons to move left and right.
//Use the W button to shoot at the enemies.
//Survive and kill them all.
//Have fun! :)

import processing.sound.*;


player p;
SoundFile pShoot_sound, background_sound;    //Declaring sounds
PImage background_img, ship, alien;          //Declaring images
PFont f;                                     //Declaring font for the text
enemy[] z = new enemy[12];                   //Assigning 12 enemies
bullet[] goodBullets = new bullet[100];      //Player bullet array
bullet[] badBullets = new bullet[100];       //Enemy bullet array
int speed = 3;                               //Movement speed of player
int position = 0;                            //Position relative to start
int rand_2;                                  //Random variable for enemy shoot timing

void setup() {
  background_img = loadImage("background.jpg");   //Loading images, sound, and font for the game
  ship = loadImage("player_ship.png");
  alien = loadImage("alien.png");
  pShoot_sound = new SoundFile(this, "Laser.wav");
  background_sound = new SoundFile(this, "background_sound.wav");
  background_sound.loop();
  f = createFont("Georgia", 32);

  size(900, 720);                                       //Size of canvas (can be changed, enemies will maintian equal distances)
  for (int i=0; i<12; i++) {
    z[i] = new enemy(width/20+i*(width/12), 100);    //Maintaining distances between enemies
  }
  p = new player(3);                                    //Assigning player lives
}

void draw() {

  if (keyPressed) {
    if (key == 'D' || key == 'd') {
      p.move(speed);
    }
    if (key == 'A' || key == 'a') {                       //Key controls for movement and shooting.
      p.move(-speed);
    }
    if (key == 'W' || key == 'w') {
      p.shoot(goodBullets);
    }
  }

  
  if (random(0, 1000)>854) {
    do {
      float rnd = random(0, 12);                          //Enemy shooting. Random values used to make a around a 14% chance of the bullet being shot. (Delay between enemy shots).
      rand_2 = int(rnd);
    } while (z[rand_2]==null);
    z[rand_2].shoot(badBullets);
  }

  image(background_img, 0, 0);                            //Drawing the background image.
  fill(255);
  textFont(f);
  text("Lives: " + p._lives, width-150, 50);              //Text displaying lives.
  bigStep();                                              //Calling the bigStep and smallStep functions.
  smallStep();
  p.display(position);                                    //Displaying player
  for (int i=0; i<12; i++) {
    if (z[i] == null) continue;                           //Displaying the enemies from the enemy array and checking if any are killed
    z[i].display();
  }
  for (int i = 0; i <goodBullets.length; i++) {
    if (goodBullets[i] == null) continue;                 //Displaying the player's bullets from the bullet array
    goodBullets[i].display();
  }

  for (int i = 0; i <badBullets.length; i++) {
    if (badBullets[i] == null) continue;                  //Displaying the enemies' bullets from the bullet array
    badBullets[i].display_enemy();
  }
}

void bigStep() {                                          //Making the bullets move and hit the enemy.
  for (int i = 0; i < goodBullets.length; i++) {
    if (goodBullets[i]==null) continue;                   //Taking the bullets from the array.
    goodBullets[i].step();
    if (goodBullets[i].offScreen(height)) {               //Checking if bullets are out of screen boundaries, and then eliminating the bullet.
      goodBullets[i] = null;
      continue;
    }
    for (int j = 0; j<z.length; j++) {                     
      if (z[j] == null) continue;
      if (goodBullets[i]==null) continue; 
      if (goodBullets[i].checkGoodCollision(z[j])) {       //Killing the enemy by emptying its spot in the array at collision.
        z[j] = null;
        goodBullets[i] = null;
      }
    }
  }
}

void smallStep() {                                          //Making the bullets move and hit the player.

  for (int i = 0; i < badBullets.length; i++) {
    if (badBullets[i]==null) continue;                      //Taking the bullets from the array.
    badBullets[i].step_enemy();
    if (badBullets[i].offScreen(height)) {                  //Checking if bullets are out of screen boundaries, and then eliminating the bullet.
      badBullets[i] = null;
      continue;
    }
    if (badBullets[i].checkbadCollision(p)) {               //Checking for player collision statement.
      badBullets[i] = null;                                
      print("Dead");
      if (p.update_lives()==0) {                            //Updating lives
        exit();                                             //Exiting the game if the player lost all lives.
      }
    }
  }
}
