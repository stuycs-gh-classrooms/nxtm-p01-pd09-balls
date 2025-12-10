// driver file
Player p;
Projectile pPR; // only one player projectile should exist at a time

Enemy[][] invaders;

boolean playing; // pause funtion
int rows = 4;
int cols = 8; //placeholder numbers


void setup() {
  size(600, 600);
  
  p = new Player(width / 2, height - 40, width / 10);
  playing = true;
  
  invaders = new Enemy[rows][cols];
  for(int r = 0; r < rows; r++){
    for(int c = 0; c < cols; c++){
      invaders[r][c] = new Enemy(60 + c * 60, 60 + r * 60, int(random(3)));
    }
  }
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
  
  ///////enemy
  for(int r = 0; r < rows; r++){
    for(int c = 0; c < cols; c++){
      Enemy e = invaders[r][c];
      if(e.alive){
        e.update();
        e.display();
      }
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
