//creating an array list of blob class
ArrayList<Blob> blobs = new ArrayList<Blob>();

//boolean birth = false;        failed attempt at spawning on same color collision
//float x1;
//float y1;
//float r1;
//DNA dna1;

PImage red;                      //initialize image variables
PImage green;
PImage blue;
PImage full;
PImage bg;


void setup() {
  size (1200, 800);
  //color r = color(255, 0, 0);    //test runs without images
  //color g = color(0, 255, 0);
  //color b = color(0, 0, 255);
  red = loadImage("red.png");      //calling images
  green = loadImage("green.png");
  blue = loadImage("blue.png");
  full = loadImage("full.png");
  bg = loadImage("bg.jpeg");
  PImage[] teams = {red, green, blue};    //array to decide which type of germ the new blob is 


  for (int i = 0; i < 15; i++) {      //calling blobs, 15 by default
    int team = int(random(0, 3));
    blobs.add(new Blob(random(width), random(height), // location
      random(40, 60), // radius
      random(150, 200), //maximum radius a blob can get
      0.10, // initial maximum steering force
      2.0, // initial maximum speed
      teams[team]    //blob type (red green blue)
      ));
  }
  smooth();
}

void draw() {
  background(bg);
  for (Blob v : blobs) {    //calling all blob functions
    v.display();
    v.update();
    v.seek(v.wander());
    v.SOF(blobs);
    //if (v.spawn == true) {            //failed attempt to spawn on same color collision
    //  birth = true;
    //  if (v.location.x > width/2) {
    //    x1 = v.location.x - v.dna.radius *2;
    //    if (v.location.y > height/2) {
    //      y1 = v.location.y - v.dna.radius *2;
    //    } else if (v.location.y <= height/2) {
    //      y1 = v.location.y + v.dna.radius *2;
    //    }
    //  }
    //  if (v.location.x <= width/2) {
    //    x1 = v.location.x + v.dna.radius *2;
    //    if (v.location.y > height/2) {
    //      y1 = v.location.y - v.dna.radius *2;
    //    } else if (v.location.y <= height/2) {
    //      y1 = v.location.y + v.dna.radius *2;
    //    }
    //  }
    //  dna1 = v.dna;
    //  v.spawn = false;
    //}
  }

  //if (birth == true) {
  //  blobs.add(new Blob(
  //    x1, 
  //    y1, 
  //    dna1.radius, 
  //    dna1.initialMaxSteeringForce, 
  //    dna1.initialMaxSpeed, 
  //    dna1.c
  //    ));
  //  birth = false;
  //}
  
  if ((frameCount % 100) == 0) {              //current reproduction method. Spawns a random blob type, modelling one from the current array list of blobs on screen. 
    
    Blob v = blobs.get(int(random(blobs.size())));
    DNA dna = v.getDNA();

    blobs.add(new Blob(
      random(width),
      random(height),
      random(40, 60),
      dna.maxRadius,
      dna.initialMaxSteeringForce,
      dna.initialMaxSpeed,
      dna.c
      ));
  }

  for (int i = blobs.size() - 1; i >= 0; i--) {        //remove blobs when it dies
    Blob v = blobs.get(i);
    if (!v.alive) {
      blobs.remove(v);
    }
  }
}
