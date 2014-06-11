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

planet[] plist = new planet[10];

int savedTime;
int numRings;


void setup(){
  noCursor();
  size (640,480);
  bg = loadImage("img/background.jpg");
  cursor = loadImage("img/cursor.png");
  p0 = new planet(50, 50, 36, "red", 100);
  p1 = new planet(550, 420, 36, "blue", 100);
  //p2 = new planet(120, 90, 24, "gray", 24);
  ///p3 = new planet(200, 220, 24, "gray", 24);
  //p4 = new planet(350, 100, 36, "gray", 24);
  //p5 = new planet(420, 80, 30, "gray", 24);
  plist[0] = p0;
  plist[1] = p1;
  savedTime = millis();
}


void mouseClicked(){
  if (p0.mouseInRadius()){
    p0.ringToggle();
  }   
  /*if (p0.getDistance(mouseX, mouseY)<p0.getRadius()){
    if (rcircle1.on == false){
      rcircle1.setOn();
      numRings++;
    }else{
      rcircle1.setOff();
      numRings--;
    }
  }*/
  
}


void draw() {
  int passedTime = millis() - savedTime;
  if (passedTime > 1000){
    p0.grow();
    p1.grow();
    savedTime = millis();
  }
  background(bg);
  image(p0.getPlanetImage(), p0.getX()-p0.getRadius(), p0.getY()-p0.getRadius());
  image(p1.getPlanetImage(), p1.getX()-p1.getRadius(), p1.getY()-p1.getRadius());

  text(""+p0.getNum(), p0.getX(), p0.getY());
  text(""+p1.getNum(), p0.getX(), p0.getY());
  p0.displayRing();
  image(cursor, mouseX-16, mouseY-16);
}


