package processing.test.color_run;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Color_Run extends PApplet {

//Kannst du versuchen deine Anderungen zu Kommentieren (Kommentar wird mit " // " eingeleitet oder beginnt mit " /* " und endet mit " */ ")

Player p;
boolean mousemovement = true;
public void setup(){
  
  orientation(LANDSCAPE); // Einstellung damit das Spiel auf dem Handy im Querformat angezeigt werden kann
  p = new Player(width/2,height/2); // Spieler startet in der mitte des Bildschirms
  rectMode(CORNER);
  drawBackground(); // Zeichnet den Hintergrund vor damit dieser in das pixels[]-Array geladen werden kann
  loadPixels(); // l\u00e4dt den Bildschirm in das pixels[]-Array
}

public void draw(){
  if (mousemovement){mousemovement();} // verwendet Maussteuerung wenn mousemovement == true
  drawBackground();
  p.update();
  p.display();
}

public void keyPressed(){
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
  
public void keyReleased(){
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


public void drawBackground(){
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
public void mousemovement(){ // bewegt Spieler immer in Richtung der Maus, au\u00dfer er ist bereits n\u00e4her als 10 pixel dran
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
class Player{
  boolean moveup, movedown, moveright, moveleft;
  int xcoord, ycoord;
  int xspeed, yspeed;
  
  int maxhealth;
  int currenthealth;
  boolean isgettinghit;
  
  int radius;
  
  int col;
  int colnum;
  int col1 = color(204,153,0), col2 = color(153,0,0), col3 = color(51,102,0), col4 = color(0,51,102);
  
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
    changedelay = 7*PApplet.parseInt(frameRate); //Farbwechsel alle 7 Sekunden
    colnum = 1; //Anfangsfarbe Nr.1
  }
  
  public void update(){
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
      colnum = round(random(1,4));
      changedelay = 7*PApplet.parseInt(frameRate);// Delay an Framerate Anpassen
      timefromchange = 0;
    }
    this.hitdetection();
    timefromchange++;
  }
  
  public void display(){
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
    stroke(255-red(col),255-green(col),255-blue(col)); // Bestimmt Komplement\u00e4rfarbe zur Farbe des Spielers
    strokeWeight(3);
    fill(col);
    ellipse(xcoord,ycoord,radius,radius);
    noStroke();
    fill(0); // Zeichnet Lebensanzeige in der Ecke des Bildschirms
    rect(10,10,500,70);
    fill(255,0,0);
    rect(20,20,map(currenthealth,0,maxhealth,20,480),50);
  }
  
  public void hitdetection(){
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
        currenthealth++; // Leben nur Erh\u00f6hen wenn das Leben nicht schon Voll ist
      }
    }
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Color_Run" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
