class SpaceShip {
  // member variables
  int x, y, health, lives, r;
  float easing;

  // constructor
  SpaceShip() {
    x = 0;
    y = 0;
    health = 100;
    lives = 3;
    easing = 0.05;
    r = 25;
  }

  // Rock vs Ship Collision
  boolean asteroidIntersection(Asteroid asteroid) {
    float distance = dist (x, y, asteroid.x, asteroid.y);
    if (distance < r + asteroid.r) {
      return true;
    } else {
      return false;
    }
  }

  // PowerUp vs Ship Collision
  boolean puIntersect(PowerUp pu) {
    float distance = dist(x, y, pu.x, pu.y); 
    if (distance < r + pu.r) { 
      return true;
    } else {
      return false;
    }
  }

  // EnemyShip vs Ship Collision
  boolean shipIntersect(EnemyShip eShip) {
    float distance = dist(x, y, eShip.x, eShip.y); 
    if (distance < r + eShip.r) { 
      return true;
    } else {
      return false;
    }
  }

  // EnemyLaser vs Ship Collision
  boolean enemyLaserIntersect(EnemyLaser eLaser) {
    float distance = dist(x, y, eLaser.x, eLaser.y); 
    if (distance < r + eLaser.r) { 
      return true;
    } else {
      return false;
    }
  }

  // member methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;

    rectMode (CENTER);

    //engine
    fill (240, 208, 102);
    stroke (240, 208, 102);
    rect (x, y+15, 15, 20);
    stroke (0);
    fill (100);
    rect (x, y+18, 20, 5);
    rect (x, y+35, 20, 20, 3, 3, 10, 10);
    fill (240, 208, 102);
    rect (x, y+36, 20, 4);
    fill (175);
    rect (x, y+44, 3, 11);
    rect (x+8, y+42, 3, 8);
    rect (x-8, y+42, 3, 8);

    //head
    fill (100);
    quad (x+9, y-10, x+6, y-17, x-6, y-17, x-9, y-10);
    createShape();
    beginShape();
    vertex (x+6, y-17);
    vertex (x+9, y-25);
    vertex (x+3, y-45);
    vertex (x-3, y-45);
    vertex (x-9, y-25);
    vertex (x-6, y-17);
    vertex (x+6, y-17);
    endShape();
    fill (175);
    quad (x, y-45, x-3, y-45, x-5, y-38, x, y-30);
    quad (x, y-45, x+3, y-45, x+5, y-38, x, y-30);
    line (x-5, y-44, x, y-37);
    line (x+5, y-44, x, y-37);
    rect (x, y-20, 3, 7);

    //body
    fill (100);
    rect (x, y, 20, 25, 7);
    fill (175);
    rect (x, y, 10, 15, 7);
    fill (89, 120, 157);
    rect (x+10, y, 4, 10);
    rect (x-10, y, 4, 10);

    //wings
    fill (100);
    quad (x+10, y-8, x+25, y, x+25, y+8, x+10, y+8);
    fill (175);
    ellipse (x+30, y+5, 8, 29);
    fill (100);
    rect (x+30, y+5, 10, 15, 3);
    quad (x-10, y-8, x-25, y, x-25, y+8, x-10, y+8);
    fill (175);
    ellipse (x-30, y+5, 8, 29);
    fill (100);
    rect (x-30, y+5, 10, 15, 3);
  }
}
