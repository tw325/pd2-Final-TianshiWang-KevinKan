class planet{

  color planetColor;
  int diameter;  
  int num = 10;
  int xcor, ycor;
  
  planet(int x, int y, int t, int sp){
    if (/*default*/true){
      numSpaceship = (int)(Math.random()*100 +20);
    }
  }
  
  color getColor(){
    return planetColor;
  }
  
  int getDiameter(){
    return diameter;
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
  
  
  boolean distance(int x, int y){
    int radius = diameter/2;
    return (int)(Math.sqrt(x*x + y*y))<=radius;
  }
}
