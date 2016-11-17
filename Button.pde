class RectButton {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  int t;
  color col;
  color colStroke;
  color textColor;
  
  RectButton(String labelB, float xpos, float ypos, float widthB, float heightB, color colB, color colStrokeB,color textColorB, int textsize) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    t = textsize;
    col = colB;
    colStroke = colStrokeB;
    textColor = textColorB;
  }
  
  void display() {
    fill(col);
    strokeWeight(2);
    stroke(colStroke);
    rect(x, y, w, h);
    fill(textColor);
    textAlign(CENTER,CENTER);
    textSize(t);
    text(label,x+(w/2),y+(h/2));
  }
  
  boolean IsClicked() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
  
}
class RoundButton {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float r;
  int t;
  color col;
  color colStroke;
  color textColor;
  
  RoundButton(String labelB, float xpos, float ypos, float rad, color colB, color colStrokeB,color textColorB, int textsize) {
    label = labelB;
    x = xpos;
    y = ypos;
    r = rad;
    t = textsize;
    col = colB;
    colStroke = colStrokeB;
    textColor = textColorB;
  }
  
  void display() {
    fill(col);
    strokeWeight(2);
    stroke(colStroke);
    ellipse(x,y,2*r,2*r);
    fill(textColor);
    textAlign(CENTER,CENTER);
    textSize(t);
    text(label,x,y);
  }
  
  boolean IsClicked() {
    if (pow(pow(mouseX-x,2)+pow(mouseY-y,2),0.5) <= r) {
      return true;
    }
    return false;
  }
  
}