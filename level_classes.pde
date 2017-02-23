class Level extends ScreenObject {
  PImage background;
  float scroll;
  
  Ship player1; 
  Ship finalBoss;
  boolean levelComplete;
  ArrayList<GameObject> shipObjects;
  ArrayList<GameObject> gameObjects;
  
  Level(){
  }
  
  Level(Ship refPlayer1, ArrayList<GameObject> refShipObjects, ArrayList<GameObject> refGameObjects){
    background = loadImage("level1.bmp");
    player1 = refPlayer1;
    levelComplete = false;
    shipObjects = refShipObjects;
    gameObjects = refGameObjects;
  }
  
  void update(float dt){
    scroll++;
    if (scroll == 600){
      Ship bar = new Ship(new BasicEnemyController(player1.getPos()), 0, 0);
      Ship foo = new Ship(new BasicEnemyController(player1.getPos()), width, 0);
      shipObjects.add(bar);
      shipObjects.add(foo);
    }
    if (scroll == 1200){
      finalBoss = new Ship(new BasicEnemyController(player1.getPos()), width/2, 0);
      finalBoss = new MakeBig(finalBoss);
      shipObjects.add(finalBoss);
    }
    
    //win level condition
    if (finalBoss != null && finalBoss.remove){
      levelComplete = true;
    }
  }
  
  void render(){
   image(background, background.width/2, scroll);
   image(background, background.width, scroll);
   image(background, background.width*2, scroll);
  }
  
  Level nextLevel(Ship refPlayer1, ArrayList<GameObject> refShipObjects, ArrayList<GameObject> refGameObjects){
    
    refPlayer1.pos.x = width/2;
    refPlayer1.pos.y = height-100;
    
    //bug when changing level... can you figure out why? ;)
    //refPlayer1.pos = new PVector(width/2, height-100);
    return new Level2(refPlayer1, refShipObjects, refGameObjects);
  }
}

class Level2 extends Level{
  
  Level2(Ship refPlayer1, ArrayList<GameObject> refShipObjects, ArrayList<GameObject> refGameObjects){
    background = loadImage("level2.bmp");
    player1 = refPlayer1;
    shipObjects = refShipObjects;
    gameObjects = refGameObjects;
  }
  
  void update(float dt){
    scroll++;
    if (scroll == 100){
      PowerUp foo = new PowerUp(new PVector(width/2, 1), 5);
      gameObjects.add(foo);
    }
    if (scroll == 600){
      Ship bar = new Ship(new BasicEnemyController(player1.getPos()), 0, 0);
      Ship foo = new Ship(new BasicEnemyController(player1.getPos()), width, 0);
      shipObjects.add(bar);
      shipObjects.add(foo);
      
      Ship baar = new Ship(new BasicEnemyController(player1.getPos()), width/2, 0);
      Ship fooo = new Ship(new BasicEnemyController(player1.getPos()), width/2, -100);
      shipObjects.add(baar);
      shipObjects.add(fooo);
    }
    if (scroll == 1200){
      Ship bar = new Ship(new BasicEnemyController(player1.getPos()), width/2, 0);
      bar = new MakeBig(bar);
      bar = new MakeBig(bar);
      shipObjects.add(bar);
    }
  }
  
}