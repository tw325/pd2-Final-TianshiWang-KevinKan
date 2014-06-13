class spaceship{
  int xcor, ycor;
  planet home;
  planet target;
  color shipcolor;
  int direction = 0; //angle
  
  spaceship(int x, int y, planet p, planet h, color c){
    xcor = x;
    ycor = y;
    home = h;
    target = p;
    shipcolor = c;
  }
  
  int getX(){
    return xcor;
  }

  int getY(){
    return ycor;
  }

  color getColor(){
    return shipcolor;
  }
//~5 ships = 1 image
//max 20 images
//so sending over 100 ships will still create 20 images
//# ships sent less than 100 will be divided by 5 and rounded up (+1). 

}
