PImage rocketON;
PImage rocketOFF;
PImage space;
Mover m;
boolean movement = false;

void setup() {
  size(1200, 800);
  m = new Mover();
  rocketON = loadImage("rocketON.png");
  rocketOFF = loadImage("rocketOFF.png");
  space = loadImage("space.png");
  smooth();
}

void draw() {
  background(space);
  PVector force = new PVector(0, 0);
  m.applyForce(force);
  m.update();
  m.display();
  m.checkEdge();
}

void keyPressed() {
   if (key == CODED) {
     movement = true;
     if (keyCode == LEFT) {
      m.acceleration.x -= 0.2;
     }
     if (keyCode == RIGHT) {
      m.acceleration.x += 0.2;
     }
     if (keyCode == UP) {
      m.acceleration.y -= 0.2;
     }
     if (keyCode == DOWN) {
      m.acceleration.y += 0.2;
     }
   }
}

void keyReleased(){
  movement = false;
}
