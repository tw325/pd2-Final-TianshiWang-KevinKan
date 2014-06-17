PImage bg, bg2, cursor, logo, pause, play, step1, step2, step3;
boolean clicked;
planet home, target;
planet[] plist;

ArrayList<spaceship> allShips;

boolean menu;
boolean pauseState;
boolean win;
boolean lose;
int clicks;
int savedTime1,savedTime2,savedTime3;
boolean allOn;


void setup(){
  clicked = false;
  plist = new planet[(int)(Math.random()*5)+6];
  allShips = new ArrayList<spaceship>();
  menu = true;
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
  for (int i=2; i<plist.length; i++){
    plist[i]=new planet((int)(Math.random()*400)+80, (int)(Math.random()*240)+80, ((int)(3*Math.random())+4)*6, "gray");
  }
  plist[0] = new planet((int)(Math.random()*20)+20, (int)(Math.random()*20)+20, 36, "blue");
  plist[1] = new planet((int)(Math.random()*20)+540, (int)(Math.random()*20)+380, 36, "red");
  
  for(int i =2; i<plist.length; i++){
    for(int j=i+1; j<plist.length; j++){
      while (plist[i].getDistance(plist[j].xcor, plist[j].ycor)<72){
        plist[i] = new planet((int)(Math.random()*400)+80, (int)(Math.random()*240)+80, (((int)(3*Math.random())+4)*6), "gray");
        println("loading");
      }
    }
  }
  
  
  savedTime1 = millis();
  savedTime2 = millis();
  savedTime3 = millis();
}

boolean inRadiusAny(){
  for (planet x: plist){
    if (x.getDistance(mouseX, mouseY) < x.radius)
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
  if (menu && mouseX< 420 && mouseX > 220 && mouseY < 450 && mouseY > 370){
    menu = false;
  }
  if (!menu && !win && mouseX< 30 && mouseX > 0 && mouseY < 30 && mouseY> 0){
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
    if (inRadiusAny() == false)
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

void draw() {
  if (menu){
    background(bg2);
    image(logo, 0, 0);
    textSize(12);
    fill(210, 255, 255);
    image(step1, 90, 260);
    text ("1: Select Your Planet", 91, 272);
    image(step2, 230, 260);
    text ("2: Select Your Target", 231, 272);
    image(step3, 401, 260);
    text ("3: Conquer the Galaxy", 402, 272);
    button("Start", 220, 370, 200, 80, 30);
  }
  if (pauseState){
    background(bg);
    image(play, 0, 0);
    textSize(50);
    fill(0);
    stroke(210,255,255);
    text("GAME PAUSED", 150, 250);
    if (keyPressed && key == ' ')
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
  else if (!menu && !pauseState && !win){
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

    /*int lim = 1;
    for (planet p: plist){
      if (p.num <= lim){
        for (planet r: plist){
          if (r.getColor().equals("red") && Math.random()<0.2){
            addShipsToList(r.sendSpaceships(p));
            lim = 1;
          }
        }
      }
      lim++;
    }*/
    
    
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
        menu = true;
      if (key == ' ') 
        pauseState = true;
    }

  }

  image(cursor, mouseX-16, mouseY-16);
}


