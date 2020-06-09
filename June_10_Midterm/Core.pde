//Zheljko Nenadikj 08.06.2020
//This is an updated version of the space shooter game. I used images to make the game more immersive.
//The goal of this excercise was to load the images into the code successfully without disturbig the code itself.
//How to use the program?
//Use the A and D keys to move left and right, and the W key to shoot. Aim at the green aliens above the space ship.
//Be careful! You only have 100 bullets to kill the enemies. You win by killing all enemies before you run out of bullets.
import processing.serial.*;



player p;
PImage background_img, ship, alien;          //Note: Minimize global variables, declare it in the class!
enemy[] z = new enemy[12];                   //Assigning 10 enemies
bullet[] goodBullets = new bullet[100];      //Making 100 bullets
bullet[] badBullets = new bullet[100];      //Making 100 bullets
int speed = 3;                               //Movement speed of player
int position = 0;                            //Position relative to start
int xAxis = 900;
int yAxis = 720;
int rand_2;

void setup() {
  background_img = loadImage("background.jpg");   //Loading an image for the background.
  ship = loadImage("player_ship.png");
  alien = loadImage("alien.png");
  
  size(900, 720);                            //Size of canvas (can be changed, enemies will maintian equal distances)
  for (int i=0; i<12; i++) {
    z[i] = new enemy(width/20+i*(width/12), 100, 5);    //Maintaining distances between enemies
  }
  p = new player(3);
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
  
  //enemy shoot
  if (random(0,1000)>854){
    do{
      float rnd = random(0, 12);
      rand_2 = int(rnd);
    }
    while (z[rand_2]==null);
    z[rand_2].shoot(badBullets);
    
  }
 

  image(background_img, 0, 0);                           //Drawing the background image.
  bigStep();
  smallStep();
  p.display(position);
  for (int i=0; i<12; i++) {
    if (z[i] == null) continue;                          //Displaying the enemies from the enemy array and checking if any are killed
    z[i].display();
  }
  for (int i = 0; i <goodBullets.length; i++) {
    if (goodBullets[i] == null) continue;                //Displaying the bullets from the bullet array
    goodBullets[i].display();
  }
  
  for (int i = 0; i <badBullets.length; i++) {
    if (badBullets[i] == null) continue;                //Displaying the bullets from the bullet array
    badBullets[i].display();
  }
  
  
}

void bigStep() {                                          //Making the bullets move and hit the enemy.
  for (int i = 0; i < goodBullets.length; i++) {
    if (goodBullets[i]==null) continue;                   //Taking the bullets from the array.
    goodBullets[i].step();
    if (goodBullets[i].offScreen(yAxis)){
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

//dodadeno hit the player
void smallStep() {                                          //Making the bullets move and hit the enemy.
 
  for (int i = 0; i < badBullets.length; i++) {
    if (badBullets[i]==null) continue;                   //Taking the bullets from the array.
    badBullets[i].step_enemy();
    if (badBullets[i].offScreen(yAxis)){
      badBullets[i] = null;
      continue;
    }
    if (badBullets[i].checkbadCollision(p)) {       //Killing the enemy by emptying its spot in the array at collision.
        badBullets[i] = null;
        print("Dead");
        if(p.update_lives()==0) {print("you lose"); exit();}
        print(p._lives);
      }
  
  }
  
  
}
