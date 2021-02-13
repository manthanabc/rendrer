public class sphere {
 public float[]  center = new float[3];
 public color col = color(3,3,3);
 public float radious;
 public float diffuse;
 public float speacular;

 public sphere(float[] center, color col, float radious) {
   this.diffuse = 1;
   this.speacular = 1;
   this.center = center;
   this.col = col;
   this.radious = radious;
 }
 
 public sphere(float[] center, color col, float radious, float diffuse, float speacular) {
   this.diffuse = diffuse;
   this.speacular = speacular;
   this.center = center;
   this.col = col;
   this.radious = radious;
 }
}
