// stephen p. wallace | sep 14th, 2026 | calculator
Button[] numButtons;
Button[] opButtons;
Button copilotBtn;
Dis dis;
String displayVal = "0.0";
boolean left = true;
float l = 0;
float r = 0;
char op = ' ';
void setup() {
  size(170, 200);
 
  // num buttons
  numButtons = new Button[11];
  numButtons[0] = new Button(20, 170, '0');
  numButtons[1] = new Button(20, 50, '1');
  numButtons[2] = new Button(60, 50, '2');
  numButtons[3] = new Button(100, 50, '3');
  numButtons[4] = new Button(20, 90, '4');
  numButtons[5] = new Button(60, 90, '5');
  numButtons[6] = new Button(100, 90, '6');
  numButtons[7] = new Button(20, 130, '7');
  numButtons[8] = new Button(60, 130, '8');
  numButtons[9] = new Button(100, 130, '9');
  numButtons[10] = new Button(60, 170, 'C');
  // op buttoons
  opButtons = new Button[5];
  opButtons[0] = new Button(140, 50, '+');
  opButtons[1] = new Button(140, 90, '-');
  opButtons[2] = new Button(140, 130, 'x');
  opButtons[3] = new Button(140, 170, '%');
  opButtons[4] = new Button(100, 170, '=');
  // everyones favrate
  copilotBtn = new Button(20, 10, "AI");
  dis = new Dis(60, 10, "0.0");
}
void draw() {
  background(255);
 
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].display();
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].display();
  }
  copilotBtn.display();
 
  dis.textVal = displayVal;
  dis.display();
}
void mouseReleased() {
  // check for the ai link
  if (copilotBtn.contains(mouseX, mouseY)) {
    String[] aiJokes = {"SYNTAX ERR", "buy M365","buy calc +","needs email"};
    displayVal = aiJokes[int(random(aiJokes.length))];
    return;
  }
  // check num and C
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].contains(mouseX, mouseY)) {
      // fixed via redoing string
      String clickedVal = numButtons[i].val;
     
      if (clickedVal.equals("C")) {
        displayVal = "0.0";
        left = true;
        l = 0;
        r = 0;
        op = ' ';
      } else {
        if (displayVal.equals("0.0") || displayVal.length() > 8 || displayVal.equals("+") || displayVal.equals("-") || displayVal.equals("x") || displayVal.equals("%") || displayVal.equals("SYNTAX ERR") || displayVal.equals("BUY M365")) {
          displayVal = clickedVal;
        } else {
          displayVal = displayVal + clickedVal;
        }
       
        if (left == true) {
          l = float(displayVal);
        } else {
          r = float(displayVal);
        }
      }
    }
  }
 
  // check op buttons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].contains(mouseX, mouseY)) {
      op = opButtons[i].val.charAt(0);
     
      if (op == '=') {
        float result = 0;
        if (op == '+') result = l + r;
        else if (op == '-') result = l - r;
        else if (op == 'x') result = l * r;
        else if (op == '%') result = l / r;
       
        displayVal = str(result);
        l = result;
        left = true;
      } else {
        displayVal = str(op);
        left = false;
      }
    }
  }
}
