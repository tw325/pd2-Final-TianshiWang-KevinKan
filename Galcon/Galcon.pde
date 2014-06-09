PImage bg, red1, red2, red3, blue1, blue2, blue3, gray1, gray2, gray3, cursor;
boolean clicked = false;
//RED 
int red1x = 100; int red1y = 100;
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


int red1Ships = 15, red2Ships = 25, red3Ships = 35;
int gray1Ships = 15, gray2Ships = 25, gray3Ships = 35;
int blue1Ships = 15, blue2Ships = 25, blue3Ships = 35;
int saved1Time, saved2Time, saved3Time;
int numRings;

ring rcircle1 = new ring(red1x, red1y, 72);
ring rcircle2 = new ring(red2x, red2y, 96);
ring rcircle3 = new ring(red3x, red3y, 120);
ring gcircle1 = new ring(gray1x, gray1y, 72);
ring gcircle2 = new ring(gray2x, gray2y, 96);
ring gcircle3 = new ring(gray3x, gray3y, 120);
ring bcircle1 = new ring(blue1x, blue1y, 72);
ring bcircle2 = new ring(blue2x, blue2y, 96);
ring bcircle3 = new ring(blue3x, blue3y, 120);

void setup(){
  noCursor();
  size (640,480);
  bg = loadImage("img/background.jpg");
  red1 = loadImage("img/red1.png");
  red2 = loadImage("img/red2.png");
  red3 = loadImage("img/red3.png");
  gray1 = loadImage("img/gray1.png");
  gray2 = loadImage("img/gray2.png");
  gray3 = loadImage("img/gray3.png");
  blue1 = loadImage("img/blue1.png");
  blue2 = loadImage("img/blue2.png");
  blue3 = loadImage("img/blue3.png");
  cursor = loadImage("img/cursor.png");
  saved1Time = millis();
  saved2Time = millis();
  saved3Time = millis();
}


void draw() {
  int passed1Time = millis() - saved1Time;
  if (passed1Time > 1000){
    blue1Ships++;
    red1Ships++;
    if (Math.random() > .5)
      gray1Ships++;
    saved1Time = millis();
  }
  int passed2Time = millis() - saved2Time;
  if (passed2Time > 800){
    blue2Ships++;
    red2Ships++;
    if (Math.random() > .5)
      gray2Ships++;
    saved2Time = millis();
  }
  int passed3Time = millis() - saved3Time;
  if (passed3Time > 500){
    blue3Ships++;
    red3Ships++;
    if (Math.random() > .5)
      gray3Ships++;
    saved3Time = millis();
  }
  background(bg);
  image(red1, red1x, red1y);
  image(gray1, gray1x, gray1y);
  image(blue1, blue1x, blue1y);

  image(red2, red2x, red2y);
  image(gray2, gray2x, gray2y);
  image(blue2, blue2x, blue2y);

  image(red3, red3x, red3y);
  image(gray3, gray3x, gray3y);
  image(blue3, blue3x, blue3y);

  text(""+red1Ships, red1x+36, red1y+36);
  text(""+red2Ships, red2x+48, red2y+48);
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
  bcircle3.display();
  image(cursor, mouseX-16, mouseY-16);
  if(mousePressed){
    stroke(180,0,0);
    noFill();
    strokeWeight(3);
    ellipse(mouseX, mouseY, 30, 30);
  }
}


