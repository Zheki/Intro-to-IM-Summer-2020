class bullet { 
  float _xPos;                                     //Bullet's x-position
  float _yPos;                                     //Bullet's y-position
  float _xSpeed;                                   //Bullets's velocity
                                                   //Initializing and constructing the class for the bullets.
  bullet(float xPos, float yPos, float xSpeed){ 
    _xSpeed = xSpeed;
    _xPos = xPos;
    _yPos = yPos;

  }
  void display(){                                  //A function for displaying the bullets
  
  fill(0,0,255);                                    
  circle(_xPos, _yPos, 3);                         //Bullets are blue circles with a radius of 3 pixels
  }
  void step(){                                     //Function for the movement of the bullet
    _yPos += _xSpeed; 
  }
  boolean checkGoodCollision(enemy thatOne){       //Checking for collision between the bullet and the enemy
    float x = thatOne.getX();                      //by checking the enemies' x and y pos from the enemies class
    float y = thatOne.getY();
    if (_xPos>=x && _xPos<x+10 && _yPos<=y){       //If statement true if bullet hits the enemy.
      return true;
    }
    else return false;
  }
  
}
