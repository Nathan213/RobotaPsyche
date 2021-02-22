class FlowField {
  PVector[][] field;
  int cols, rows;
  int resolution; 

  FlowField(int _res) {
    resolution = _res;
    cols = width/resolution;
    rows = height/resolution;

    field = new PVector[cols][rows];
    uniformFlowField();
  }

  void uniformFlowField() {
    PVector e = new PVector(width/2, height/2);
    PVector l;
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        l = new PVector(i*resolution, j*resolution);    //getting single point flow field location
        e.sub(l);                                       //corresponding direction vector to center
        field[i][j] = e;
        e = new PVector(width/2, height/2);             //reset center vector
      }
    }
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution, 0, cols-1));
    int row = int(constrain(lookup.y/resolution, 0, rows-1));
    return field[column][row].copy();
  }

  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        pushMatrix();
        translate(i*resolution, j*resolution);
        PVector f = field[i][j].copy();
        f.mult(resolution);
        line(0, 0, f.x, f.y);
        ellipse(f.x, f.y, 5, 5);
        popMatrix();
      }
    }
  }
}
