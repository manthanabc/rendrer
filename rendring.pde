public void setup() {
  size(600, 600); 
  float[] p1 = {-1,1,1} ;
  float[] p2 = {1,1,1} ;
  float[] p3 = {-1,0,-1} ;
  plane p = new plane(p1, p2, p3);
  Vector r = new Vector(0,1,0);
  
  print(p.getDistance(r));
}

float[] o1 = {0, 300, 0};
float[] o2 = {0, 250, 0};
float[] o3 = {0, 350, 0};
float[] o4 = {20, 20, 20};

color c1 = color(255, 255, 255);
color c2 = color(255, 255, 255);
color c3 = color(255, 255, 255);

shape[] shapes = {
     new sphere(o1, c1, 20, 1, 0),
     new sphere(o2, c2, 20, 0, 1),
     new sphere(o3, c3, 20),
    //new plane(o1,o2,o4,color(0))
  };

float[] locaLight1 = {400, 600, 680 };
float[] locaLight2 = {400, 0, 680 };
float[] light3 = {-400, 0, 680};

light[] lights = {
    new pointLight(locaLight1, 0.5,color(200, 0, 200)),
    new pointLight(locaLight2, 0.5),
    new pointLight(light3,0.7,color(0,0,255))
  };

public void draw() {
  background(50);
  loadPixels();
  for (int i = 0 ;i<pixels.length; i++) {
    float z = (int) Math.floor(i / width);
    float x = i % width ;

    Vector ray = new Vector(x - width/2, 800, height/2 - z );
    
    pixels[i] = traceRay(ray);

  }
  updatePixels();
  text("fps -"+frameRate, 10,10);
}

public color traceRay(Vector ray) {
  float min = 100000;
  color colo = color(50);
  for(int c = 0 ; c< shapes.length ; c++) {
      shape sh = shapes[c];
      float dis = sh.getDistance(ray);
      if(dis > 0){
        if(dis < min) {
          min = dis;
          ray.mag = dis;
          float[] finalColor = { 0, 0, 0 } ;
          for(int lig= 0; lig < lights.length ; lig++) {
            light Plight = lights[lig];
            Vector Normal = sh.getNormal(ray);
            Vector lightV = new Vector(Plight.position[0]- ray.x(), Plight.position[1]-ray.y(), Plight.position[2]-ray.z());
            Normal = Normal.getNormal();
            
            // this is the amount of light reflected by that point
            float A = (lightV.dot(Normal)/ lightV.mag * Normal.mag);
            if (A > 0) { 
              finalColor[0] += A * Plight.intensity * getRed(Plight.col) * getRed(sh.getColor())/255;
              finalColor[1] += A * Plight.intensity * getGreen(Plight.col) * getGreen(sh.getColor())/255;
              finalColor[2] += A * Plight.intensity * getBlue(Plight.col) * getBlue(sh.getColor())/255;
            }
          }
          colo =  color(finalColor[0], finalColor[1], finalColor[2]);
        }
      }
    }
    return colo;
}

public float getRed(color col) {
 return ((col >> 16) & 0xFF);
}

public float getGreen(color col) {
  return ((col >> 8) & 0xFF);
}

public float getBlue(color col) {
  return  ((col) & 0xFF);
}


/// deals with the movement

public void keyPressed(){
  
  float speed = 3;
  
  for(int s =0 ; s < shapes.length ; s++) {
    shape sh = shapes[s];
    if (key == 'w') 
      sh.move(0*speed,-1*speed,0*speed);
    if (key == 's')
      sh.move(0*speed,1*speed,0*speed);
    if (key == 'a')
      sh.move(1*speed,0*speed,0*speed);
    if (key == 'd')
      sh.move(-1*speed,0*speed,0*speed);
  }
  
  for(int l = 0; l< lights.length ; l++) {
    light lig = lights[l];
    if (key == 'w') 
      lig.move(0*speed,-1*speed,0*speed);
    if (key == 's')
      lig.move(0*speed,1*speed,0*speed);
    if (key == 'a')
      lig.move(1*speed,0*speed,0*speed);
    if (key == 'd')
      lig.move(-1*speed,0*speed,0*speed);    
  }
}

public void mouseMoved() {
  float dir = pmouseX - mouseX ;
  float angel = dir * -0.02;
  
  for(int sh=0 ; sh < shapes.length ; sh++) {
    shape s = shapes[sh];
    s.turn(angel); 
  }
  
  for(int i = 0 ; i < lights.length ; i++) {
    float x = lights[i].position[0] ;
    float y = lights[i].position[1] ;
    lights[i].position[0] = x * cos(angel) - y * (sin(angel));
    lights[i].position[1] = x * (sin(angel)) + y * (cos(angel));
  }
}
