class DNA {
  PVector location;
  boolean alive;
  boolean reproduce;
  

  DNA(float x, float y) {
    location = new PVector(x, y);
    alive = true;
    reproduce = false;
  }

  void checkEdge() {      //if rocket crashes into screen edge, rocket despawns
  }
  
  void checkSpeed(){      //if rocket exceeds max speed, rocket despawns
  }
  
  void checkCrash(){      //if rocket crashes into earth in mid screen, rocket despawns
  }
  
  void reproduce(){       //if rocket stays in the safe zone for 5 seconds, the humans on board can engineer another rocket. 
  }
  
  void boom(){            //every 1-2 minutes, a supernova happens and destroys all rockets on screen. 
    if (boom >= superNova){
      alive = false;
    }
  }
}
