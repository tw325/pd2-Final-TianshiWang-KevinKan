PImage bg, red, blue, gray, cursor;
boolean clicked = false;
int redx = 100;
int redy = 200;
int bluex = 500;
int bluey = 200;
int grayx = 250;
int grayy = 200; // VARIABLES INSTEAD OF NUMBER COORDS

int blueShips = 0;
int savedTime;

ring circle = new ring(redx, redy);
ring circle2 = new ring(grayx, grayy);
ring circle3 = new ring(bluex, bluey);

void setup(){
  noCursor();
  size (640,480);
  bg = loadImage("img/background.jpg");
  red = loadImage("img/red2.png");
  blue = loadImage("img/blue2.png");
  gray = loadImage("img/gray2.png");
  cursor = loadImage("img/cursor.png");
  savedTime = millis();
}

void mouseClicked(){
  if (mouseX<200){
    circle.setOn();
  }
  if (mouseX<400 && mouseX>200){
    circle2.setOn();
  }
  if (mouseX>400){
    circle3.setOn();
  }
}


void draw() {
  int passedTime = millis() - savedTime;
  if (passedTime > 1000){
    blueShips++;
    savedTime = millis();
  }
  background(bg);
  image(red, redx, redy);
  image(blue, bluex, bluey);
  image(gray, grayx, grayy);
  text(""+blueShips, redx+45, redy+50);
  circle.display();
  circle2.display();
  circle3.display();
  image(cursor, mouseX-16, mouseY-16);
  if(mousePressed){
    stroke(180,0,0);
    noFill();
    strokeWeight(3);
    ellipse(mouseX, mouseY, 30, 30);
  }
}


