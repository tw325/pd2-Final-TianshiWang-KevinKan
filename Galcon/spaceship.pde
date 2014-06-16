class spaceship{
  PImage spaceshipImage; 
  float xcor, ycor;
  float dx; 
  float dy;
  final float dHyp = 1;
  planet home;
  planet target;
  String shipcolor;
  int quantity;
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
    on = true;
  }
  
  
  float getAngle(){
    float x1 = xcor;
    float y1 = ycor;
    float x2 = target.getX();
    float y2 = target.getY();
    float angle = atan((y2-y1)/(x2-x1));
    if (x2>=x1 && y2 < y1)
      angle += 3*PI/2;
    else if (x2 < x1 && y2>=y1)
      angle += PI/2;
    else if (x2 < x1 && y2 < y1)
      angle += PI;
    return angle;
  }

  String getColor(){
    return shipcolor;
  }

  void setV(){
    float x1 = xcor;
    float y1 = ycor;
    float x2 = target.getX();
    float y2 = target.getY();
    dx = (dHyp * cos(getAngle()));
    dy = (dHyp * sin(getAngle()));
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

  void move(){
    if (on){
      translate(xcor, ycor);
      rotate(getAngle()+PI/2);
      image(getSpaceshipImage(), 0, 0); //displays spaceship
      text(""+getQuantity(), 0, 0);
      resetMatrix();
      xcor+=dx;
      ycor+=dy;
      if (target.getDistance((int)xcor, (int)ycor)<target.radius){ //CAUSES LOSS OF PLANET NUMBER
        if (shipcolor.equals(target.planetColor)){
          target.increase(quantity);
        }
        else{
          target.decrease(quantity);
          if (target.num <0){
            target.changeColor(shipcolor);
            target.num *= -1;
          }
        }
        on = false;
      }
    }
  }
  
  void draw(){
    setV();
    move();
  }
}
