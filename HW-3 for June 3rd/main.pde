player p;
enemy[] z = new enemy[10];                   //Assigning 10 enemies
bullet[] goodBullets = new bullet[100];      //Making 100 bullets
int speed = 3;                               //Movement speed of player
int position = 0;                            //Position relative to start
void setup() {
  size(900, 480);                            //Size of canvas (can be changed, enemies will maintian equal distances)
  for (int i=0; i<10; i++) {
    z[i] = new enemy(width/20+i*(width/10), 100, 5);     //Maintaining distances between enemies
  }
  p = new player(3);
}

void draw() {
  
  if (keyPressed){
    if (key == 'D' || key == 'd'){
       p.move(speed);
    }
    if (key == 'A' || key == 'a'){                       //Key controls for movement and shooting.
       p.move(-speed); 
    }
    if (key == 'W' || key == 'w'){
      p.shoot(goodBullets);
    }
  }
  background(255);
  bigStep();
  p.display(position);
  for (int i=0; i<10; i++) {
    if (z[i] == null) continue;                          //Displaying the enemies from the enemy array and checking if any are killed
    z[i].display();
  }
  for (int i = 0; i <goodBullets.length; i++){
    if (goodBullets[i] == null) continue;                //Displaying the bullets from the bullet array
    goodBullets[i].display();
  }
}

void bigStep(){                                          //Making the bullets move and hit the enemy.
  for (int i = 0; i < goodBullets.length; i++){
    if (goodBullets[i]==null) continue;                  //Taking the bullets from the array.
    goodBullets[i].step();
    for (int j = 0; j<z.length;j++){                     
      if (z[j] == null) continue;
      if(goodBullets[i].checkGoodCollision(z[j])){       //Killing the enemy by emptying its spot in the array at collision.
        z[j] = null;
        
      }
    }
  }
  
}
