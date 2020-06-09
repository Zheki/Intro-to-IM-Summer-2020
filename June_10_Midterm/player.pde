class player { //Variables of the class for the player
  float _xPos;
  float _yPos;
  int _lives;
  int cooldown = 60;

  player(int lives){ //Constructor to assign the variables
    _lives = lives; 
    _xPos = width/2;
    _yPos = height-100;

  }
  void display(int x){ //Function for displaying the player
  
    image(ship, _xPos+x, _yPos);   //Drawing the image of the player.
    cooldown--; //sekoe crtanje namali cooldown 
    print(cooldown); 
    print("\n");
  }
  
  void shoot(bullet[] allOfThem){              //Function for shooting.
     if (cooldown <= 0){
     for (int i=0; i<allOfThem.length;i++){        
       if(allOfThem[i]==null){
         allOfThem[i] = new bullet(_xPos, _yPos, -10);
         break;
       }
    }
    cooldown=60;
    }
  }
  float getX(){
    return _xPos;
  }
  float getY(){
    return _yPos;
  }
  
  int update_lives(){
    return --_lives;
  }
  
  void move(int amount){         //Moving function
    _xPos +=amount;
  }
  
}
