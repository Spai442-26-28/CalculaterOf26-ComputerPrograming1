class Button {
  float x, y, w, h;
  color c1;
  String val;
  Button(float x, float y, char val) {
    this.x = x;
    this.y = y;
    w = 30;
    h = 30;
    c1 = color(60);
    this.val = str(val);
  }
  Button(float x, float y, String val) {
    this.x = x;
    this.y = y;
    w = 30;
    h = 30;
    c1 = color(100, 100, 200); // becasse
    this.val = val;
  }
  boolean contains(float mx, float my) {
    return (mx >= x && mx <= x + w && my >= y && my <= y + h);
  }
  void display() {
    fill(c1);
    rect(x, y, w, h);
    fill(255);
    text(val, x + (val.length() > 1 ? 5 : 10), y + 20);
  }
}
class Dis {
  float x, y, w, h;
  color c1;
  String textVal;
  Dis(float x, float y, String textVal) {
    this.x = x;
    this.y = y;
    w = 90;
    h = 30;
    c1 = color(40);
    this.textVal = textVal;
  }
  void display() {
    fill(c1);
    rect(x, y, w, h);
    fill(255);
    text(textVal, x + 10, y + 20);
  }
}
