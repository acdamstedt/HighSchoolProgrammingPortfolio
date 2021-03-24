class Laser {
  // member variables
  int x, y, speed, r, damage, laserMultiplier;
  color c;

  // constructor
  Laser(color c, int x, int y, int laserMultiplier) {
    this.x = x;
    this.y = y;
    this.laserMultiplier = laserMultiplier;
    speed = 6;
    this.c = c;
    r = 3+(laserMultiplier/10);
    damage = 10+laserMultiplier;
  }

  // member methods

  void fire() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y < 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill (c);
    rectMode (CENTER);
    rect (x, y, r+(laserMultiplier/10), r+5+(laserMultiplier/10));
  }
}
