PImage bg, cursor;
boolean clicked = false;
planet p0,p1,p2,p3,p4,p5,p6;
planet[] plist = new planet[7];

spaceship sp;
spaceship sp1;
spaceship sp2;
spaceship[] splist = new spaceship[3];

int ssave;
int xsave1, ysave1, xsave2, ysave2;
int clicks = 0;
int savedTime1,savedTime2,savedTime3;


void setup(){
  noCursor();
  size (640,480);
  bg = loadImage("img/background.jpg");
  cursor = loadImage("img/cursor.png");
  p0 = new planet(50, 50, 36, "blue");
  p1 = new planet(500, 400, 30, "red");
  p2 = new planet(120, 90, 24, "gray");
  p3 = new planet(200, 220, 24, "gray");
  p4 = new planet(350, 100, 36, "gray");
  p5 = new planet(420, 80, 30, "gray");
  p6 = new planet(300, 250, 24, "blue");

  sp = new spaceship(p1.xcor, p1.ycor, p1, p5, 5); //CHANGES
  sp1 = new spaceship(p6.xcor, p6.ycor, p0, p3, 5);
  sp2 = new spaceship(p0.xcor, p0.ycor, p0, p1, 5);
  splist[0] = sp;
  splist[1] = sp1;
  splist[2] = sp2;

  plist[0] = p0;
  plist[1] = p1;
  plist[2] = p2;
  plist[3] = p3;
  plist[4] = p4;
  plist[5] = p5;
  plist[6] = p6;
  
  savedTime1 = millis();
  savedTime2 = millis();
  savedTime3 = millis();
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
    x.hoverRingOff();
  }
  clicks = 0;
}

void allOn(){
  for (planet x: plist){
    if (x.planetColor == "blue")
      x.ringOn();
  }
  clicks = 2;
}

void mousePressed(){
  for (planet x: plist){
    if (x.mouseInRadius()){
      if (x.planetColor.equals("blue")){
        if (clicks == 0){
          x.ringOn();
          clicks++;
          ssave = x.num/2;
        }else if (clicks == 1 && x.Ring.on){
          allOn();
          clicks++;
        }else if (clicks == 1 && !x.Ring.on){
          x.ringOn();
          clicks++;
          x.num = x.num - ssave;
        }
      }else if (!(x.planetColor.equals("blue"))){
        if (clicks == 1){
          x.ringOn();
          clicks++;
          x.num = x.num - ssave;
        }
      }
    }
  }
  if (inRadiusAny() == false)
    allOff();
}


void linesave(){
  for (int i = 0; i< plist.length; i++){
    if ((plist[i].Ring.on || plist[i].HoverRing.on)&& xsave1 == 0){
      xsave1 = plist[i].xcor;
      ysave1 = plist[i].ycor;
    }
    else if ((plist[i].Ring.on || plist[i].HoverRing.on) && xsave1 != 0){
      xsave2 = plist[i].xcor;
      ysave2 = plist[i].ycor;
    }
  }
}
// check for mouseX mouseY and see if clicked == true

void draw() {
  background(bg);
  for (planet x: plist){
    if (x.mouseInRadius()){
      if (clicks == 0){
        if (x.planetColor.equals("blue"))
          x.hoverRingOn();
      }
      if (clicks == 1){
        if (x.planetColor.equals("blue")){
          x.hoverRingOn();
        }
        if (!(x.planetColor.equals("blue"))){
          x.hoverRingOn();
          linesave();
          stroke(175,250,250);
          line(xsave1,ysave1,xsave2,ysave2);
          xsave1 = 0; ysave1 = 0; xsave2 = 0; ysave2 = 0;
        }
      }
    }if (!x.mouseInRadius()){
      x.hoverRingOff();
    }
  }
   
  if (clicks == 2){
    linesave();
    stroke(0,180,0);
    line(xsave1, ysave1, xsave2, ysave2);
    xsave1 = 0; ysave1 = 0; xsave2 = 0; ysave2 = 0;
  }
  
  int passedTime1 = millis() - savedTime1;  
  int passedTime2 = millis() - savedTime2;
  int passedTime3 = millis() - savedTime3;
  if (passedTime1 > 500){
    for (planet p: plist){
      if (p.radius == 36)
        p.grow();
    }
    savedTime1 = millis();
  }
  if (passedTime2 > 750){
    for (planet p: plist){
      if (p.radius == 30){
        p.grow();
      }
    }
    savedTime2 = millis();
  }
  if (passedTime3 > 1000){
    for (planet p: plist){
      if (p.radius == 24){
        p.grow();
      }
    }
    savedTime3 = millis();
  }


  for (planet x: plist){
    image(x.getPlanetImage(), x.xcor-x.radius, x.ycor-x.radius);
    x.displayRing();
    text(""+x.num, x.xcor-10, x.ycor+5);
  }
  
  image(cursor, mouseX-16, mouseY-16);
  
  for (spaceship s: splist){
    s.move();
    s.setV();
  }
  
  if (keyPressed) {
    if (key == ' ' || key == 'B') {
      stop();
    }
  }
}


