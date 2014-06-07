PImage bg, red, blue, gray;
boolean clicked = false;
int redx = 100;
int redy = 200;
int bluex = 500;
int bluey = 200;
int grayx = 250;
int grayy = 200; // VARIABLES INSTEAD OF NUMBER COORDS
ring circle = new ring(redx, redy);
ring circle2 = new ring(grayx, grayy);
ring circle3 = new ring(bluex, bluey);

void setup(){
  size (640,480);
  bg = loadImage("img/background.jpg");
  red = loadImage("img/red2.png");
  blue = loadImage("img/blue2.png");
  gray = loadImage("img/gray2.png");
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
  background(bg);
  image(red, redx, redy);
  image(blue, bluex, bluey);
  image(gray, grayx, grayy);
  text("hi", redx, redy);
  circle.display();
  circle2.display();
  circle3.display();
  if(mousePressed){
    stroke(180,0,0);
    noFill();
    strokeWeight(3);
    ellipse(mouseX, mouseY, 30, 30);
  }
}


