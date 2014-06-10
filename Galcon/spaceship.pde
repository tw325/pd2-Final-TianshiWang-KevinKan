class spaceship{
  int xcor, ycor;
  planet target;
  color shipcolor;
  int direction = 0; //angle
  
  spaceship(int x, int y, planet p, color c){
    xcor = x;
    ycor = y;
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
