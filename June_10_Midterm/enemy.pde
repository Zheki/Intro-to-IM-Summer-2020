class enemy { //Variables of the class for the enemy
  float _xPos;
  float _yPos;
  float _ySpeed;


  enemy(float xPos, float yPos, float ySpeed) { //Constructor to assign the variables
    _ySpeed = ySpeed;
    _xPos = xPos;
    _yPos = yPos;
  }
  void display() { //Displaying the enemies

    image(alien, _xPos, _yPos);   //Drawing the image for enemies.
  }
  
  void move(){
   _yPos += _ySpeed;
    
  }
 //dodadeno 
  void shoot(bullet[] allOfThem){              //Function for shooting.
    
     for (int i=0; i<allOfThem.length;i++){        
       if(allOfThem[i]==null){
         allOfThem[i] = new bullet(_xPos, _yPos, 10);
         break;
       }
    }
  }

  float getX() {
    return _xPos;
  }                               //Giving information on the enemies' x and y position.
  float getY() {
    return _yPos;
  }
}
