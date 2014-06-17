class planet{

  PImage planetImage; 
  String planetColor;
  int radius;  
  int num;
  int xcor, ycor;
  boolean grow;
  ring Ring;
  ring HoverRing;
  ArrayList<spaceship> splist = new ArrayList<spaceship>();
  
  planet(int x, int y, int r, String c){
    num = (int)(Math.random() * 30) + 2*r - 45;
    radius = r;
    planetColor = c;
    if (planetColor.equals("gray")){
      grow = false;
    }
    else if (planetColor.equals("red") || planetColor.equals("blue")){
      grow = true;
      num = 100;
    }
    if (r == 36)
      planetImage = loadImage("img/"+getColor()+"1.png");
    if (r == 30)
      planetImage = loadImage("img/"+getColor()+"2.png");
    if (r == 24)
      planetImage = loadImage("img/"+getColor()+"3.png");
    xcor = x + r;
    ycor = y + r;
    Ring = new ring(xcor,ycor,r, false);
    HoverRing = new ring(xcor,ycor,r, true);
//    splist = new spaceship[num];
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
  void hoverRingOn(){
    HoverRing.setOn();
  }
  void ringOn(){
    Ring.setOn();
  }
  void hoverRingOff(){
    HoverRing.setOff();
  }
  void ringOff(){
    Ring.setOff();
  }
  void displayRing(){
    HoverRing.display();
    Ring.display();
  }

  boolean mouseInRadius(){
    return (getDistance(mouseX, mouseY) < radius);
  } 
  
  void grow(){
    if (grow){
      num++;
    }
  }
  
  void decrease(int n){
    num = num - n;
  }
  
  void increase(int n){
    num = num + n;
  }
  
  void changeColor(String c){
    planetColor = c;
    if (radius == 36)
      planetImage = loadImage("img/"+c+"1.png");
    if (radius == 30)
      planetImage = loadImage("img/"+c+"2.png");
    if (radius == 24)
      planetImage = loadImage("img/"+c+"3.png");
  }
  
  ArrayList<spaceship> sendSpaceships(planet t){
    int amt;
    amt = num/2;
    if (num/2<500){
      amt = num/2;
      for (int i=0; i<amt; i+=1){
        sp = new spaceship(xcor, ycor, this, target, 1);
        splist.add(sp);
      }
    }
    if (num/2>= 500){
      amt = 500;
      for (int i=0; i<500; i++){
        sp = new spaceship(xcor, ycor, this, target, 1);
        splist.add(sp);
      }
    }
    /*else if (amt<40){
      for (int i=0; i<amt; i+=2){
        sp = new spaceship (xcor, ycor, this, target, 2);
        splist.add(sp);
      }
      
    }
    else if (amt<60){
      println("hello");
    }*/
    num -= amt;
    return splist;
  }
    
}

