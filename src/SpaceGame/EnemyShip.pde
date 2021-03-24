class EnemyShip {
  // member variables
  int x, y, health, r, speed;
  int savedTime; 
  int totalTime;

  // constructor
  EnemyShip (int x, int y, int t) {
    this.x = x;
    this.y = y;
    health = 100;
    r = 50;
    speed = 5;
    this.totalTime = t;
  }

  // member methods
  void move() {
    x += speed;
    if (x>width || x<0) {
      speed *= -1;
    }
    y += 1;
  }

  // EnemyShip vs Laser Intersection
  boolean laserIntersect(Laser laser) {
    float distance = dist(x, y, laser.x, laser.y); 
    if (distance < r + laser.r) { 
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

  void start() {
    savedTime = millis();
  }

  boolean isFinished() { 
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }


  void display() {
    rectMode (CENTER);

    //engine
    fill (201, 26, 26);
    stroke (183, 15, 15);
    rect (x, y-15, 15, 20);
    stroke (0);
    fill (100);
    rect (x, y-18, 20, 5);
    rect (x, y-35, 20, 20, 3, 3, 10, 10);
    fill (201, 26, 26);
    rect (x, y-36, 20, 4);
    fill (175);
    rect (x, y-44, 3, 11);
    rect (x+8, y-42, 3, 8);
    rect (x-8, y-42, 3, 8);
    fill (175);
    createShape();
    beginShape();
    vertex (x-10, y-10);
    vertex (x-15, y-13);
    vertex (x-15, y-26);
    vertex (x-11, y-30);
    vertex (x-11, y-17);
    vertex (x-7, y-15);
    vertex (x+7, y-15);
    vertex (x+11, y-17);
    vertex (x+11, y-30);
    vertex (x+15, y-26);
    vertex (x+15, y-13);
    vertex (x+10, y-10);
    vertex (x-10, y-10);
    endShape();

    //head
    fill (100);
    quad (x+9, y+10, x+6, y+17, x-6, y+17, x-9, y+10);
    createShape();
    beginShape();
    vertex (x+6, y+17);
    vertex (x+9, y+25);
    vertex (x+3, y+45);
    vertex (x-3, y+45);
    vertex (x-9, y+25);
    vertex (x-6, y+17);
    vertex (x+6, y+17);
    endShape();
    fill (175);
    quad (x, y+45, x-3, y+45, x-5, y+38, x, y+30);
    quad (x, y+45, x+3, y+45, x+5, y+38, x, y+30);
    line (x-5, y+44, x, y+37);
    line (x+5, y+44, x, y+37);

    //body
    fill (100);
    rect (x, y, 20, 25, 7);
    fill (175);
    quad (x+5, y-12, x+5, y+5, x, y+7.5, x, y-12); 
    quad (x-5, y-12, x-5, y+5, x, y+7.5, x, y-12);
    fill (201, 26, 26);
    quad (x+5, y-8, x+5, y-5, x, y, x, y-3);
    quad (x-5, y-8, x-5, y-5, x, y, x, y-3);
    fill (255, 67, 67);
    rect (x+10, y, 4, 10);
    rect (x-10, y, 4, 10);

    //wings
    fill (100);
    quad (x+10, y+8, x+25, y, x+25, y-8, x+10, y-4);
    fill (175);
    quad (x+25, y+8, x+30, y+6, x+30, y-17, x+25, y-19);
    fill (255, 67, 67);
    quad (x+25, y+8, x+30, y+6, x+30, y+3, x+25, y+5);
    fill (100);
    quad (x-10, y+8, x-25, y, x-25, y-8, x-10, y-4);
    fill (175);
    quad (x-25, y+8, x-30, y+6, x-30, y-17, x-25, y-19);
    fill (255, 67, 67);
    quad (x-25, y+8, x-30, y+6, x-30, y+3, x-25, y+5);

    fill (175);
    quad (x-15, y+13, x-20, y+11, x-20, y-6, x-15, y-4);
    fill (255, 67, 67);
    quad (x-15, y+13, x-20, y+11, x-20, y+8, x-15, y+10);
    fill (175);
    quad (x+15, y+13, x+20, y+11, x+20, y-6, x+15, y-4);
    fill (255, 67, 67);
    quad (x+15, y+13, x+20, y+11, x+20, y+8, x+15, y+10);
  }
}
