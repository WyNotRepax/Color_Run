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

void buttonmovement(boolean pressed,int keyP, int keyCodeP){
  if (keyP == CODED){
    if (keyCodeP == UP){
      p.moveup = pressed;
    } else if (keyCodeP == DOWN){
      p.movedown = pressed;
    } else if (keyCodeP == RIGHT){
      p.moveright = pressed;
    } else if (keyCodeP == LEFT){
      p.moveleft = pressed;
    }
  }
}