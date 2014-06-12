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

}
