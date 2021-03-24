// SpaceGame December 2020
// by Annika Damstedt

import processing.sound.*;
SoundFile laser_sound;
SoundFile powerup_sound;
SoundFile pass_sound;
SoundFile damage_sound;
SoundFile edamage_sound;
SoundFile rockdestroy_sound;
SoundFile life_sound;
SoundFile gameover_sound;

SpaceShip s1;
Shield shield;
ArrayList<Laser> lasers;
ArrayList<Asteroid> asteroids;
ArrayList<Star> stars;
ArrayList<EnemyShip> eShips;
ArrayList<EnemyLaser> eLasers;
ArrayList<PowerUp> pUps;
ArrayList<LevelText> levelText;
Timer rockTimer, enemyTimer, puTimer;
int score, pass, level, rockRate, enemyRate, puRate, laserMultiplier;
boolean play, newLevel;

void setup() {
  size (1000, 800);

  laser_sound = new SoundFile (this, "laser_sound.wav");
  powerup_sound = new SoundFile (this, "powerup_sound.wav");
  pass_sound = new SoundFile (this, "pass_sound.wav");
  damage_sound = new SoundFile (this, "damage_sound2.wav");
  edamage_sound = new SoundFile (this, "damage_sound.wav");
  rockdestroy_sound = new SoundFile (this, "rockdestroy_sound.wav");
  life_sound = new SoundFile (this, "life_sound.wav");
  gameover_sound = new SoundFile (this, "gameover_sound.wav");

  s1 = new SpaceShip();
  shield = new Shield();
  lasers = new ArrayList();
  asteroids = new ArrayList();
  stars = new ArrayList();
  eShips = new ArrayList();
  pUps = new ArrayList();
  eLasers = new ArrayList();
  levelText = new ArrayList();

  rockRate = 1500;
  enemyRate = 5000;
  puRate = 7000;

  pass = 0;
  score = 0;
  level = 1;
  play = false;
  laserMultiplier = 1;
  newLevel = true;

  rockTimer = new Timer(rockRate);
  rockTimer.start();
  enemyTimer = new Timer(enemyRate);
  enemyTimer.start();
  puTimer = new Timer(puRate);
  puTimer.start();
}

