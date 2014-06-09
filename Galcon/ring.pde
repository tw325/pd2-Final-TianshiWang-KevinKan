class ring{ //CLASSES MUST BE .PDE FILES

  int x, y; 
  int diameter; // of ring
  boolean on = false; // useful for later on if Mouseclicked
  
  ring(int xpos, int ypos, int d) {
    x = xpos+ (d/2) ; 
    y = ypos+ (d/2) ;
    diameter = d + 3;
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
      strokeWeight(2); // thickness of ring
      stroke(0, 180, 0); // green color
      ellipse(x, y, diameter, diameter); 
    }
  }
  
  
}


