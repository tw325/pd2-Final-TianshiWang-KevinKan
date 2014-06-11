PImage bg, cursor;
boolean clicked = false;
planet p0; 
planet p1; 

//RED 
int red2x = 100; int red2y = 200;
int red3x = 100; int red3y = 300;
//GRAY
int gray1x = 250; int gray1y = 100;
int gray2x = 250; int gray2y = 200;
int gray3x = 250; int gray3y = 300;
//BLUE
int blue1x = 500; int blue1y = 100;
int blue2x = 500; int blue2y = 200;
int blue3x = 500; int blue3y = 300;

planet[] plist = new planet[2];

int savedTime;
int clicks;


void setup(){
  noCursor();
  size (640,480);
  bg = loadImage("img/background.jpg");
  cursor = loadImage("img/cursor.png");
  p0 = new planet(50, 50, 36, "red", 100);
  p1 = new planet(500, 400, 36, "blue", 100);
  //p2 = new planet(120, 90, 24, "gray", 24);
  ///p3 = new planet(200, 220, 24, "gray", 24);
  //p4 = new planet(350, 100, 36, "gray", 24);
  //p5 = new planet(420, 80, 30, "gray", 24);
  plist[0] = p0;
  plist[1] = p1;
  savedTime = millis();
}


void mouseClicked(){
  for (planet x: plist){
    if (x.mouseInRadius() && x.Ring.on == false && clicks <2){
      x.ringOn();
      clicks++;
    }
    else if (x.mouseInRadius() && x.Ring.on && clicks >2){
      x.ringOff();
      clicks--;
    }
    else{
      x.ringOff();
      clicks--;
    }
  }
  
   
}


void draw() {
  int passedTime = millis() - savedTime;
  if (passedTime > 1000){
    for (planet y: plist){
      y.grow();
    }
    savedTime = millis();
  }
  background(bg);
  for (planet x: plist){
    image(x.getPlanetImage(), x.getX()-x.getRadius(), x.getY()-x.getRadius());
    x.displayRing();
    text(""+x.getNum(), x.getX(), x.getY());
  }
  image(cursor, mouseX-16, mouseY-16);
}


