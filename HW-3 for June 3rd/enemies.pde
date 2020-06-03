class enemy { //Variables of the class for the enemy
  float _xPos;
  float _yPos;
  float _xSpeed;


  enemy(float xPos, float yPos, float xSpeed){ //Constructor to assign the variables
    _xSpeed = xSpeed;
    _xPos = xPos;
    _yPos = yPos;

  }
  void display(){ //Displaying the enemies
  
  fill(127);
  rect(_xPos, _yPos,10,10);
  }
  
  float getX(){
    return _xPos;
  }                               //Giving information on the enemies' x and y position.
  float getY(){
    return _yPos;
  }
}
