PImage bg, red1, red2, red3, blue1, blue2, blue3, gray1, gray2, gray3, cursor;
boolean clicked = false;
//RED 
int red1x = 100, int red1y = 100;
int red2x = 100, int red2y = 200;
int red3x = 100, int red3y = 300;
//GRAY
int gray1x = 250, int gray1y = 100;
int gray2x = 250, int gray2y = 200;
int gray3x = 250, int gray3y = 300;
//BLUE
int blue1x = 500, int blue1y = 100;
int blue2x = 500, int blue2y = 200;
int blue3x = 500, int blue3y = 300;


int blueShips = 0;
int savedTime;

ring circle = new ring(redx, redy);
ring circle2 = new ring(grayx, grayy);
ring circle3 = new ring(bluex, bluey);

void setup(){
  noCursor();
  size (640,480);
  bg = loadImage("img/background.jpg");
  red1 = loadImage("img/red1,png");
  red2 = loadImage("img/red2.png");
  red3 = loadImage("img/red3.png");
  gray1 = loadImage("img/gray1,png");
  gray2 = loadImage("img/gray2.png");
  gray3 = loadImage("img/gray3.png");
  blue1 = loadImage("img/blue1,png");
  blue2 = loadImage("img/blue2.png");
  blue3 = loadImage("img/blue3.png");
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
  if (passedTime > 500){
    blueShips++;
    savedTime = millis();
  }
  background(bg);
  image(red2, red1x, red1y);
  image(blue2, blue2x, blue2y);
  image(gray2, gray2x, gray2y);
  text(""+blueShips, red2x+45, red2y+50);
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


