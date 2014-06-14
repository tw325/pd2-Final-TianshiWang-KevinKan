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
      spaceshipImage = loadImage("img/BlueSpaceship.png");
    if (shipcolor.equals("red"))
      spaceshipImage = loadImage("img/RedSpaceship.png");
  }
  
  int getX(){
    return xcor;
  }

  int getY(){
    return ycor;
  }
  
  float getAngle(){
    float x1 = home.getX();
    float y1 = home.getY();
    float x2 = target.getX();
    float y2 = target.getY();
    float angle = atan((y2-y1)/(x2-x1));
    println(angle);
    return angle;
  }

  String getColor(){
    return shipcolor;
  }

//~5 ships = 1 image
//max 20 images
//so sending over 100 ships will still create 20 images
//# ships sent less than 100 will be divided by 5 and rounded up (+1). 

  
  int getQuantity(){
    return quantity;
  }
    
  PImage getSpaceshipImage(){
    return spaceshipImage;
  }
  
  void setOn(){
    on = true;
  }
  
  void frame(){
    translate(getX(), getY());
    rotate(getAngle()+PI/2);
    image(getSpaceshipImage(), 0, 0); //displays spaceship
    text(""+getQuantity(), 0, 0);
    resetMatrix();
  }

}
