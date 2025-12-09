// driver file
Player p;
Projectile pPR;

Enemy[][] invaders;
boolean playing;

void setup() {
  size(600, 600);
  p = new Player(10, 10, 10);
  playing = true;
}

void keyPressed() {
  
  if (playing) {
    
    // movement
    if (key == LEFT) {
      p.move(-1);
    }
    if (key == RIGHT) {
      p.move(1);
    }
    
    // shoot
    if (key == ' ') {
      p.shoot();
    }
  }
}
