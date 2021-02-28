class plane extends shape{
 float[] p1, p2, p3;
 color col;
 public plane(float[] p1,float[] p2,float[] p3) {
   this.p1 = p1;
   this.p2 = p2;
   this.p3 = p3;
 }
  
 public float[] getABC() {
   float x1 = p1[0];
   float x2 = p2[0];
   float x3 = p3[0];
   
   float y1 = p1[1];
   float y2 = p2[1];
   float y3 = p3[1];
   
   float z1 = p1[2];
   float z2 = p2[2];
   float z3 = p3[2];
   
   float b = ( (z1 - z2) * (x2 - x3) - (z1 - z3) * (x1 - x2) ) / ((y1 - y2) * (x2 - x3) - (y1 - y3) * (x1 - x2));
   float a = ( (p2[2] - p3[2]) - b * (y2 - y3) ) / (x2 - x3) ;
   float c = z3 - a * x3 - b * y3;
   
   float[] retu = {a,b,c};
   
   return retu;
 }
 
 public void move(float dx,float dy, float dz) {
   this.p1[0] += dx;
   this.p1[1] += dy;
   this.p1[2] += dz;
   
   this.p2[0] += dx;
   this.p2[1] += dy;
   this.p2[2] += dz;
   
   this.p3[0] += dx;
   this.p3[1] += dy;
   this.p3[2] += dz;
 }
 
 public void turn(float angel) {
   p1[0] = p1[0] * cos(angel) - p1[1] * (sin(angel));
   p1[1] = p1[0] * (sin(angel)) + p1[1] * (cos(angel));
   
   p2[0] = p2[0] * cos(angel) - p2[1] * (sin(angel));
   p2[1] = p2[0] * (sin(angel)) + p2[1] * (cos(angel));
   
   p3[0] = p3[0] * cos(angel) - p3[1] * (sin(angel));
   p3[1] = p3[0] * (sin(angel)) + p3[1] * (cos(angel));
 }
 
 public float getDistance(Vector ray) {
   return -1;
 }
 
 public Vector getNormal(Vector ray) {
   return new Vector(0,0,0);
 }
 
 public color getColor() {
   return this.col; 
 }
  
}
