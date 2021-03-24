class LevelText {
  // member variables
  int levelNum, y;

  // constructor
  LevelText(int levelNum) {
    this.levelNum = levelNum;
    y = 0;
  }

  // member methods
  
  boolean reachedBottom() {
    if (y > height+75) {
      return true;
    } else {
      return false;
    }
  }
  
  void move() {
    y+=5;
  }

  void display() {
    textAlign (CENTER);
    textSize(50);
    stroke(255,255,255,125);
    String s = "YOU HAVE REACHED LEVEL " + levelNum + "!";
    text(s, width/2, y);
  }
}
