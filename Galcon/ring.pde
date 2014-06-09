class ring{ //CLASSES MUST BE .PDE FILES
  int numRings;
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
  
  void mouseClicked(){
  if (numRings>=2){
    rcircle1.setOff();
    rcircle2.setOff();
    rcircle3.setOff();
    gcircle1.setOff();
    gcircle2.setOff();
    gcircle3.setOff();
    bcircle1.setOff();
    bcircle2.setOff();
    bcircle3.setOff();
    numRings = 0;
  }
  if (mouseX<(red1x+72) && mouseX>red1x && mouseY<red1y+72 && mouseY>red1y){
    if (rcircle1.on == false){
      rcircle1.setOn();
      numRings++;
    }else{
      rcircle1.setOff();
      numRings--;
    }
  }
  if (mouseX<(red2x+96) && mouseX>red2x && mouseY<red2y+96 && mouseY>red2y){
    if (rcircle2.on == false){
      rcircle2.setOn();
      numRings++;
    }else{
      rcircle2.setOff();
      numRings--;
    }
  }
  if (mouseX<(red3x+120) && mouseX>red3x && mouseY<red3y+120 && mouseY>red3y){
    if (rcircle3.on == false){
      rcircle3.setOn();
      numRings++;
    }else{
      rcircle3.setOff();
      numRings--;
    }
  }
  if (mouseX<(gray1x+72) && mouseX>gray1x && mouseY<gray1y+72 && mouseY>gray1y){
    if (gcircle1.on == false){
      gcircle1.setOn();
      numRings++;
    }else{
      gcircle1.setOff();
      numRings--;
    }
  }
  if (mouseX<(gray2x+96) && mouseX>gray2x && mouseY<gray2y+96 && mouseY>gray2y){
    if (gcircle2.on == false){
      gcircle2.setOn();
      numRings++;
    }else{
      gcircle2.setOff();
      numRings--;
    }
  }
  if (mouseX<(gray3x+120) && mouseX>gray3x && mouseY<gray3y+120 && mouseY>gray3y){
    if (gcircle3.on == false){
      gcircle3.setOn();
      numRings++;
    }else{
      gcircle3.setOff();
      numRings--;
    }
  }
  if ((mouseX<(blue1x+72) && mouseX>blue1x && mouseY<blue1y+72 && mouseY>blue1y)){
    if (bcircle1.on == false){
      bcircle1.setOn();
      numRings++;
    }else{
      bcircle1.setOff();
      numRings--;
    }
  }
  if ((mouseX<(blue2x+96) && mouseX>blue2x && mouseY<blue2y+96 && mouseY>blue2y)){
    if (bcircle2.on == false){
      bcircle2.setOn();
      numRings++;
    }else{
      bcircle2.setOff();
      numRings--;
    }
  }
  if ((mouseX<(blue3x+120) && mouseX>blue3x && mouseY<blue3y+120 && mouseY>blue3y)){
    if (bcircle3.on == false){
      bcircle3.setOn();
      numRings++;
    }else{
      bcircle3.setOff();
      numRings--;
    }
  }
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