void draw() {
  noCursor();

  if (!play) {
    startScreen();
    //start star field
    stars.add(new Star(int(random(width)), -50, color(random(190, 255))));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }
  } else {

    background (0);

    //Display LevelText
    for (int i=0; i<levelText.size(); i++) {
      LevelText lt = levelText.get(i);
      lt.display();
      lt.move();
      if (lt.reachedBottom()) {
        levelText.remove(lt);
      }
    }

    if (s1.health<0) {
      s1.lives--;
      life_sound.play();
      s1.health = 100;
    }

    //continue star field
    stars.add(new Star(int(random(width)), -50, color(random(190, 255))));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    //enemy timer done
    if (enemyTimer.isFinished()) {
      eShips.add (new EnemyShip(0, -50, 500));
      enemyTimer.start();
    }

    for (int i = 0; i<eShips.size(); i++) {
      EnemyShip eShip = eShips.get(i);
      eShip.move();
      eShip.display();
      // enemy and ship intersection
      if (s1.shipIntersect(eShip)) {
        s1.health-=50;
        damage_sound.play();
        eShips.remove(eShip);
      }
      if (eShip.reachedBottom()) {
        eShips.remove(eShip);
        pass++;
        pass_sound.play();
        shield.bars--;
      }
      if (eShip.isFinished()) {
        eLasers.add(new EnemyLaser(eShip.x+30, eShip.y-10));
        eLasers.add(new EnemyLaser(eShip.x-30, eShip.y-10));
        laser_sound.play();
        eShip.start();
      }
    }

    for (int i = eLasers.size()-1; i>=0; i--) {
      EnemyLaser eLaser = (EnemyLaser) eLasers.get(i);
      eLaser.fire();
      eLaser.display();
      // Enemy Laser vs. Ship
      if (s1.enemyLaserIntersect(eLaser)) {
        s1.health-=eLaser.damage;
        damage_sound.play();
        eLasers.remove(eLaser);
      }
      if (eLaser.reachedBottom()) {
        eLasers.remove(eLaser);
      }
    }

    //powerup timer done
    if (puTimer.isFinished()) {
      pUps.add(new PowerUp(int (random(width)), -50));
      puTimer.start();
    }

    //create powerups and powers
    for (int i = 0; i < pUps.size(); i++) {
      PowerUp pUp = pUps.get(i);
      pUp.display();
      pUp.move();
      // PowerUp and ship intersection
      if (s1.puIntersect(pUp)) {
        // Apply PowerUp Effects
        powerup_sound.play();
        if (pUp.pu == 0) { // double damage
          laserMultiplier += 10;
        } else if (pUp.pu == 1) { //add shield
          shield.bars++;
          pass--;
        } else if (pUp.pu == 2) { //add health
          s1.health += 50;
        }
        pUps.remove(pUp);
      }
      if (pUp.reachedBottom()) {
        pUps.remove(pUp);
      }
    }

    if (rockTimer.isFinished()) {
      asteroids.add(new Asteroid(int(random(width)), -50));
      rockTimer.start();
    }

    for (int i = 0; i < asteroids.size(); i++) {
      Asteroid asteroid = asteroids.get(i);
      asteroid.display();
      asteroid.move();
      // Asteroid vs Ship Collision
      if (s1.asteroidIntersection(asteroid)) {
        s1.health -= asteroid.health;
        damage_sound.play();
        asteroids.remove(asteroid);
        rockdestroy_sound.play();
      }
      if (asteroid.reachedBottom()) {
        asteroids.remove(asteroid);
        pass++;
        pass_sound.play();
        shield.bars--;
      }
    }

    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      laser.display();
      laser.fire();
      // Laser vs Rock Intersection
      for (int j = 0; j < asteroids.size(); j++) { 
        Asteroid asteroid = asteroids.get(j);
        if (asteroid.laserIntersection(laser)) {
          asteroid.health -= laser.damage;
          edamage_sound.play();
          if (asteroid.health <= 10) {
            asteroids.remove(asteroid);
            rockdestroy_sound.play();
            score += 25;
            checkScore (25);
          }
          lasers.remove(laser);
        }
      }
      // ememy ship and laser intersection
      for (int k = 0; k<eShips.size(); k++) {
        EnemyShip eShip = eShips.get(k);
        if (eShip.laserIntersect(laser)) {
          lasers.remove(laser);
          eShip.health-=laser.damage;
          edamage_sound.play();
          if (eShip.health<1) {
            score+=50;
            checkScore (50);
            eShips.remove(eShip);
          }
        }
      }
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }
    s1.display(mouseX, mouseY);
    infoPanel();
    shield.display();

    if (s1.health<1 && s1.lives==0 || pass>=10) {
      play = false;
      gameOver();
      gameover_sound.play();
    }
  }
}

void mousePressed() {
  lasers.add(new Laser(color(#E8CB23), s1.x+30, s1.y-10, laserMultiplier));
  lasers.add(new Laser(color(#E8CB23), s1.x, s1.y-30, laserMultiplier));
  lasers.add(new Laser(color(#E8CB23), s1.x-30, s1.y-10, laserMultiplier));
  laser_sound.play();
}

void startScreen() {
  background (0);
  textSize (20);
  textAlign (CENTER);
  text ("Welcome!", width/2, height/2);
  text ("Click to Continue...", width/2, height/2+20);

  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  textAlign (CENTER);
  fill (222);
  textSize (20);
  text ("Game Over!", width/2, height/2);
  text("Final Score: " + score, width/2, height/2+40);
  text ("You made it to level " + level, width/2, height/2+20);
  noLoop();
}

void infoPanel() {
  textAlign (LEFT);
  fill (128, 128);
  rectMode (CORNER);
  rect(0, height-100, width, 100);
  fill (255, 128);
  textSize (30);
  text ("Health: " + s1.health, 20, height-40);
  text ("Lives: " + s1.lives, 220, height-40);
  text ("Level: " + level, 350, height-40);
  text ("Score: " + score, 500, height-40);
  text ("Shield: " + shield.bars, 700, height-40);
}

void checkScore(int change) {
  if (score < 200) {
    level = 1;
  } else if (score < 400) {
    level = 2;
  } else if (score < 600) {
    level = 3;
  } else if (score < 800) {
    level = 4;
  } else {
    level = 5;
  }

  if ((score>=200)&&((score-change)<200)) {
    levelText.add(new LevelText(level));
  } else if ((score>=400)&&((score-change)<400)) {
    levelText.add(new LevelText(level));
  } else if ((score>=600)&&((score-change)<600)) {
    levelText.add(new LevelText(level));
  } else if ((score>=800)&&((score-change)<800)) {
    levelText.add(new LevelText(level));
  }
}
