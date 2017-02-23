ScreenObject screenController;
Game currentGame;

PlayerController player1Controller;
PlayerController player2Controller;

void setup(){
  size(800,600);
  player1Controller = new PlayerController();
  screenController = new SplashScreen();
  currentGame = new Game();

}

void draw(){
  //Game loop
  screenController.update(0.033);
  screenController.render();
  
}

//-----------------------------------------------------------------------------

//Playercontrol listeners
void mousePressed() {
  if (player1Controller != null){
    player1Controller.setSTATE(1);
  }
}
void mouseReleased() {
  if (player1Controller != null){
    player1Controller.setSTATE(0);
  }
}

void keyPressed() {
  if (player1Controller != null){
      if (key == 'a') {
        player1Controller.dir.x = -1;
      } 
      if (key == 'd') {
        player1Controller.dir.x = 1;
      } 
      if (key == 'w') {
        player1Controller.dir.y = -1;
      } 
      if (key == 's') {
        player1Controller.dir.y = 1;
      } 
  }  
}
void keyReleased() {
  if (player1Controller != null){
      if (key == 'a') {
        player1Controller.dir.x = 0;
      } 
      if (key == 'd') {
        player1Controller.dir.x = 0;
      }
      if (key == 'w') {
        player1Controller.dir.y = 0;
      } 
      if (key == 's') {
        player1Controller.dir.y = 0;
      } 
  }  
}