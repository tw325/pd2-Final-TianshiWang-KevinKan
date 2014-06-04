PImage bg, red;


void setup(){
  size (640,480);
  bg = loadImage("background.jpg");
  red = loadImage("red.jpg");
}

void draw() {
  background(bg);
  image(red, 0, 0);
}
