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
<<<<<<< HEAD
//~5 ships = 1 image
//max 20 images
//so sending over 100 ships will still create 20 images
//# ships sent less than 100 will be divided by 5 and rounded up (+1). 
=======
  
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
>>>>>>> c280b615b9ac21fd6a94b93800d0b8d556784525

}
