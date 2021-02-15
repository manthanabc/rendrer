abstract class light {
  float[] position = new float[3];
  float intensity ;
  float[] col = {255, 255, 255} ;
}

public class pointLight extends light {
  public pointLight(float[] location, float intensity) {
    this.position = location;
    this.intensity = intensity;
  }
  public pointLight(float[] location, float intensity, float[] col) {
    this.position = location;
    this.intensity = intensity;
    this.col = col;
  }
}



public class dirLight extends light {
  float[] direction = new float[3];
  public dirLight(float[] direction, float intensity) {
    this.direction = direction;
    this.intensity = intensity;
  }
  public dirLight(float[] direction, float intensity, float[] col) {
    this.direction = direction;
    this.intensity = intensity;
    this.col = col;
  }
}
