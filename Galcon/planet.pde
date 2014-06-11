class planet{

  PImage planetImage; 
  String planetColor;
  int radius;  
  int num;
  int xcor, ycor;
  boolean grow;
  ring Ring;
  
  planet(int x, int y, int r, String c, int n){
    radius = r;
    planetColor = c;
    num = n;
    if (planetColor.equals("gray")){
      grow = false;
    }
    else if (planetColor.equals("red") || planetColor.equals("blue")){
      grow = true;
    }
    if (r == 36)
      planetImage = loadImage("img/"+getColor()+"1.png");
    if (r == 30)
      planetImage = loadImage("img/"+getColor()+"2.png");
    if (r == 24)
      planetImage = loadImage("img/"+getColor()+"3.png");
    xcor = x + r;
    ycor = y + r;
    Ring = new ring(xcor,ycor,r);
  }
  
  String getColor(){
    return planetColor;
  }
  
  int getRadius(){
    return radius;
  }
  
  int getNum(){
    return num;
  }
  
  int getX(){ 
    return xcor;
  }
  
  int getY(){
    return ycor;
  }
  
  int getDistance(int x, int y){
    return (int)(Math.sqrt(Math.pow(x-xcor,2) + Math.pow(y-ycor,2)));
  }
  
  PImage getPlanetImage(){
    return planetImage;
  }

  void ringOn(){
    Ring.setOn();
  }
  void ringOff(){
    Ring.setOff();
  }
  void displayRing(){
//    Ring.setOn();
    Ring.display();
  }

  boolean mouseInRadius(){
    return (getDistance(mouseX, mouseY) < radius);
  } 
  
  void grow(){
    if (grow == true){
      num++;
    }
  }
}
