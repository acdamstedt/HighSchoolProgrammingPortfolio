class PowerUp {
  // member variables
  int x, y, r, pu;

  // constructor
  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    pu = int (random (3));
    r = 40;
  }

  // member methods

  void move() {
    y += 6;
  }

  boolean reachedBottom() {
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    switch(pu) {
    case 0: //double
      fill (#E8CB23);
      ellipse (x, y, 40, 40);
      break;
    case 1: //shield
      fill (#92C9ED);
      ellipse (x, y, 40, 40);
      break;
    case 2:
      fill (#ED0C10);
      ellipse (x, y, 40, 40);
      break;
    }
  }
}
