//consider changing number button color
class Button {
  // Member variables
  int x, y, w, h;
  color c1, c2, c3, c4;
  String val;
  boolean hover, isNumber;

  // Constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, boolean isNumber, color tempc1, color tempc2) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c1 = tempc1;
    c2 = tempc2;
    //c3 = #00CBBC; #00B1CE
    //c4 = #03A089; #028BA2
    val = tempVal;
    hover = false;
    this.isNumber = isNumber;
  }

  // Display Method
  void display() {
    if (hover) {
      fill (c2);
    } else {
      fill (c1);
    }

  rect (x, y, w, h, 7);

  strokeWeight (4);
  stroke (0, 100);
  line (x+2, y+h-2, x+w-2, y+h-2);
  line (x+w-2, y+h-2, x+w-2, y+2);

  stroke (255, 100);
  line (x+2, y+h-2, x+2, y+2);
  line (x+2, y+2, x+w-2, y+2);

  strokeWeight (1);

  fill (0);
  textAlign (CENTER);
  textSize (14);
  text (val, x+w/2-1, y+h/2+3);
}

// Hover Method
void hover() {
  hover = (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h);
}
}
