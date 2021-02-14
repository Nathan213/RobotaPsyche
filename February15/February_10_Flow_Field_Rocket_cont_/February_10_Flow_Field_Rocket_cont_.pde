PImage rocketON;
PImage rocketOFF;
PImage space;
ArrayList<Mover> mover;
FlowField f;
boolean movement = false;

void setup() {
  size(1200, 800);
  mover = new ArrayList<Mover>();
  rocketON = loadImage("rocketON.png");
  rocketOFF = loadImage("rocketOFF.png");
  space = loadImage("space.png");
  f = new FlowField(15);
  smooth();
}

void mousePressed() {
  mover.add(new Mover(mouseX, mouseY));
}

void draw() {
  background(space);
    for (int i = 0; i < mover.size(); i++) {
      Mover m = mover.get(i);
      m.update();
      m.display();
      m.checkEdge();
      m.follow(f);
      if (keyPressed == true){ 
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
    
    }
}

void keyReleased(){
  movement = false;
}
