//Kannst du versuchen deine Anderungen zu Kommentieren (Kommentar wird mit " // " eingeleitet oder beginnt mit " /* " und endet mit " */ ")



Player p;
boolean mousemovement = true; // Ändert Steuerung
Button start;
Button shop;

boolean inGame;
boolean inMainMenu;
boolean inShop;

ArrayList<MovingSphere> MainMenuBackgroundShperes;

void setup(){
  inMainMenu = true;
  fullScreen();
  orientation(LANDSCAPE); // Einstellung damit das Spiel auf dem Handy im Querformat angezeigt werden kann
  p = new Player(width/2,height/2); // Spieler startet in der mitte des Bildschirms
  rectMode(CORNER);
  //drawinGameBackground(); // Zeichnet den Hintergrund vor damit dieser in das pixels[]-Array geladen werden kann
  loadPixels(); // lädt den Bildschirm in das pixels[]-Array
  start = new Button("Start",width*3/8,height/5,width/4,height/5, color(0),color(255),color(255),140);
  shop = new Button("Shop",width*3/8,height*3/5,width/4,height/5, color(0),color(255),color(255),140);
}

void draw(){
  if(inGame){
    if (mousemovement){mousemovement();} // verwendet Maussteuerung wenn mousemovement == true
    drawinGameBackground();
    p.update();
    p.display();
  }
  if(inMainMenu){
    drawMainMenu();
  }
  if(inShop){
    
  }
  println(frameRate);
} //<>//

void keyPressed(){
  buttonmovement(true,key,keyCode);
  if (key ==' ' ){
    MainMenuBackgroundShperes = null;
  }
}
  
void keyReleased(){
  buttonmovement(false,key,keyCode);
}

void drawMainMenu(){
  drawMainMenuBackground();
  start.display();
  shop.display();
}