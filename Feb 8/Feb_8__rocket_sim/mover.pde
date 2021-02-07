class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float maxSpeed = 2;
  
  Mover() {
    location = new PVector(width/2, height/4);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void update() {
    velocity.limit(maxSpeed);
    velocity.add(acceleration);
    acceleration.mult(0);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    fill(175);

    // Rotate the mover to point in the direction of travel
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

  void applyForce(PVector force) {
    if (movement == true) {
      acceleration.add(force);
    }
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
