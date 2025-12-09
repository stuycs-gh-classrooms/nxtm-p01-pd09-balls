class Projectile {
  
  int x, y;
  int size;
  int dir;
  int spd = 3; //placeholdre
  
  Projectile(int prx, int pry, int prsize, int prdir) {
    x = prx;
    y = pry;
    size = prsize;
    dir = prdir; // -1 if player, 1 if enemy
    
  }
  
  void move() {
    y += dir * spd;
  }
  
  // touch player or enemy?
  void collisionCheck() {
  }
  
  void display() {
    line(x, y, x, y - size);
  }
}
