class plane {
 float[] p1, p2, p3;
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
  
}
