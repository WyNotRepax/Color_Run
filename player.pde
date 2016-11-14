class Player{
  boolean moveup, movedown, moveright, moveleft;
  int xcoord, ycoord;
  int xspeed, yspeed;
  
  int maxhealth;
  int currenthealth;
  boolean isgettinghit;
  
  int radius;
  
  color col;
  int colnum;
  color col1 = color(204,153,0), col2 = color(153,0,0), col3 = color(51,102,0), col4 = color(0,51,102);
  
  int timefromchange;
  int changedelay; // delay zwischen Farbwechseln
  
  Player(int x, int y){
    xcoord = x;
    ycoord = y;
    xspeed = 8;//Pixel pro Frame
    yspeed = 8;
    radius = 50;
    maxhealth = 600; // ~10sekunden bis man stirbt, auf dem Handy mehr( -1 Leben pro Frame)
    currenthealth = maxhealth;
    timefromchange = 0;
    changedelay = 7*int(frameRate); //Farbwechsel alle 7 Sekunden
    colnum = 1; //Anfangsfarbe Nr.1
  }
  
  void update(){
  if (moveup == true){
      if (ycoord > 0){
      ycoord -= yspeed;
      }
    } if (movedown == true){
      if (ycoord < height){
      ycoord += yspeed;
      }
    } if (moveright == true){
      if (xcoord < width){
      xcoord += xspeed;
      }
    } if (moveleft == true){
      if (xcoord > 0){
      xcoord -= xspeed;
      }
    }
    if (timefromchange > changedelay){
      colnum = round(random(1,4)); //<>//
      changedelay = 7*int(frameRate);// Delay an Framerate Anpassen
      timefromchange = 0;
    }
    this.hitdetection();
    timefromchange++;
  }
  
  void display(){
    if (colnum == 1){
      col = col1;
    }
    else if (colnum == 2){
      col = col2;
    }
    else if(colnum == 3){
      col = col3;
    }
    else if(colnum == 4){
      col = col4;
    }
    stroke(255-red(col),255-green(col),255-blue(col)); // Bestimmt Komplementärfarbe zur Farbe des Spielers
    strokeWeight(3);
    fill(col);
    ellipse(xcoord,ycoord,radius,radius);
    noStroke();
    fill(0); // Zeichnet Lebensanzeige in der Ecke des Bildschirms
    rect(10,10,500,70);
    fill(255,0,0);
    rect(20,20,map(currenthealth,0,maxhealth,20,480),50);
  }
  
  void hitdetection(){
    if(pixels[xcoord+(ycoord*width)] == col){ // Testet ob der Pixel an der Position des Spielers die selbe Farbe hat wie der Spieler
      isgettinghit = false;
    }
    else{
      isgettinghit = true;
    }
    if(isgettinghit){
      currenthealth--;
    }
    else{
      if(currenthealth < maxhealth){
        currenthealth++; // Leben nur Erhöhen wenn das Leben nicht schon Voll ist
      }
    }
  }
}