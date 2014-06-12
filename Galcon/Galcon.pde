PImage bg, cursor;
boolean clicked = false;
planet p0,p1,p2,p3,p4,p5;

planet[] plist = new planet[6];


int savedTime;
int clicks = 0;

void setup(){
  noCursor();
  size (640,480);
  bg = loadImage("img/background.jpg");
  cursor = loadImage("img/cursor.png");
  p0 = new planet(50, 50, 36, "red");
  p1 = new planet(500, 400, 36, "blue");
  p2 = new planet(120, 90, 24, "gray");
  p3 = new planet(200, 220, 24, "gray");
  p4 = new planet(350, 100, 36, "gray");
  p5 = new planet(420, 80, 30, "gray");
  plist[0] = p0;
  plist[1] = p1;
  plist[2] = p2;
  plist[3] = p3;
  plist[4] = p4;
  plist[5] = p5;
  savedTime = millis();
}

boolean inRadiusAny(){ //if the mouse is within any planet
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
  clicks = 0;
}

void mousePressed(){
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
int a= 0;
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


