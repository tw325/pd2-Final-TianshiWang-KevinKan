class spaceship{
  PImage spaceshipImage; 
  int xcor, ycor;
  int dx = 2; 
  int dy = 2;
  planet home;
  planet target;
  String shipcolor;
  int quantity;
  int direction = 0; //angle
  boolean on = false;
  
  spaceship(int x, int y, planet h, planet t, int q){
    xcor = x;
    ycor = y;
    home = h;
    target = t;
    quantity = q;
    shipcolor = h.getColor();
    if (shipcolor.equals("blue"))
      spaceshipImage = loadImage("BlueSpaceship.png");
    if (shipcolor.equals("red"))
      spaceshipImage = loadImage("RedSpaceship.png");
  }
  
  int getX(){
    return xcor;
  }

  int getY(){
    return ycor;
  }

  String getColor(){
    return shipcolor;
  }
  
  int getQuantity(){
    return quantity;
  }
    
  PImage getSpaceshipImage(){
    return spaceshipImage;
  }
  
  void setOn(){
    on = true;
  }
  
  void display() {
    if (on == true) {
      
    }
  }

}
