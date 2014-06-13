PImage bg, cursor;
boolean clicked = false;
planet p0,p1,p2; 

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

planet[] plist = new planet[3];

int savedTime;
int clicks;


void setup(){
  noCursor();
  size (640,480);
  bg = loadImage("img/background.jpg");
  cursor = loadImage("img/cursor.png");
  p0 = new planet(50, 50, 36, "red");
  p1 = new planet(500, 400, 36, "blue");
  p2 = new planet(120, 90, 24, "gray");
  ///p3 = new planet(200, 220, 24, "gray", 24);
  //p4 = new planet(350, 100, 36, "gray", 24);
  //p5 = new planet(420, 80, 30, "gray", 24);
  plist[0] = p0;
  plist[1] = p1;
  plist[2] = p2;
  savedTime = millis();
}
boolean inRadiusAny(){
  for (planet x: plist){
    if (x.getDistance(mouseX, mouseY) < x.radius)
      return true;
  }
  return false;
}
void allOff(){
  for (planet x: plist){
    x.ringOff();
  }
  clicks =0;
}

void mouseClicked(){
  for (planet x: plist){
    if (x.mouseInRadius() && clicks >=2 && x.Ring.on){
      x.ringOff();
      clicks--;
    }
    else if (x.mouseInRadius() && clicks >= 2)
      allOff();
    else if (x.mouseInRadius() && !x.Ring.on && clicks <2){
      x.ringOn();
      clicks++;
    }  
  }
  if (inRadiusAny() == false)
      allOff();
}

void mouseOver(){
  for (planet x: plist){
    if (x.mouseInRadius() && !x.Ring.on){
      x.ringOn();
    }
  }
}


int xsave1, ysave1, xsave2, ysave2;
void linesave(){
  for (int i = 0; i< plist.length; i++){
    if (plist[i].Ring.on && xsave1 == 0){
      xsave1 = plist[i].xcor;
      ysave1 = plist[i].ycor;
    }
    else if (plist[i].Ring.on && xsave1 != 0){
      xsave2 = plist[i].xcor;
      ysave2 = plist[i].ycor;
    }
  }
}
// check for mouseX mouseY and see if clicked == true
void draw() {
  background(bg);
  if (clicks == 2){
    linesave();
    line(xsave1, ysave1, xsave2, ysave2);
    xsave1 = 0;
    ysave1 = 0;
    xsave2 = 0;
    ysave2 = 0;
  }
  println(clicks);
  int passedTime = millis() - savedTime;
  if (passedTime > 1000){
    for (planet y: plist){
      y.grow();
    }
    savedTime = millis();
  }

  for (planet x: plist){
    image(x.getPlanetImage(), x.xcor-x.radius, x.ycor-x.radius);
    x.displayRing();
    text(""+x.num, x.xcor-10, x.ycor+5);
  }
  image(cursor, mouseX-16, mouseY-16);
}


