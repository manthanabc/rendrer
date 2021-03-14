abstract class shape {
 public boolean isCicle; 
 public boolean isPlane;
 
 abstract public color getColor();
 abstract public float getSpecular();
 abstract public float getDistance(Vector ray);
 abstract public void turn(float angel);
 abstract public void move(float dx, float dy,float dz);
 abstract public Vector getNormal(Vector ray);
}
