class EnemyLaser {
  int x, y, speed, r, damage; 
  color c;

  EnemyLaser(int x, int y) {
    r = 4; 
    damage = 10;
    this.x = x; 
    this.y = y; 
    speed = 4;    
    c = color (255, 0, 0);
  }

  void fire() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(c);
    noStroke();
    rect(x, y, r, 8);
  }
}
