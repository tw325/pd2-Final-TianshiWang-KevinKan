import java.io.*;
import java.util.*;

PImage bg, bg2, cursor, logo, pause, play, step1, step2, step3, step4;
boolean clicked;
planet home, target;
ArrayList<planet> plist;

ArrayList<spaceship> allShips;

Random r = new Random();
boolean instructions;
boolean start;
boolean pauseState;
boolean win;
boolean lose;
int clicks;
int savedTime1,savedTime2,savedTime3, savedTime4;
boolean allOn;


void setup(){
  clicked = false;
  plist = new ArrayList<planet>();
  allShips = new ArrayList<spaceship>();
  start = true;
  instructions = false;
  pauseState = false;
  win = false;
  lose = false;
  clicks = 0;
  noCursor();
  size (640,480);
  bg = loadImage("img/background.jpg");
  bg2 = loadImage("img/background2.png");
  cursor = loadImage("img/cursor.png");
  logo = loadImage("img/logo.png");
  pause = loadImage("img/pause.png");
  play = loadImage("img/play.png");
  step1 = loadImage("img/step1.png");
  step2 = loadImage("img/step2.png");
  step3 = loadImage("img/step3.png");
  step4 = loadImage("img/step4.png");

  plist.add(new planet((int)(Math.random()*20)+20, (int)(Math.random()*20)+20, 36, "blue"));
  plist.add(new planet((int)(Math.random()*20)+540, (int)(Math.random()*20)+380, 36, "red"));

  for (int i = 1; i <= r.nextInt(4) + 8; i++){
    int x = r.nextInt(500) + 40;
    int y = r.nextInt(320) + 40;
    while (inRadiusAny(x+36,y+36) == true){
      x = r.nextInt(500) + 40;
      y = r.nextInt(320) + 40;
    }
    plist.add(new planet(x, y, (r.nextInt(3)) * 6 + 24, "gray"));
  }
  
  savedTime1 = millis();
  savedTime2 = millis();
  savedTime3 = millis();
  savedTime4 = millis();
}

boolean inRadiusAny(int xcor, int ycor){
  for (planet x: plist){
    if (x.getDistance(xcor, ycor) < 80)
      return true;
  }
  return false;
}

void allOff(){
  for (planet x: plist){
    x.ringOff();
    x.hoverRingOff();
    home = null;
    target = null;
  }
  clicks = 0;
  allOn = false;
}

void allOn(){
  for (planet x: plist){
    if (x.planetColor == "blue")
      x.ringOn();
  }
  clicks = 2;
  allOn = true;
}

void addShipsToList(ArrayList<spaceship> temp){
  for (spaceship s: temp){
    allShips.add(s);
  }
}

void mousePressed(){
  if (instructions){
    instructions = false;
    start = false;
  }
  if (start && mouseX< 420 && mouseX > 220 && mouseY < 450 && mouseY > 370){
    start = false;
    instructions = true;
  }
  if (pauseState){
    pauseState = !pauseState;
  }
  if (!start && !win && mouseX< 30 && mouseX > 0 && mouseY < 30 && mouseY> 0){
    pauseState = !pauseState;
  }
    
  if ((win || lose) && mouseX < 470 && mouseX> 170 && mouseY < 290 && mouseY > 190){
    setup();
  }
  else{
    for (planet x: plist){
      if (x.mouseInRadius()){
        if (x.planetColor.equals("blue")){
          if (clicks == 0){
            x.ringOn();
            clicks++;
            home = x;
          }else if (clicks == 1 && x.Ring.on){
            allOn();
          }else if (clicks == 1 && !x.Ring.on){
            target = x;
            addShipsToList(home.sendSpaceships(target));
            clicks++;
            allOff();
          }else if (clicks == 2 && allOn){
            target = x;
            for (planet b: plist){
              if (b.compareTo(target) != 0){
                if (b.getColor().equals("blue")){
                  addShipsToList(b.sendSpaceships(target));
                }
              }
            }
            allOff();
          }
        }else if (!(x.planetColor.equals("blue"))){
          if (clicks == 1){
            target = x;
            addShipsToList(home.sendSpaceships(target));
            clicks++;
            allOff();
          }else if (clicks ==2 && allOn){
            target = x;
            for (planet b: plist){
              if (b.getColor().equals("blue")){
                addShipsToList(b.sendSpaceships(target));
              }
            }
            allOff();
          }
        }
      }
    }
    if (inRadiusAny(mouseX, mouseY) == false)
      allOff();
  }
}


