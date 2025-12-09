class Player {
  
  int hp;
  int x, y;
  int size;
  int spd; // speed
  
  // constructor
  Player(int px, int py, int psize) {
    x = px;
    y = py;
    size = psize;
    spd = 3;
  }
  
  // move the player
  void move(int dir) {
    int newX = x + (spd * dir);
    if (newX < width && newX > 0) {
      x = newX;
    }
  }
  
  void shoot() {
    pPR = new Projectile(x, y, 4, -1);
  }
  
  void display() {
    circle(x, y, size);
  }
}
