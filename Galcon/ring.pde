class ring{

  int x, y; 
  int radius; 
  boolean hover;
  boolean on = false; // useful for later on if Mouseclicked

  ring(int xcor, int ycor, int r, boolean h) {
    x = xcor; 
    y = ycor;
    radius = r;
    hover = h;
  }
  
  void setOn(){
    on = true;
  }
  
  void setOff(){
    on = false;
  }
  
  void display() {
    if (on == true) {
      ellipseMode(CENTER); // sets xcor and ycor to center
      noFill(); // ring with no fill
      strokeWeight(3); // thickness of ring
      if (!hover){
        stroke(0, 180, 0); // green color
      }else{
        stroke(175,250,250);
      }
      ellipse(x, y, radius*2, radius*2); 
    }
  }
}


