//Kannst du versuchen deine Anderungen zu Kommentieren (Kommentar wird mit " // " eingeleitet oder beginnt mit " /* " und endet mit " */ ")



Player p;
boolean mousemovement = true; // Ändert Steuerung
Button start;
Button shop;
Button options;
Button skins;
Button shapes;
Button diffEasy;  //diffEasy = Schwierigkeit einfach
Button diffMedium;
Button diffHard;

boolean inGame;
boolean inMainMenu;
boolean inShop;
boolean inOptions;

ArrayList<MovingSphere> MainMenuBackgroundShperes;

void setup(){
  inMainMenu = true;
  fullScreen();
  orientation(LANDSCAPE); // Einstellung damit das Spiel auf dem Handy im Querformat angezeigt werden kann
  p = new Player(width/2,height/2); // Spieler startet in der mitte des Bildschirms
  rectMode(CORNER);
  //drawinGameBackground(); // Zeichnet den Hintergrund vor damit dieser in das pixels[]-Array geladen werden kann
  loadPixels(); // lädt den Bildschirm in das pixels[]-Array
  start = new Button("Start",width/4,height/10,width/2,height*2/10, color(102,255,178),color(255),color(255),140);
  shop = new Button("Shop",width/4,height*4/10,width/2,height*2/10, color(255,178,102),color(255),color(255),140);
  options = new Button("Options",width/4,height*7/10,width/2,height*2/10, color(255,102,102),color(255),color(255),140);
  skins = new Button("Skins",width/8,height*3/8,width/4,height/4, color(0), color(255),color(255),100);
  shapes = new Button("Shapes",width*5/8,height*3/8,width*1/4,height*1/4, color(0), color(255),color(255),100);
  diffEasy = new Button("Easy",width*3/8,height*5/20,width/4,height*2/10,color(0), color(255),color(255),100);
  diffMedium = new Button("Medium",width*3/8,height*10/20,width/4,height*2/10,color(0), color(255),color(255),95);
  diffHard = new Button("Hard",width*3/8,height*15/20,width/4,height*2/10,color(0), color(255),color(255),100);
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
    drawShop();
  }
  if(inOptions){
    drawOptions();
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
  options.display();
}

void drawShop(){
   drawMainMenuBackground();
   skins.display();
   shapes.display();
}

void drawOptions(){
   drawMainMenuBackground();
   fill(0);
   rect(width*5/16,height/15,width*6/16,height/10);
   fill(255);
   text("Difficulty", width/2, height/10);
   diffEasy.display();
   diffMedium.display();
   diffHard.display();
}