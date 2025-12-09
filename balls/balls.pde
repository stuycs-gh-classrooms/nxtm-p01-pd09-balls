// driver file
Player p;
Projectile pPR; // only one player projectile should exist at a time

Enemy[][] invaders;

boolean playing;

void setup() {
  size(600, 600);
  p = new Player(width / 2, height - 40, 60);
  playing = true;
}

void draw() {
  background(0);
  p.display();
}

void keyPressed() {
  
  if (playing) {
    
    //println("playing");
    // movement
    if (keyCode == LEFT) {
      p.move(-1);
      //println("left");
    }
    if (keyCode == RIGHT) {
      p.move(1);
    }
    
    // player shoot
    if (key == ' ') {
      p.shoot();
    }
  }
}
