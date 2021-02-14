class Vector {
  public float x, y, z;
  public float Ox,Oy,Oz = 0.0f;
  public float mag;
  
  public Vector(float x, float y, float z) {
    float[] v = {x, y, z};
    this.mag = getMag(v);  
    float[] dir = getDir(v);
    
    this.x = dir[0] ;
    this.y = dir[1] ;
    this.z = dir[2] ;
  }
  
  public Vector(float Ox, float Oy, float Oz, float x, float y, float z) {
    this.x = x ;
    this.y = y ;
    this.z = z ;
    this.Ox = Ox ;
    this.Oy = Oy ;
    this.Oz = Oz ;
  }
 
  public Vector(float x, float y, float z, float mag) {
    this.x = x ;
    this.y = y ;
    this.z = z ;
    this.mag = mag;
  }
  
  public Vector(float Ox, float Oy, float Oz, float x, float y, float z, float mag) {
    this.x = x ;
    this.y = y ;
    this.z = z ;
    this.Ox = Ox ;
    this.Oy = Oy ;
    this.Oz = Oz ;
  }
  
  /// public methods
  
  public float dot(Vector b) {
    return (b.x * this.x + b.y * this.y + b.z * this.z) * ( b.mag * this.mag);
  }
  
  public Vector getNormal() {
    return new Vector(x, y, z); 
  }
  
  public Vector addV(Vector b) {
    float x = this.x * this.mag + b.x * b.mag ;
    float y = this.y * this.mag + b.y * b.mag ;
    float z = this.z * this.mag + b.z + b.mag ;
    return new Vector(x, y, z);
  }
  
  public Vector subV(Vector b) {
    float x = this.x * this.mag - b.x * b.mag ;
    float y = this.y * this.mag - b.y * b.mag ;
    float z = this.z * this.mag - b.z + b.mag ;
    return new Vector(x, y, z);
  }
  
  public Vector mulV(Vector b) {
    float x = this.x * this.mag * b.x * b.mag ;
    float y = this.y * this.mag * b.y * b.mag ;
    float z = this.z * this.mag * b.z + b.mag ;
    return new Vector(x, y, z);
  }
  
  public float x() {   return this.x * this.mag;   }
  public float y() {   return this.y * this.mag;   }
  public float z() {   return this.z * this.mag;   }
  
  // priviate methods
  
  private float[] getDir(float[] vector) {
    float[] l2=vector;
    float p = 1 / sqrt(pow(l2[0], 2) + pow(l2[1], 2) + pow(l2[2], 2));
    l2[0] = l2[0] * p;
    l2[1] = l2[1] * p;
    l2[2] = l2[2] * p;
    return l2;
  }
  
  private float getMag(float[] vector) {
    float[] nV = {vector[0], vector[1], vector[2]};
    float[] dirV = getDir(vector);
    return (nV[0] == 0)?((nV[1] ==0)?((nV[2] == 0)?0:nV[2] / dirV[2]):nV[1] / dirV[1]):nV[0] / dirV[0];
  }
}
