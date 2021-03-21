public class sphere extends shape{
 public float[]  center = new float[3];
 public color col;
 public float radious;
 public float specular = 22;

 public sphere(float[] center, color col, float radious) {
   this.specular = 1;
   this.center = center;
   this.col = col;
   this.radious = radious;
 }
 
 public sphere(float[] center, color col, float radious, float specular) {
   this.specular = specular;
   this.center = center;
   this.col = col;
   this.radious = radious;
 }
 
 public float getDistance(Vector ray) {
  float[] location = { this.center[0] - ray.Ox, this.center[1] - ray.Oy, this.center[2] - ray.Oz };
  float radious = this.radious;
  float a = (pow(ray.x, 2) + pow(ray.y, 2) + pow(ray.z, 2)) ;
  float b = -2 * ((ray.x * location[0]) + (ray.y * location[1]) + (ray.z * location[2])) ;
  float c = (pow(location[0], 2) + pow(location[1], 2) + pow(location[2], 2) - pow(radious, 2)) ;
 
  float dis = (float) (pow(b, 2) - (4 * (a * c)));

  if(dis < 0) { 
   return -1; 
  }

  float t1 = (-1 * b + sqrt(dis) ) / 2 * a;
  float t2 = (-1 * b - sqrt(dis) ) / 2 * a;
  
  return (t1 > t2)? (t2 > 0)? t2: t1 : t1;
 }
 
 public void move(float dx,float dy,float dz) {
  this.center[0] += dx;
  this.center[1] += dy;
  this.center[2] += dz;
 }
 
 public void turn(float angel) {
  float x = center[0];
  float y = center[1];
  center[0] =  x * cos(angel) - y * (sin(angel));
  center[1] =  x * (sin(angel)) + y * (cos(angel));
 }
 
 public Vector getNormal(Vector ray) {
   return new Vector( (ray.x() + ray.Ox) - center[0], ( ray.y() + ray.Oy) - center[1], (ray.z() + ray.Oz) - center[2]);
 }
 
 public color getColor() {
   return this.col;
 }
 
 public float getSpecular() {
   return this.specular;
 }
 
 public float[] getPosition() {
  return center; 
 }
}