void button(String text, int xcor, int ycor, int w, int h, int size){
  fill(210,255,255, 80);
  strokeWeight(4);
  rect(xcor, ycor, w, h, 7);
  textSize(size);
  if (mouseX< xcor+w && mouseX > xcor && mouseY < ycor+h && mouseY > ycor){
    fill(210,255,255);
    stroke(210,255,255);
  }
  else{
    fill(0);
    stroke(0);
  }
  text(text, (w-text.length()*size * .5)/2 + xcor , ((h+size)/2 + ycor));
}

boolean checkWin(){
  for (planet x: plist){
    if (x.planetColor == "red"){
      return false;
    }
  }
  return true;
}
boolean checkLose(){
  for (planet x: plist){
    if (x.planetColor == "blue"){
      return false;
    }
  }
  return true;
}

planet numFinderR(int n){
  for (planet x: plist){
    if (x.num == n && x.planetColor == "red"){
      return x;
    }
  }
  return null;
}
planet numFinderBG(int n){
  for (planet x: plist){
    if (x.num == n && (x.planetColor == "blue" || x.planetColor == "gray")){
      return x;
    }
  }
  return null;
}
planet biggestRed(){
  int n = 0;
  for (planet x: plist){
    if (x.planetColor == "red"){
      if (x.num > n)
        n = x.num;
    }
  }
  return numFinderR(n);
}
planet smallestRed(){
  int n = 9999;
  for (planet x: plist){
    if (x.planetColor == "red"){
      if (x.num < n)
        n = x.num;
    }
  }
  return numFinderR(n);
}

planet weakest(){
  int n = 9999;
  for (planet x: plist){
    if (x.planetColor == "blue" || x.planetColor == "gray"){
      if (x.num < n)
        n = x.num;
    }
  }
  return numFinderBG(n);
}

planet strongest(){
  int n = 0;
  for (planet x: plist){
    if (x.planetColor == "blue" || x.planetColor == "gray"){
      if (x.num > n)
        n = x.num;
    }
  }
  return numFinderBG(n);
}

