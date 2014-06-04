PImage bg, red, blue;


void setup(){
  size (640,480);
  bg = loadImage("background.jpg");
  red = loadImage("red.png");
  blue = loadImage("blue.png");
}

void draw() {
  background(bg);
  image(red, 0, 0);
  image(blue, 70, 70);
}
