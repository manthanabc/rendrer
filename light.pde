abstract class light {
  float[] position = new float[3];
  float intensity ;
  color col = color(255, 255, 255);
  
  abstract void move(float dx, float dy,float dz);
}

public class pointLight extends light {
  public pointLight(float[] location, float intensity) {
    this.position = location;
    this.intensity = intensity;
  }
  public pointLight(float[] location, float intensity, color col) {
    this.position = location;
    this.intensity = intensity;
    this.col = col;
  }
  public void move(float dx, float dy,float dz) {
    this.position[0] +=dx;
    this.position[1] +=dy;
    this.position[2] +=dz;
  }
}



public class dirLight extends light {
  float[] direction = new float[3];
  public dirLight(float[] direction, float intensity) {
    this.direction = direction;
    this.intensity = intensity;
  }
  public dirLight(float[] direction, float intensity, color col) {
    this.direction = direction;
    this.intensity = intensity;
    this.col = col;
  }
  public void move(float dx, float dy,float dz) {
    this.position[0] +=dx;
    this.position[1] +=dy;
    this.position[2] +=dz;
  }
}
