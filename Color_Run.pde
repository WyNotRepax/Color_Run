//Kannst du versuchen deine Anderungen zu Kommentieren (Kommentar wird mit " // " eingeleitet oder beginnt mit " /* " und endet mit " */ ")

Player p;
boolean mousemovement = true;
void setup(){
  fullScreen();
  orientation(LANDSCAPE); // Einstellung damit das Spiel auf dem Handy im Querformat angezeigt werden kann
  p = new Player(width/2,height/2); // Spieler startet in der mitte des Bildschirms
  rectMode(CORNER);
  drawBackground(); // Zeichnet den Hintergrund vor damit dieser in das pixels[]-Array geladen werden kann
  loadPixels(); // lädt den Bildschirm in das pixels[]-Array
}

void draw(){
  if (mousemovement){mousemovement();} // verwendet Maussteuerung wenn mousemovement == true
  drawBackground();
  p.update();
  p.display();
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      p.moveup = true;
    } else if (keyCode == DOWN){
      p.movedown = true;
    } else if (keyCode == RIGHT){
      p.moveright = true;
    } else if (keyCode == LEFT){
      p.moveleft = true;
    }
  }
}
  
void keyReleased(){
  if (key == CODED){
    if (keyCode == UP){
      p.moveup = false;
    } else if (keyCode == DOWN){
      p.movedown = false;
    } else if (keyCode == RIGHT){
      p.moveright = false;
    } else if (keyCode == LEFT){
      p.moveleft = false;
    }
  }
}


void drawBackground(){
  noStroke();
  background(255);
  fill(204,153,0);
  rect(0,0,width/4,height);
  fill(153,0,0);
  rect(width/4,0,width/4,height);
  fill(51,102,0);
  rect(width*2/4,0,width/4,height);
  fill(0,51,102);
  rect(width*3/4,0,width/4,height);
}
void mousemovement(){ // bewegt Spieler immer in Richtung der Maus, außer er ist bereits näher als 10 pixel dran
  if(mousePressed){
    if (Math.abs(mouseX-p.xcoord) < 10){
      p.moveleft = false;
      p.moveright = false;
    }
    else if(mouseX > p.xcoord){
      p.moveright = true;
      p.moveleft = false;
    }
    else if(mouseX < p.xcoord){
      p.moveleft = true;
      p.moveright = false;
    }
    if (Math.abs(mouseY-p.ycoord) < 10){
      p.moveup = false;
      p.movedown = false;
    }
    else if(mouseY > p.ycoord){
      p.movedown = true;
      p.moveup = false;
    }
    else if(mouseY < p.ycoord){
      p.moveup = true;
      p.movedown = false;
    }
  }
  else{
    p.moveleft = false;
    p.moveright = false;
    p.moveup = false;
    p.movedown = false;
  }
}