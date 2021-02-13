abstract class light {
  float[] position = new float[3];
  float intensity ;
}

public class pointLight extends light {
  public pointLight(float[] location, float intensity) {
    this.position = location;
    this.intensity = intensity;
  }
}

public class dirLight extends light {
  float[] direction = new float[3];
  public dirLight(float[] direction, float intensity) {
    this.direction = direction;
    this.intensity = intensity;
  }   
}
