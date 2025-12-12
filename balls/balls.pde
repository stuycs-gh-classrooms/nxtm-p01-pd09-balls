// driver file
Player p;
Projectile pPR; // only one player projectile should exist at a time

Enemy[][] invaders;
Projectile[] ePR;

boolean playing; // pause funtion
int rows = 4;
int cols = 8; //placeholder numbers
int score = 0;
int difficulty;


void setup() {
  size(600, 600);

  p = new Player(width / 2, height - 40, width / 20);
  playing = true;

  invaders = new Enemy[rows][cols];
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      invaders[r][c] = new Enemy(60 + c * 60, 60 + r * 60, int(random(3)));
    }
  }
  ePR = new Projectile[5]; // cap on how many enemy projectiles can exist at once
}

void draw() {
  background(255);
  
  // player + player projcetile
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
      
      if (playing) {
        e.update();
        e.shoot();
        if (e.alive) {
          // check if anyone has hit the edegeg
          if(e.x > width - 20 || e.x < 20){
            moveEnemies();
          }
          
        }
      }
      if (e.alive) {
        e.display();
      }

      
    }
  }
  
  // enemy projectiles
  for (int i = 0; i < ePR.length; i++) { 
    if (ePR[i] != null) {
      if (playing) {
        ePR[i].move();    
      }
      ePR[i].display();
      if (ePR[i].y >= height) {
        ePR[i] = null;
      }
      else if (ePR[i].collisionCheck(p)) {
        p.lives -= 1;
        ePR[i] = null;
      }
    }
  }

  // Display score & lives
  fill(0);
  textSize(20);
  text("Score: " + score, 10, 30);
  text("Lives: " + p.lives, 10, 50);
  text("Difficulty: " + difficulty, 10, 70);
  
  // game over?
  if (gameOver() == 0) { // lost
    playing = false;
    fill(255, 0, 0);
    text("YOU LOSE!", 10, 90);
  }
  else if (gameOver() == 1) { // won
    // respawn invadres
    for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      invaders[r][c] = new Enemy(60 + c * 60, 60 + r * 60, int(random(3)));
    }
  }
  
  difficulty += 1;
  int projLimit = ePR.length + 5;
  ePR = new Projectile[projLimit]; // more projectiles can exist at once
  
  }
  
  // pause
  else if (!playing) {
    fill(255, 0, 0);
    text("PAUSED", 10, 90);
  }
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

// once one enemy hits the edge evryone moves down
void moveEnemies() {
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      invaders[r][c].speed *= -1;
      invaders[r][c].y += 30; //moves down after hitting screen edge
    }
  }
}

//boolean gameOver() {
//  if (p.lives <= 0) {
//    return true;
//  }
  
//  for (int r = 0; r < rows; r++) {
//    for (int c = 0; c < cols; c++) {
//      if (invaders[r][c].alive) {
//        return false;  // game is not over if enemies = alive
//      }
//    }
//  }
//  return true;  // game over if enemies = dead
//}

int gameOver() {
  if (p.lives <= 0) {
    return 0; //lost
  }
  
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      if (invaders[r][c].alive) {
        return -1;  // game cotineu
      }
    }
  }
  return 1;  // won // game over if enemies = dead
}

void resetGame() {
  score = 0;
  playing = true;
  p = new Player(width / 2, height - 40, width / 20);
  invaders = new Enemy[rows][cols];
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      invaders[r][c] = new Enemy(60 + c * 60, 60 + r * 60, int(random(3)));
    }
  }
}
