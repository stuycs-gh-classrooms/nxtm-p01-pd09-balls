class Projectile {
  
  int x, y;
  int size;
  int dir;
  int spd;
  
  Projectile(int prx, int pry, int prsize, int prdir, int prspd) {
    x = prx;
    y = pry;
    size = prsize;
    dir = prdir; // -1 if player, 1 if enemy
    spd = prspd;
    
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
  
  // Check collision with player
  boolean collisionCheck(Player opp) {
    if (y >= opp.y - opp.size && 
        x >= opp.x - opp.size &&
        x <= opp.x + opp.size) {
        println("hit");
        return true;
    }
    return false;
  }

  
  void display() {
    if (dir == 1) {stroke(255, 0, 0);} // enemy bullet red
    else {stroke(0);} // player black
    line(x, y, x, y - size);
  }
}
