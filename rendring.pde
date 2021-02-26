public void setup() {
  size(600, 600); 
  float[] p1 = {-1,1,1} ;
  float[] p2 = {1,1,1} ;
  float[] p3 = {-1,0,-1} ;
  plane p = new plane(p1, p2, p3);
  Vector r = new Vector(0,1,0);
  float s = planeDistance(r,p);
  print(s);
}
float[] o1 = {0, 300, 0};
float[] o2 = {0, 250, 0};
float[] o3 = {0, 350, 0};

color c1 = color(0, 255, 0);
color c2 = color(255, 0, 0);
color c3 = color(0, 0, 255);

sphere[] spheres = {
    new sphere(o1, c1, 20, 1, 0),
    new sphere(o2, c2, 20, 0, 1),
    new sphere(o3, c3, 20)
  };
  
  
float[] locaLight1 = {400, 600, 680 };
float[] locaLight2 = {400, 0, 680 };
light[] lights = {
    new pointLight(locaLight1, 0.5),
    new pointLight(locaLight2, 0.5,o1)
  };

public void draaw() {
  background(50);
  loadPixels();
  for (int i = 0 ;i<pixels.length; i++) {
    float z = (int) Math.floor(i / width);
    float x = i % width ;

    Vector ray = new Vector(x - width/2, 800, height/2 - z );

    float min = 100000;
    for(int c = 0 ; c< spheres.length ; c++) {
      sphere circle = spheres[c];
      float dis = getCircleDis(ray, circle.center, circle.radious);
      if(dis > 0){
        if(dis < min) {
          min = dis;
          ray.mag = dis;
          float[] finalColor = { 0, 0, 0 } ;
          for(int lig= 0; lig < lights.length ; lig++) {
            light Plight = lights[lig];
            Vector Normal = new Vector( ray.x() - circle.center[0], ray.y() - circle.center[1], ray.z() - circle.center[2]);
            Vector lightV = new Vector(Plight.position[0]- ray.x(), Plight.position[1]-ray.y(), Plight.position[2]-ray.z());
            Normal = Normal.getNormal();
            
            // this is the amount of light reflected by that point
            float A = (lightV.dot(Normal)/ lightV.mag * Normal.mag);
            if (A > 0) { 
              finalColor[0] += A * Plight.intensity * Plight.col[0] * ((circle.col >> 16) & 0xFF)/255;
              finalColor[1] += A * Plight.intensity * Plight.col[1] * ((circle.col >> 8) & 0xFF)/255;
              finalColor[2] += A * Plight.intensity * Plight.col[2] * ((circle.col) & 0xFF)/255;
            }
          }
          pixels[i] = color(finalColor[0], finalColor[1], finalColor[2]);
        } 
      }
    }
  }
  updatePixels();
  text("fps -"+frameRate, 10,10);
  // circles[1][1] = mouseX;
}

public float getCircleDis(Vector ray, float[] location, float radious) {
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

public float planeDistance(Vector ray, plane p) {
 float[] ret = p.getABC();
 float a = ret[0];
 float b = ret[1];
 float c = ret[2];

 float dis = -c / (a*ray.x + b*ray.y - ray.z) ;
 return dis;
}

public float[] getDir(float[] vector) {
    float[] l2=vector;
    float p = 1 / sqrt(pow(l2[0], 2) + pow(l2[1], 2) + pow(l2[2], 2));
    l2[0] = l2[0] * p;
    l2[1] = l2[1] * p;
    l2[2] = l2[2] * p;
    return l2;
}

public float getMag(float[] vector) {
  float[] nV = {vector[0], vector[1], vector[2]};
  float[] dirV = getDir(vector);
  return nV[0] / dirV[0];
}

public float dis3d(float[] v1, float[] v2) {
  return sqrt(pow(v1[0]-v2[0], 2) + pow(v1[1]-v2[1], 2) + pow(v1[2]-v2[2], 2));
}

/// deals with the movement

public void keyPressed(){
  if(key == 'w'){
   for(int i =0 ; i< spheres.length ; i++) {
     spheres[i].center[1]-=3 ; 
   }
   for(int i =0 ; i < lights.length ; i++ ) {
     lights[i].position[1]-=3; 
   }
  } else if(key == 's'){
     for(int i =0 ; i< spheres.length ; i++) {
       spheres[i].center[1]+=3 ;
     }
     for(int i =0 ; i < lights.length ; i++ ) {
       lights[i].position[1]+=3; 
     }
   } else if(key == 'a'){
     for(int i =0 ; i< spheres.length ; i++) {
       spheres[i].center[0]+=3 ; 
     }
     for(int i =0 ; i < lights.length ; i++ ) {
       lights[i].position[0]+=3; 
     }
   } else if(key == 'd'){
     for(int i =0 ; i< spheres.length ; i++) {
       spheres[i].center[0]-=3 ; 
     }
     for(int i =0 ; i < lights.length ; i++ ) {
       lights[i].position[0]-=3; 
     }
   }
}

public void mouseMoved() {
  float dir = pmouseX - mouseX ;
  float angel = dir * -0.02;
  for(int i = 0 ; i< spheres.length ; i ++) {
    float x = spheres[i].center[0] ;
    float y = spheres[i].center[1] ;
    float r = sqrt(pow(x, 2) + pow(y, 2)) ;
    spheres[i].center[0] = x * cos(angel) - y * (sin(angel));
    spheres[i].center[1] = x * (sin(angel)) + y * (cos(angel));
  }
  
  for(int i = 0 ; i < lights.length ; i++) {
    float x = lights[i].position[0] ;
    float y = lights[i].position[1] ;
    lights[i].position[0] = x * cos(angel) - y * (sin(angel));
    lights[i].position[1] = x * (sin(angel)) + y * (cos(angel));
  }
}
