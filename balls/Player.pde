class Player {
  
  int hp;
  int x, y;
  int size; // radiuss
  int spd; // speed
  int lives;
  
  // constructor
  Player(int px, int py, int psize) {
    x = px;
    y = py;
    size = psize;
    spd = 15;
    lives = 5;
  }
  
  // move the player
  void move(int dir) {
    int newX = x + (spd * dir);
    if (newX < width && newX > 0) {
      x = newX;
    }
  }
  
  void shoot() {
    pPR = new Projectile(x, y, 20, -1, 15);
  }
  
  void display() {
    strokeWeight(1);
    stroke(0);
    fill(0);
    circle(x, y, size);
  }
}
