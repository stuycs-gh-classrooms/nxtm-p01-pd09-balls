// driver file
Player p;
Projectile pPR; // only one player projectile should exist at a time

Enemy[][] invaders;

boolean playing; // pause funtion
int rows = 4;
int cols = 8; //placeholder numbers
int score = 0;


void setup() {
  size(600, 600);

  p = new Player(width / 2, height - 40, width / 10);
  playing = true;

  invaders = new Enemy[rows][cols];
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
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
    
    checkCollisions();
  }

  ///////enemy movement and display
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      Enemy e = invaders[r][c];
      if (e.alive) {
        e.update();
        e.display();
      }
    }
  }

  // Display score
  fill(0);
  textSize(20);
  text("Score: " + score, 10, 30);
} // draw

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
    resetGame();
  }
} //keypressed

void checkCollisions() {
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      Enemy e = invaders[r][c];
      if (e.alive && pPR != null && pPR.collisionCheck(e)) {
        e.alive = false;  // kill the enemy
        pPR = null;  // destroy the projectile
        score += 10;  // add to score
      }
    }
  }
}

boolean gameOver() {
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      if (invaders[r][c].alive) {
        return false;  // game is not over if enemies = alive
      }
    }
  }
  return true;  // game over if enemies = dead
}

void resetGame() {
  score = 0;
  playing = true;
  p = new Player(width / 2, height - 40, width / 10);
  invaders = new Enemy[rows][cols];
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      invaders[r][c] = new Enemy(60 + c * 60, 60 + r * 60, int(random(3)));
    }
  }
}
