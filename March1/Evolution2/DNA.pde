class DNA {
  float radius;
  float maxRadius;
  float initialMaxSteeringForce;
  float initialMaxSpeed;
  PImage c;

  DNA (float r, float mr, float imsf, float ims, PImage tempC) {
    radius = r;
    maxRadius = mr;
    initialMaxSteeringForce = imsf;
    initialMaxSpeed = ims;
    c = tempC;
  }

  DNA getDNA() {

    DNA dna = new DNA(radius, maxRadius, initialMaxSteeringForce, initialMaxSpeed, c);
    return dna;
  }
}