void draw() {
  if (start){
    background(bg2);
    image(logo, 0, 0);
    textSize(12);
    fill(210, 255, 255);
    button("Start", 220, 370, 200, 80, 30);
  }
  if(instructions){
    background(bg2);
    image(logo, 0, 0);
    textSize(12);
    fill(210, 255, 255);
    text ("1: YOU ARE BLUE", 50, 300);
    image(step1, 50, 350);
    text ("2: Select Your Planet", 51, 345);
    image(step2, 180, 350);
    text ("3: Select Your Target", 181, 345);
    image(step3, 351, 350);
    text ("4: Double Click", 345, 333);
    text ("to Select All Planets", 345, 345); //two lines
    image(step4, 468, 350);
    text ("5: Click to Send Ships", 469, 345);
    text ("6: CONQUER RED!", 469, 300);
    textSize(50);
    stroke(210,255,255);
    textSize(20);
    text("(CLICK TO START)", 220, 300);
    if (keyPressed && key == ' ')
      instructions = false;
  }
  if (pauseState){
    background(bg2);
    image(logo, 0, 0);
    textSize(12);
    fill(210, 255, 255);
    text ("1: YOU ARE BLUE", 50, 300);
    image(step1, 50, 350);
    text ("2: Select Your Planet", 51, 345);
    image(step2, 180, 350);
    text ("3: Select Your Target", 181, 345);
    image(step3, 351, 350);
    text ("4: Double Click", 345, 333);
    text ("to Select All Planets", 345, 345); //two lines
    image(step4, 468, 350);
    text ("5: Click to Send Ships", 469, 345);
    text ("6: CONQUER RED!", 469, 300);
    textSize(50);
    stroke(210,255,255);
    text("GAME PAUSED", 150, 240);
    textSize(20);
    text("(CLICK TO RESUME)", 220, 300);
    if (keyPressed && key == 'm')
      pauseState = false;
  }
  if (win){
    background(bg);
    textSize(40);
    fill(210, 255, 255);
    text(" YOU WIN " , 225, 125); 
    button("Play Again?", 170, 190, 300, 100, 35);
  }
  if (lose){
    background(bg);
    textSize(40);
    fill(210, 255, 255);
    text(" YOU LOSE " , 225, 125); 
    button("Play Again?", 170, 190, 300, 100, 35);
  }  
  else if (!start && !pauseState && !instructions && !win){
    background(bg);
    lose = checkLose();
    win = checkWin();
    image(pause, 0, 0);
    for (planet x: plist){
      if (x.mouseInRadius()){
        if (clicks == 0){
          if (x.planetColor.equals("blue"))
            x.hoverRingOn();
            home = x;
        }
        if (clicks == 1){
          x.hoverRingOn();
          target = x;
          stroke(175,250,250);
          line(home.xcor, home.ycor, target.xcor, target.ycor);
        }        
        if (clicks == 2 && allOn){
          target = x;
          for (planet b: plist){
            if (b.planetColor.equals("blue")){
              stroke(175,250,250);
              line(b.xcor, b.ycor, target.xcor, target.ycor);
            }
          }
          x.hoverRingOn();
        }
      }if (!x.mouseInRadius()){
         x.hoverRingOff();
      }
    }
   // AI HERE
    if ((millis() - savedTime4) > (r.nextInt(500) + 2000)){
      planet t0 = biggestRed();
      planet t1 = weakest();
      planet t2 = strongest();
      planet t3 = smallestRed();
      double n = Math.random();
      if (n > .6)
        addShipsToList(t0.sendSpaceships(t1));
      else if (n <= .6 && n > .2)
        addShipsToList(t0.sendSpaceships(t2));
      else if (n <= .2 && !t0.equals(t3))
        addShipsToList(t0.sendSpaceships(t3));
      else
        addShipsToList(t0.sendSpaceships(t2));
      savedTime4 = millis();
    }
    
    int passedTime1 = millis() - savedTime1;  
    int passedTime2 = millis() - savedTime2;
    int passedTime3 = millis() - savedTime3;
    if (passedTime1 > 500){
      for (planet p: plist){
        if (p.radius == 36)
          p.grow();
      }
      savedTime1 = millis();
    }
    if (passedTime2 > 750){
      for (planet p: plist){
        if (p.radius == 30){
          p.grow();
        }
      }
      savedTime2 = millis();
    }
    if (passedTime3 > 1000){
      for (planet p: plist){
        if (p.radius == 24){
          p.grow();
        }
      }
      savedTime3 = millis();
    }
  
  
    for (planet x: plist){
      image(x.getPlanetImage(), x.xcor-x.radius, x.ycor-x.radius);
      x.displayRing();
      textSize(12);
      fill(0);
      text(""+x.num, x.xcor-10, x.ycor+5);
    }
      
    for (int i=0; i<allShips.size(); i++){
      if ( allShips.get(i) != null){
        spaceship s = allShips.get(i);
        if (s.on){
          s.setV();
          s.move();
        }
        else
          if (allShips.size()>1){
            allShips.remove(i);
          }
          else{
            allShips.set(0, null);
          }
      }
    }

    if (keyPressed) {
      if (key == 'm') 
        instructions = true;
      if (key == ' ') 
        pauseState = true;
    }

  }

  image(cursor, mouseX-16, mouseY-16);
}


