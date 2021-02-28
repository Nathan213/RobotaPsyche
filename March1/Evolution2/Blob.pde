class Blob {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float wanderangle;
  float maxforce;
  float maxspeed;
  boolean alive = true;
  boolean spawn = false;
  DNA dna;

  Blob(float x, float y, float r, float mr, float imsf, float ims, PImage tempC) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);

    dna = new DNA(r, mr, imsf, ims, tempC);
    maxforce = dna.initialMaxSteeringForce;
    maxspeed = dna.initialMaxSpeed;
  }

  PVector wander() {            //blob movement method: wandering. (method taken from nature of code 6.12)
    float wanderR = 5;         
    float wanderD = 150;
    float change = 0.3;
    wanderangle += random(-change, change); 

    PVector circlepos = velocity.copy(); 
    circlepos.normalize();
    circlepos.mult(wanderD); 
    circlepos.add(location);

    float h = velocity.heading();

    PVector circleOffSet = new PVector(wanderR*cos(wanderangle+h), wanderR*sin(wanderangle+h));
    PVector target = PVector.add(circlepos, circleOffSet);
    return(target);
  }

  void seek(PVector target) {          //seek force
    PVector desired = PVector.sub(target, location);
    applyForce(applyLimits(desired));
  }

  PVector applyLimits(PVector desired) {
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    return(steer);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void checkEdge() {        //blobs can't leave the screen
    if ((location.x >= width) || (location.x <= 0)) {
      velocity.x = velocity.x*(-1);
    }
    if ((location.y >= height) || (location.y <= 0)) {
      velocity.y = velocity.y*(-1);
    }
  }

  void SOF (ArrayList<Blob> blobs) {            //Survival of the fittest function. bigger blob lives. 
    float r = dna.radius;
    for (Blob other : blobs) {
      float d = PVector.dist(location, other.location);
      if ((d != 0) && (d < (r + other.dna.radius)/2)) {
        if (r > other.dna.radius && (dna.c != other.dna.c)) {
          if (dna.radius < dna.maxRadius) {
            float r1 = other.dna.radius;
            dna.radius = r+r1;
            other.dna.radius = 0;
            other.alive = false;
          } else if (dna.radius >= dna.maxRadius) {
            alive = false;
          }
        }
        //if (dna.c == other.dna.c) {
        //  velocity.x = velocity.x*(-1);
        //  velocity.y = velocity.y*(-1);
        //  spawn = true;
        //}
      }
    }
  }

  void radiusCheck() {                          //however, bigger blob also dies from over eating
    if (dna.radius >= dna.maxRadius) {
      dna.radius = dna.maxRadius;
    }
  }

  void update() {
    checkEdge();
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
    radiusCheck();
  }

  void display() {
    float angle = velocity.heading() + PI/2;
    pushMatrix();
    translate(location.x, location.y);
    imageMode(CENTER);
    //if (dna.radius >= dna.maxRadius) {              //failed attempt at putting a sad face image on blob when it's at max radius
    //  image(full, 0, 0, dna.radius, dna.radius);
    //}
    rotate(angle);
    image(dna.c, 0, 0, dna.radius, dna.radius);
    popMatrix();
  }

  DNA getDNA() {
    return(dna.getDNA());
  }
}
