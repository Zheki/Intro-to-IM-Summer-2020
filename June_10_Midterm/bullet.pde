class bullet { 
  float _xPos;                                     //Bullet's x-position
  float _yPos;                                     //Bullet's y-position
  float _ySpeed;                                   //Bullets's velocity
                                                   //Initializing and constructing the class for the bullets.
  bullet(float xPos, float yPos, float ySpeed){ 
    _ySpeed = ySpeed;
    _xPos = xPos+25;
    _yPos = yPos;

  }
  void display(){                                  //A function for displaying the bullets
  
  fill(0,0,255);                                    
  circle(_xPos, _yPos, 3);    //Bullets are blue circles with a radius of 3 pixels
  }
  void step(){                                     //Function for the movement of the bullet
    _yPos += _ySpeed; 
  }
  
   void step_enemy(){                                     //Function for the movement of the bullet
    _yPos += _ySpeed/7;
  }
  
  boolean checkGoodCollision(enemy thatOne){       //Checking for collision between the bullet and the enemy
    float x = thatOne.getX();                      //by checking the enemies' x and y pos from the enemies class
    float y = thatOne.getY();
    if (_xPos>=x && _xPos<x+30 && _yPos<=y){       //If statement true if bullet hits the enemy.
      return true;
    }
    else return false;
  }
  
  
  boolean checkbadCollision(player thatOne){       //Checking for collision between the bullet and the enemy
    float x = thatOne.getX();                      //by checking the enemies' x and y pos from the enemies class
    float y = thatOne.getY();
    if (_xPos>=x && _xPos<x+30 && _yPos>=y){
      return true;
    }
    else return false;
  }  
  boolean offScreen(int yAxis){ // ako se off screen brisi
    if (_yPos>= yAxis || _yPos<=0){
      return true;
    }
    return false;
  
  }
}

  
