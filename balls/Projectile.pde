class Projectile {
  
  int x, y;
  int size;
  int dir;
  int spd;
  
  Projectile(int prx, int pry, int prsize, int prdir) {
    x = prx;
    y = pry;
    size = prsize;
    dir = prdir; // -1 if player, 1 if enemy
    spd = 10;
    
  }
  
  void move() {
    y += dir * spd;
  }
  
  // touch player or enemy
  boolean collisionCheck(Enemy opp) {
    if (y - size == opp.y + opp.size) {
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean collisionCheck(Player opp) {
    if (y - size == opp.y + opp.size) {
      return true;
    }
    else {
      return false;
    }
  }
  
  void display() {
    line(x, y, x, y - size);
  }
}
