class Bullet extends GameObject{
  Bullet(){
  }
  
  Bullet(PVector origin, float setSpeed){
    size = new PVector(3,3);
    setDir(new PVector(0, -1));
    
    setPos(new PVector(origin.x, origin.y));
    
    setSpeed(setSpeed);
  }
  
  Bullet(PVector origin, float setSpeed, boolean isFriendly){
    size = new PVector(3,3);
    setDir(new PVector(0, -1));
    friendly = isFriendly;
    
    setPos(new PVector(origin.x, origin.y));
    
    setSpeed(setSpeed);
  }
  
  void update(float dt){
    
    //move bullet
    setX(getX()+getDir().x*getSpeed());
    setY(getY()+getDir().y*getSpeed());
    
    if (getX() < 0 || getY() < 0 || getY() > height || getX() > width){
     this.remove = true; 
    }
  }
  
  void render(){
   fill(255, 0, 0);
   ellipse(getX(), getY(), getSize().x, getSize().y); 
  }
  
  void effect(Ship target){
    target.setHp(-1);
  }
}

class Weapon extends ScreenObject {
  boolean isShooting;
  PVector origin;
  PVector dir;
  
  Weapon(PVector setOrigin){
    origin = setOrigin;
    dir = new PVector(0, -5);
  }
  
  Weapon(PVector setOrigin, PVector setDir){
    origin = setOrigin;
    dir = setDir;
  }
  
  boolean fire(){
    isShooting = true;
    
    currentGame.gameObjects.add(new Bullet(origin, dir.y));
    
    return isShooting;
  }
  
  boolean ceaseFire(){
    isShooting = false;
    return isShooting;
  }
  
  void update(float dt){
  
  }
}

class BasicPlayerWeapon extends Weapon {
  
  BasicPlayerWeapon(PVector setOrigin){
    super(setOrigin);
  }
  
  BasicPlayerWeapon(PVector setOrigin, PVector setDir){
    super(setOrigin, setDir);
  }
  
  boolean fire(){
    isShooting = true;
    
    currentGame.gameObjects.add(new Bullet(origin, dir.y, true));
    
    return isShooting;
  }
}