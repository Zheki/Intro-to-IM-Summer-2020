//Start of code.
void setup() {
  
  //Setting up the size of the canvas.
  size(300, 300);

}

//Initializing variables for later use
float deg = 0.05;                 //Rate of arc development.
float R = random(0, 255);         //Random value for Red.
float G = random(0, 255);         //Random value for Green.
float B = random(0, 255);         //Random value for Blue.
float rand_x = random(50, 250);   //Random circle X location.
float rand_y = random(50, 250);   //Random circle Y location.

void draw(){
  //A 'for' loop creating a two dimentional array of differently colored squares for the background.
  for (int i = 0; i < 300; i = i+5) {
    for (int j = 0; j < 300; j = j+5) {
      noStroke();
      fill(15,i+15,j+15);
      square(i, j, 10);
    }
  }
  
  //An 'if' condition which generates the circles on the screen. Checks if the circle is completed and waits for a split second before generating another circle.
  if(deg < 8){ 
    fill(0,G,B);                                //The red color is not used in the circle, however, for future convenience (in case this needs to be changed) I did not remove the variable for the color red from the code.
    arc(rand_x, rand_y, 50, 50, 0, deg, PIE);
    deg = deg + 0.05;
  }
  else{                                         //'Else' condition which restarts the generation of the circle.
    deg = 0;
    setup();
    R = random(0, 255);
    G = random(0, 255);
    B = random(0, 255);
    rand_x = random(50, 250);
    rand_y = random(50, 250);
    
  }
  
  
}
// End of code.
