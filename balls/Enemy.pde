
class Enemy {
  
  int x;
  int y;
  int type;
  int speed = 1;
  boolean alive = true;
  
  Enemy(int ex, int ey, int etype) {
    this.x = ex;
    this.y = ey;
  }
  
  void update(){
    if(alive){
      x += speed;
    }
    
    if(x > width - 20 || x < 20){
      speed *= -1;
      y += 30;
    }
    
  }
  
  void display(){
    fill(0);
    rect(x,y,25,25);
  }
  
}
