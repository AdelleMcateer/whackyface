/*Name : Adelle McAteer 
 Student Number: 20091411
 */

import javax.swing.*;  //required to include a string

String strName; //setting String as a global variable in order to use it throughout the animation 

void setup() {
  size(450, 375); //sets the size of the display window 
  frameRate(8);  //slow down the frame rate to 8
  strName = JOptionPane.showInputDialog("Please enter your name:"); //String used for name input and welcome dialog box
  JOptionPane.showMessageDialog(null, "Welcome to my anmimated sketch " + strName + ". \n \n Move, press & drag the mouse to see the animation in action.");//message to appear in the dialog box
}

void draw() 
{
  background(0); //background set to black
  drawBackground();//method call to draw the background
}

void mouseClicked()//to give the illusion of blinking eyes
{
  fill(255, 255, 0); //fill colour yellow
  ellipse(250, 100, 60, 60);//ellipse for eye one
  ellipse(200, 100, 60, 60);//ellipse for eye two
}

void mouseDragged()//eyes closed
{
  fill(255, 255, 0);//fill colour yellow
  ellipse(250, 100, 60, 60);//ellipse for eye one
  ellipse(200, 100, 60, 60);//ellipse for eye two
}
void drawBackground() { //draw background of green and blue squares within a for loop
  for (int i=0; i < 5; i++) {
    for (int j=0; j < 5; j++) { //nested for loop
      if ((i + j + 1) % 2 == 0)
        fill(100, 255, 0); // green color squares
      else
        fill(0, 0, 255); // blue colour squares
      rect(j*100, i*100, 75, 75); //draw the squares
    }
  }  
  drawFace();//bespoke method to  draw the features of the face
}   
void eye(int x, int y)//parameters for drawEyes bespoke method
{
  // draw white
  fill(255);//white
  ellipse(x, y, 60, 60);//white ellipse
  // draw black  using an if statment to give the follow mosue effect to the eyes
  fill(0);
  if (mouseX <=200) {  //eyes looking towards the left
    ellipse(x-15, y, 30, 30);
  } else if (mouseX >=245) {  //eyes looking towards the right
    ellipse(x+15, y, 30, 30);
  } else {                  //eyes slightly centered
    ellipse(x+10, y, 30, 30);
  }
  // draw spot using an if statment to give the follow mosue effect to the eyes
  fill(255);
  if ((mouseX <=200)&& (mouseY <=170)) { //eyes looking towards upper-left quadrant
    ellipse(x-15, y-10, 6, 6);
  } else if ((mouseX<=200) && (mouseY >=170)) {//eyes looking towards lower-left quadrant
    ellipse(x-15, y+5, 6, 6);
  } else if ((mouseX>=200) &&(mouseY<=170)) { //eyes looking towards upper-right hand quadrant
    ellipse(x+20, y-10, 6, 6);
  } else {
    ellipse(x+20, y+10, 6, 6);//eyes looking towards upper-right hand quadrant
  }
}
void drawFaceBackground() //bespoke method to  draw the face background
{
  // draw yellow face
  fill(255, 255, 0);
  ellipse(215, 125, 150, 150);
}
void drawEyes() {
  // draw eyes
  eye(250, 100);
  eye(200, 100);
}

void drawNose() {
  //draw nose
  fill(255, 255, 0); //yellow fill
  strokeWeight(3);//set the strokeweight to a thickness of 3 pixels
  arc(225, 140, 30, 30, 0, 3.14);// arc used for the nose shape
}

void drawMouth() {
  //draw mouth using arc
  fill(0); //color set to black
  arc(225, 160, 90, 20, 0, 3.14);
}
void drawTongue() {
  // draw toungue using the arc method
  fill(255, 0, 0); //set color to red
  strokeWeight(1); //set strokeweight to default 1 pixel thickness

  if (mouseX <=200) {
    arc(195, 160, 30, 120, 0, 3.14); //tongue moving to the left based on position of the mouse
  } else if (mouseX >=250) {
    arc(255, 160, 30, 120, 0, 3.14); //tongue moving to the right based on position of the mouse
  } else { 
    arc(225, 160, 30, 120, 0, 3.14); //tongue centered
  }
}
void drawSpeechBubble() 
{  //draw a speech bubble with text for a mouse event
  if (mousePressed) { //only draw the speech bubble if the mouse button is pressed
    fill(0);
    text(strName, 370, 90);//include the value from the string in the text bubble

    if (strName.length () <4) { //use one size speech bubble if the length of the string is less than four
      fill(255);// sets the speech bubble color to white
      ellipse(370, 90, 100, 60);//large speech bubble
      ellipse(340, 135, 40, 20); //large dot for the speech bubble
      ellipse(310, 150, 20, 10); //smaller dot for the speech bubble
      fill(0); //set text colour to black
      textSize(12);//set the text size within the speech bubble
      text(strName + " has " + strName.length() + "\n characters.", 340, 90);// Display the String input and the number of characters within the string
    } else if (strName.length () <8) { //use another size speech bubble if the length of the string is less than eight
      fill(255);// sets the speech bubble color to white
      ellipse(370, 90, 110, 80);//large speech bubble
      ellipse(340, 150, 40, 20); //large dot for the speech bubble
      ellipse(310, 170, 20, 10); //smaller dot for the speech bubble
      fill(0);//set text colour to black
      textSize(12);//set the text size within the speech bubble
      text(strName + " has " + strName.length() + "\n characters.", 330, 90);// Display the String input and the number of characters within the string
    } else { //use default size
      fill(255);// sets the speech bubble color to white
      ellipse(370, 90, 140, 100);//large speech bubble
      ellipse(340, 155, 40, 20); //large dot for the speech bubble
      ellipse(310, 170, 20, 10); //smaller dot for the speech bubble
      fill(0);//set text colour to black
      textSize(12);//set the text size within the speech bubble
      text(strName + " has " + strName.length() + "\n characters.", 320, 90);// Display the String input and the number of characters within the string
    }
  }
}  
void drawFace() { //call to  draw the face and all the defined methods within it. 
  drawFaceBackground();
  drawEyes();
  drawNose();
  drawMouth();
  drawTongue();
  drawSpeechBubble();
}
