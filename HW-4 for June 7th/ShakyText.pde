//Zheljko Nenadikj 07.06.2020

//This is a very simple code which I wrote to practice the implementation of text in processing. The pre-determined sentence is divided into each
//character. The characters are placed at an even distance accros the screen. When the player interacts with the program, the text begins to uncontrolably shake
//and each letter begins to chane color giving the impression of excitement.

//How to interact with the program?
//-You can interact with the program simply by pressing and holding the left mouse button over the screen. If you wish to stop the shaking, release the mouse button, and the
//movement will immediately stop.



//Beginning of code



String words = "Intro to IM!!!";                       //Words to be displayed on the screen.
char [] letters = new char[words.length()];            //List used to contain every character of the string.
boolean mouse = false;                                 //Default state of the mouse.


void setup() {                               
  size(380, 300);
   frameRate(120);                                     //High framerate for smoother look.
  

  PFont f = createFont("Verdana", 50);                 //Using font Verdana.
  textFont(f);


  for (int i = 0; i < words.length(); i++) {           //Separating the characters into the list.
    letters[i] = words.charAt(i);
  }
}

void draw() {
  background(0);

  float x_line = 45;                                   //X value for the beginning of the text.


  if (mouse == false) {                                //If the mouse is not pressed:
    for (int i = 0; i < words.length(); i++) {
      textSize(42);                                    //Text size.
      text(letters[i], x_line, height/2);               
      x_line += textWidth(letters[i]);                 //Even arrangement of letters.
    }
  }

  if (mouse == true) {                                 //If the mouse is pressed.
    for (int j = 0; j < words.length(); j++) {
      textSize(42);
      fill(random(0,255), random(0,255), random(0,255));                       //Giving a random color to each character during each loop.
      text(letters[j], x_line + random(-30, 30), height/2+random(-30, 30));    //X and Y of character moves +- 30 pixels.
      x_line += textWidth(letters[j]);
    }
  }
}


void mouseReleased() {                                 //Check if mouse is released
  mouse = false;
}

void mousePressed() {                                  //Check if mouse is pressed
  mouse = true;
}

//End of code.
