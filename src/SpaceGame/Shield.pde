class Shield {
  //member variables
  int x, y, health, bars;

  //constructor
  Shield () {
    x = 0;
    y = 0;
    health = 100;
    bars = 10;
  }

  void display() {
    if (bars >= 10) {
      for (int i=0; i<width; i+=100) {
        fill (#0FA2D6, 200);
        stroke (#4DC6F0, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
    } else if (bars == 9) {
      for (int i=0; i<width-100; i+=100) {
        fill (#0FA2D6, 200);
        stroke (#4DC6F0, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
      for (int i=900; i<width; i+=100) {
        fill (#BFBFBF, 200);
        stroke (#DEDEDE, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
    } else if (bars == 8) {
      for (int i=0; i<width-200; i+=100) {
        fill (#0FA2D6, 200);
        stroke (#4DC6F0, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
      for (int i=800; i<width; i+=100) {
        fill (#BFBFBF, 200);
        stroke (#DEDEDE, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
    } else if (bars == 7) {
      for (int i=0; i<width-300; i+=100) {
        fill (#0FA2D6, 200);
        stroke (#4DC6F0, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
      for (int i=700; i<width; i+=100) {
        fill (#BFBFBF, 200);
        stroke (#DEDEDE, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
    } else if (bars == 6) {
      for (int i=0; i<width-400; i+=100) {
        fill (#0FA2D6, 200);
        stroke (#4DC6F0, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
      for (int i=600; i<width; i+=100) {
        fill (#BFBFBF, 200);
        stroke (#DEDEDE, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
    } else if (bars == 5) {
      for (int i=0; i<width-500; i+=100) {
        fill (#0FA2D6, 200);
        stroke (#4DC6F0, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
      for (int i=500; i<width; i+=100) {
        fill (#BFBFBF, 200);
        stroke (#DEDEDE, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
    } else if (bars == 4) {
      for (int i=0; i<width-600; i+=100) {
        fill (#0FA2D6, 200);
        stroke (#4DC6F0, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
      for (int i=400; i<width; i+=100) {
        fill (#BFBFBF, 200);
        stroke (#DEDEDE, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
    } else if (bars == 3) {
      for (int i=0; i<width-700; i+=100) {
        fill (#0FA2D6, 200);
        stroke (#4DC6F0, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
      for (int i=300; i<width; i+=100) {
        fill (#BFBFBF, 200);
        stroke (#DEDEDE, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
    } else if (bars == 2) {
      for (int i=0; i<width-800; i+=100) {
        fill (#0FA2D6, 200);
        stroke (#4DC6F0, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
      for (int i=200; i<width; i+=100) {
        fill (#BFBFBF, 200);
        stroke (#DEDEDE, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
    } else if (bars == 1) {
      for (int i=0; i<width-900; i+=100) {
        fill (#0FA2D6, 200);
        stroke (#4DC6F0, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
      for (int i=100; i<width; i+=100) {
        fill (#BFBFBF, 200);
        stroke (#DEDEDE, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
    } else if (bars <= 0) {
      for (int i=0; i<width; i+=100) {
        fill (#BFBFBF, 200);
        stroke (#DEDEDE, 200);
        strokeWeight (4);
        rect (x+i, height-122, 100, 20, 7);
      }
    }
    strokeWeight (1);
  }
}
