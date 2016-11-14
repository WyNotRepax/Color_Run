void drawinGameBackground(){
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

void drawMainMenuBackground(){
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
  if( MainMenuBackgroundShperes == null){
    MainMenuBackgroundShperes = new ArrayList<MovingSphere>();
    int temp = int(random(1,10));
    int r = int(min(height,width)/(3*temp));
    for ( int i = 0; i < temp; i++){
      MainMenuBackgroundShperes.add(new MovingSphere(int(random(2*r,width-2*r)),int(random(2*r,height-2*r)),r,int(random(1,10))));
    }
  }
  for(MovingSphere s : MainMenuBackgroundShperes){
    s.update();
    s.display();
  }
}

class MovingSphere{ // Bewegte Kugel im Hintergrund
  PVector pos; //PositionalsVector
  PVector direc; //Bewegungsrichtung als Vector
  float radius;
  color col; //Farbe des Balles
  
  
  MovingSphere(int startPosX, int startPosY, int r, int s){ // Construktor mit Position als Int ohne Richtung ohne Farbe
    pos = new PVector(startPosX,startPosY);
    direc = new PVector(random(-100,100),random(-100,100));
    direc.normalize();
    direc.x = direc.x * s;
    direc.y = direc.y * s;
    radius = r;
    col = color(random(255),random(255),random(255));
  }
  
  void update(){
    if(pos.x-radius <= 0 || pos.x+radius >= width){
      direc.x = -direc.x;
    }
    if(pos.y-radius <= 0 || pos.y+radius >= height){
      direc.y = -direc.y;
    }
    pos.x = pos.x +direc.x;
  }
  
  void display(){
    noStroke();
    fill(col);
    ellipse(pos.x,pos.y,radius*2,radius*2);
  }
}