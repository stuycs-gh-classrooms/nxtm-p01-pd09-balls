// driver file
Player p;
Projectile pPR; // only one player projectile should exist at a time

Enemy[][] invaders;

boolean playing; // pause funtion

void setup() {
  size(600, 600);
  
  p = new Player(width / 2, height - 40, width / 10);
  playing = true;
}

void draw() {
  background(255);
  
  p.display();
  
  if (pPR != null) {
    pPR.display();    
    
    if (playing) {
      pPR.move();
    }
    
    if (pPR.y <= 0) { // destroy whenit goes off screen
      pPR = null;
    }
    
  }
}

void keyPressed() {
  
  if (playing) { // player controsl
    
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
      if (pPR == null) {
        p.shoot();
      }
    }
  }
  
  if (key == 'p') {
    playing = !playing;
  }
  if (key == 'r') {
    
  }
}
