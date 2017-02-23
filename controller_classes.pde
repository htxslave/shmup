class Controller{
  int STATE;
  PVector dir;
  
  Controller(){
    dir = new PVector(0, 0);
  }
  
  int getSTATE(){
    return STATE;
  }
  void setSTATE(int s){
    STATE = s;
  }
  
  PVector getDir(){
     return dir;
   }
   
   void update(PVector origin){
   }
}

class PlayerController extends Controller{
  PlayerController(){
    dir = new PVector(0, 0);
  }
  
}

class BasicEnemyController extends Controller{
  PVector playerPos;
  float speed = 1;
  float move = 1;
  
  BasicEnemyController(PVector setPlayerPos){
    
    dir = new PVector(1, 0);
    playerPos = setPlayerPos;
  }
  
  void update(PVector origin){
    if (origin.x < 0 ){
     move = 1; 
    } else if (origin.x > width ){
     move = -1; 
    }
    
    if (origin.x > playerPos.x - 5 && origin.x < playerPos.x + 5){
      setSTATE(1);
      speed = 0;
    } else {
      speed = 1;
      setSTATE(0);
    }
    dir = new PVector(move*speed, 0.2);
  }
}