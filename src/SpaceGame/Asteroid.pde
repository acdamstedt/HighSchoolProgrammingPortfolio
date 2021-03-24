class Asteroid {
  // member variables
  int x, y, health, r;

  // constructor
  Asteroid(int x, int y) {
    this.x = x;
    this.y = y;
    health = int (random (30, 50));
    r = 25;
  }

  // member methods

  // Laser vs Rock Intersection
  boolean laserIntersection(Laser l) {
    float distance = dist (x, y, l.x, l.y);
    if (distance < r + l.r) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y > height + 50) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    y+=5;
  }

  void display() {
    fill (72, 64, 54);
    noStroke();
    ellipse (x, y, health, health);
    ellipse (x+3, y+3, health, health);
    ellipse (x-4, y, health, health);
    ellipse (x, y-4, health, health);
  }
}
