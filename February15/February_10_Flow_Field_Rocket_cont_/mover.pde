class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxforce = 0.1;
  float maxSpeed = 2;
  
  Mover(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void update() {
    velocity.limit(maxSpeed);
    velocity.add(acceleration);
    acceleration.mult(0);
    location.add(velocity);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void follow(FlowField flow) {
    PVector desired = flow.lookup(location);
    desired.mult(maxSpeed);
    
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void display() {
    stroke(0);
    fill(175);
    imageMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading());
    if (movement == true){
      image(rocketON, -15, 0, 90, 32);
    }
    else if (movement == false) {
      image(rocketOFF, 0, 0, 56, 32);
    }
    popMatrix();
  }

  
  void checkEdge(){
    if ((location.x >= width) || (location.x <= 0)){
      velocity.x = velocity.x*(-1);
    }
    if ((location.y >= height) || (location.y <= 0)){
      velocity.y = velocity.y*(-1);
    }
  }
}
