class player { //Variables of the class for the player
  float _xPos;
  float _yPos;
  //int _lives; 

  player(int lives){ //Constructor to assign the variables
    //_lives = lives; 
    _xPos = width/2;
    _yPos = height-50;

  }
  void display(int x){ //Function for displaying the player
  
  fill(0);
  rect(_xPos+x, _yPos,10,10);   //Player is displayed as a black rectangle.
  }
  
  void shoot(bullet[] allOfThem){              //Function for shooting.
     for (int i=0; i<allOfThem.length;i++){        
       if(allOfThem[i]==null){
         allOfThem[i] = new bullet(_xPos, _yPos, -10);
         break;
       }
    }
  }
  float getX(){
    return _xPos;
  }
  float getY(){
    return _yPos;
  }
  
  void move(int amount){         //Moving function
    _xPos +=amount;
  }
}
