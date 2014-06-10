class planet{

  String planetColor;
  int radius;  
  int num;
  int xcor, ycor;
  boolean grow;
  
  planet(int x, int y, int r, String c, int n){
    xcor = x;
    ycor = y;
    radius = r;
    planetColor = c;
    num = n;
    if (planetColor.equals("Gray")){
      grow = false;
    }
    else if (planetColor.equals("Red") || planetColor.equals("Blue")){
      grow = true;
    }
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
  
  int distance(int x, int y){
    return (int)(Math.sqrt(Math.pow(x-xcor,2) + Math.pow(y-ycor,2)));
  }
  
  void grow(){
    if (grow == true){
      num++;
    }
  }
}
