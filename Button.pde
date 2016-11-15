class Button {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  int t;
  color col;
  color colStroke;
  color textColor;
  
  Button(String labelB, float xpos, float ypos, float widthB, float heightB, color colB, color colStrokeB,color textColorB, int textsize) {
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