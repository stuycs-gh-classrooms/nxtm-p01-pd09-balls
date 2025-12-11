
class Enemy {
  
  int x;
  int y;
  int type;
  int speed = 1;
  int shootChance; // different for diffetrent tpyes
  boolean alive = true;
  
  Enemy(int ex, int ey, int etype) {
    x = ex;
    y = ey;
    type = etype;
    if (type == 0) {shootChance = 400;}
    else if (type == 1) {shootChance = 300;}
    else if (type == 2) {shootChance = 250;}
  }
  
  void update(){
    if(alive){
      x += speed;
    }
    
    //if(x > width - 20 || x < 20){
    //  speed *= -1;
    //  y += 30; //moves down after hitting screen edge
    //}
    
  }
  
  void display(){
    if (type == 0) {fill(255,0,0);}
    else if (type == 1) {fill(0, 255, 0);}
    else if (type == 2) {fill(0, 0, 255);}
    
    stroke(0);
    rect(x,y,25,25);
  }
  
  void shoot() {
    int i = findEmptyIndex(ePR);
    if (i != -1) {
      //println("tried to shoot");
      if (int(random(shootChance)) == 0) {
        ePR[i] = new Projectile(x, y, 20, 1, 5);
        println("shoht");
      }
    }
  }
  
  int findEmptyIndex(Projectile[] e) {
    for (int i = 0; i < e.length; i++) {
      if (e[i] == null) {
        return i;
      }
    }
    return -1; //array full
  }
  
  
}
