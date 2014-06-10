class ring{

  int x, y; 
  int radius; 
  boolean on = false; // useful for later on if Mouseclicked

  ring(int xcor, int ycor, int r) {
    x = xcor; 
    y = ycor;
    radius = r;
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
      stroke(0, 180, 0); // green color
      ellipse(x, y, radius*2, radius*2); 
    }
  }
  
  
}


