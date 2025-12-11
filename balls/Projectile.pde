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
  
  // Check collision with enemies
  boolean collisionCheck(Enemy opp) {
    if (y - size < opp.y + 25 && y + size > opp.y && x > opp.x && x < opp.x + 25) {
      return true;
    }
    return false;
  }

  
  void display() {
    line(x, y, x, y - size);
  }
}
