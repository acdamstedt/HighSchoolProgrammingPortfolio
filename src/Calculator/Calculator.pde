/*
2020 Calculator for Programming 1
Annika Damstedt | Nov 2020
*/

//global values
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
String dVal;
String op;
float r =0.0;
float l = 0.0;
float result = 0.0;
boolean left;
boolean noNum;

//declare variables and declare buttons
void setup() {
  size (420, 560);
  dVal = "0";
  op = "";
  left = true;
  r = 0.0;
  l = 0.0;
  result = 0.0;

  numButtons[0] = new Button(100, 160, 60, 60, "0", true, #00CBBC, #03A089);
  numButtons[1] = new Button(20, 240, 60, 60, "1", true, #00CBBC, #03A089);
  numButtons[2] = new Button(100, 240, 60, 60, "2", true, #00CBBC, #03A089);
  numButtons[3] = new Button(180, 240, 60, 60, "3", true, #00CBBC, #03A089);
  numButtons[4] = new Button(20, 320, 60, 60, "4", true, #00CBBC, #03A089);
  numButtons[5] = new Button(100, 320, 60, 60, "5", true, #00CBBC, #03A089);
  numButtons[6] = new Button(180, 320, 60, 60, "6", true, #00CBBC, #03A089);
  numButtons[7] = new Button(20, 400, 60, 60, "7", true, #00CBBC, #03A089);
  numButtons[8] = new Button(100, 400, 60, 60, "8", true,#00CBBC, #03A089);
  numButtons[9] = new Button(180, 400, 60, 60, "9", true, #00CBBC, #03A089);

  opButtons[0] = new Button(20, 160, 60, 60, "+/-", false, #00B1CE, #028BA2);
  opButtons[1] = new Button(180, 160, 60, 60, "x²", false, #00B1CE, #028BA2);
  opButtons[2] = new Button(260, 160, 60, 60, "√", false, #00B1CE, #028BA2);
  opButtons[3] = new Button(340, 160, 60, 60, "+", false, #00B1CE, #028BA2);
  opButtons[4] = new Button(260, 240, 60, 60, "sin", false, #00B1CE, #028BA2);
  opButtons[5] = new Button(340, 240, 60, 60, "-", false, #00B1CE, #028BA2);
  opButtons[6] = new Button(260, 320, 60, 60, "cos", false, #00B1CE, #028BA2);
  opButtons[7] = new Button(340, 320, 60, 60, "x", false, #00B1CE, #028BA2);
  opButtons[8] = new Button(260, 400, 60, 60, "Rand", false, #00B1CE, #028BA2);
  opButtons[9] = new Button(340, 400, 60, 60, "/", false, #00B1CE, #028BA2);
  opButtons[10] = new Button(20, 480, 140, 60, "C", false, #86C8D3, #77B4BF);
  opButtons[11] = new Button(260, 480, 140, 60, "=", false, #86C8D3, #77B4BF);
  opButtons[12] = new Button (180, 480, 60, 60, ".", false, #00B1CE, #028BA2);
}

//call updateDisplay and buttons
void draw() {
  background (0);

  updateDisplay();

  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover();
  }
}

//create display and shrink text based on amount
void updateDisplay() {
  rectMode (CORNER);
  fill (#C5E3E8);
  rect (20, 20, 380, 120, 10);

  //shading
  strokeWeight (4);
  stroke (0, 100);
  line (22, 138, 398, 138);
  line (398, 138, 398, 22);
  stroke (255, 100);
  line (22, 138, 22, 22);
  line (22, 22, 398, 22);

  textAlign (RIGHT);
  fill (0);

  if (dVal.length()<13) {
    textSize(38);
  } else if (dVal.length()<17) {
    textSize(34);
  } else if (dVal.length()<18) {
    textSize(32);
  } else if (dVal.length()<20) {
    textSize(30);
  } else if (dVal.length()<22) {
    textSize(28);
  } else if (dVal.length()<25) {
    textSize(26);
  } else if (dVal.length()<27) {
    textSize(24);
  } else if (dVal.length()<30) {
    textSize(22);
  } else {
    textSize(20);
  }
  text (dVal, width-30, 120);
}

//determine which buttons pressed
void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hover && dVal.length()<20) {
      handleEvent (numButtons[i].val, true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent (opButtons[i].val, false);
    }
  }
}

//determine which keys clicked
void keyPressed() {
  if (key == '0') {
    handleEvent ("0", true);
  } else if (key == '1') {
    handleEvent ("1", true);
  } else if (key == '2') {
    handleEvent ("2", true);
  } else if (key == '3') {
    handleEvent ("3", true);
  } else if (key == '4') {
    handleEvent ("4", true);
  } else if (key == '5') {
    handleEvent ("5", true);
  } else if (key == '6') {
    handleEvent ("6", true);
  } else if (key == '7') {
    handleEvent ("7", true);
  } else if (key == '8') {
    handleEvent ("8", true);
  } else if (key == '9') {
    handleEvent ("9", true);
  } else if (key == '+') {
    handleEvent ("+", false);
  } else if (key == '-') {
    handleEvent ("-", false);
  } else if (key == '*') {
    handleEvent ("x", false);
  } else if (key == '/') {
    handleEvent ("/", false);
  } else if (key == '.') {
    handleEvent (".", false);
  } else if (key == 27 || key == 'C' || key == 'c') {
    handleEvent ("C", false);
  } else if (key == 10) {
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent ("=", false);
    }
  }
}

//show result of buttons clicked or pressed
String handleEvent (String val, boolean num) {
  if (left && num && !noNum) {
    if (dVal.equals("0") || result == l) {
      dVal = (val);
      l = float (dVal);
    } else {
      dVal += (val);
      l = float (dVal);
    }
  } else if (!left && num && !noNum) {
    if (dVal.equals("0") || dVal.equals(op) || result == l) {
      dVal = (val);
      r = float (dVal);
    } else {
      dVal += (val);
      r = float (dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0";
    result = 0.0;
    left = true;
    r = 0.0;
    l = 0.0;
    op = "";
    noNum = false;
  } else if (val.equals("+")) {
      op = "+";
      left = false;
      dVal = "+";
      noNum = false;
  } else if (val.equals("-")) {
      op = "-";
      left = false;
      dVal = "-";
      noNum = false;
  } else if (val.equals("x")) {
      op = "x";
      left = false;
      dVal = "x";
      noNum = false;
  } else if (val.equals("/")) {
      op = "/";
      left = false;
      dVal = "/";
      noNum = false;
  } else if (val.equals("Rand")) {
    if (left) {
      l = random (0, 1);
      dVal = str(l);
      noNum = true;
    } else {
      r = random (0, 1);
      dVal = str(r);
      noNum = true;
    }
  } else if (val.equals("+/-")) {
    if (left) {
      l *= -1;
      dVal = str(l);
    } else {
      r *= -1;
      dVal = str(r);
    }
  } else if (val.equals("x²")) {
    if (left) {
      l = sq(l);
      dVal = str(l);
      noNum = true;
    } else {
      r = sq(r);
      dVal = str(r);
      noNum = true;
    }
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
      noNum = true;
    } else {
      r = sqrt(r);
      dVal = str(r);
      noNum = true;
    }
  } else if (val.equals("sin")) {
    if (left) {
      l = sin(radians(l));
      dVal = str(l);
      noNum = true;
    } else {
      r = sin(radians(r));
      dVal = str(r);
      noNum = true;
    }
  } else if (val.equals("cos")) {
    if (left) {
      l = cos(radians(l));
      dVal = str(l);
      noNum = true;
    } else {
      r = cos(radians(r));
      dVal = str(r);
      noNum = true;
    }
  } else if (val.equals(".") && !dVal.contains(".")) {
    dVal += (val);
  } else if (val.equals("=")) {
    performCalc();
    op = "";
  }
  return val;
}

//perform operator calculations
void performCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("x")) {
    result = l * r;
  } else if (op.equals("/")) {
    result = l / r;
  }
  l = result;
  r = 0;
  dVal = str(result);
  left = true;
}
