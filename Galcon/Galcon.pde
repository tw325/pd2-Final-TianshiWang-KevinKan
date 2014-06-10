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

/*ring rcircle1 = new ring(p0.getX(), p0.getY(), p0.getRadius());
ring rcircle2 = new ring(red2x, red2y, 96);
ring rcircle3 = new ring(red3x, red3y, 120);
ring gcircle1 = new ring(gray1x, gray1y, 72);
ring gcircle2 = new ring(gray2x, gray2y, 96);
ring gcircle3 = new ring(gray3x, gray3y, 120);
ring bcircle1 = new ring(blue1x, blue1y, 72);
ring bcircle2 = new ring(blue2x, blue2y, 96);
ring bcircle3 = new ring(blue3x, blue3y, 120);*/

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
  /*if (numRings>=2){
    rcircle1.setOff();
    rcircle2.setOff();
    rcircle3.setOff();
    gcircle1.setOff();
    gcircle2.setOff();
    gcircle3.setOff();
    bcircle1.setOff();
    bcircle2.setOff();
    bcircle3.setOff();
    numRings = 0;
  }
  if (p0.getDistance(mouseX, mouseY)<p0.getRadius()){
    if (rcircle1.on == false){
      rcircle1.setOn();
      numRings++;
    }else{
      rcircle1.setOff();
      numRings--;
    }
  }
  if (mouseX<(red2x+96) && mouseX>red2x && mouseY<red2y+96 && mouseY>red2y){
    if (rcircle2.on == false){
      rcircle2.setOn();
      numRings++;
    }else{
      rcircle2.setOff();
      numRings--;
    }
  }
  if (mouseX<(red3x+120) && mouseX>red3x && mouseY<red3y+120 && mouseY>red3y){
    if (rcircle3.on == false){
      rcircle3.setOn();
      numRings++;
    }else{
      rcircle3.setOff();
      numRings--;
    }
  }
  if (mouseX<(gray1x+72) && mouseX>gray1x && mouseY<gray1y+72 && mouseY>gray1y){
    if (gcircle1.on == false){
      gcircle1.setOn();
      numRings++;
    }else{
      gcircle1.setOff();
      numRings--;
    }
  }
  if (mouseX<(gray2x+96) && mouseX>gray2x && mouseY<gray2y+96 && mouseY>gray2y){
    if (gcircle2.on == false){
      gcircle2.setOn();
      numRings++;
    }else{
      gcircle2.setOff();
      numRings--;
    }
  }
  if (mouseX<(gray3x+120) && mouseX>gray3x && mouseY<gray3y+120 && mouseY>gray3y){
    if (gcircle3.on == false){
      gcircle3.setOn();
      numRings++;
    }else{
      gcircle3.setOff();
      numRings--;
    }
  }
  if ((mouseX<(blue1x+72) && mouseX>blue1x && mouseY<blue1y+72 && mouseY>blue1y)){
    if (bcircle1.on == false){
      bcircle1.setOn();
      numRings++;
    }else{
      bcircle1.setOff();
      numRings--;
    }
  }
  if ((mouseX<(blue2x+96) && mouseX>blue2x && mouseY<blue2y+96 && mouseY>blue2y)){
    if (bcircle2.on == false){
      bcircle2.setOn();
      numRings++;
    }else{
      bcircle2.setOff();
      numRings--;
    }
  }
  if ((mouseX<(blue3x+120) && mouseX>blue3x && mouseY<blue3y+120 && mouseY>blue3y)){
    if (bcircle3.on == false){
      bcircle3.setOn();
      numRings++;
    }else{
      bcircle3.setOff();
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
  /*image(p2.getPlanetImage(), p2.getX(), p2.getY());
  image(p3.getPlanetImage(), p3.getX(), p3.getY());  
  image(p4.getPlanetImage(), p4.getX(), p4.getY());  
  image(p5.getPlanetImage(), p5.getX(), p5.getY());*/

  text(""+p0.getNum(), p0.getX(), p0.getY());
  /*text(""+red2Ships, red2x+48, red2y+48);
  text(""+red3Ships, red3x+60, red3y+60);
  text(""+gray1Ships, gray1x+36, gray1y+36);
  text(""+gray2Ships, gray2x+48, gray2y+48);
  text(""+gray3Ships, gray3x+60, gray3y+60);
  text(""+blue1Ships, blue1x+36, blue1y+36);
  text(""+blue2Ships, blue2x+48, blue2y+48);
  text(""+blue3Ships, blue3x+60, blue3y+60);
  rcircle1.display();
  rcircle2.display();
  rcircle3.display();
  gcircle1.display();
  gcircle2.display();
  gcircle3.display();
  bcircle1.display();
  bcircle2.display();
  bcircle3.display();*/
  image(cursor, mouseX-16, mouseY-16);
  if(mousePressed){
    stroke(180,0,0);
    noFill();
    strokeWeight(3);
    ellipse(mouseX, mouseY, 30, 30);
  }
}


