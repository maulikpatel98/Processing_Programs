float angle = 0;
int k = 10;
float u = 0;
ArrayList<PVector> a = new ArrayList<PVector>();
void setup()
{
  size(600,400,P3D);
  //fullScreen(P3D);
  frameRate(1000);
}
void draw()
{
  background(0);
    
  float beta = 0;
  
  translate(width/2,height/2);
  spotLight(25,255,255, 400, 200, 0, -1, 0, 0, PI/2, 2);
  spotLight(255,255,100, -400, -200, 0, 1, 0, 0, PI/2, 2);
  directionalLight(255,0,255, 0, -1, -1);
  //rotateX(angle);
  rotateZ(-angle);
  rotateY(angle);
  angle+=0.006;
  
  strokeWeight(0.05);
  sphere(60);
  scale(60);
  

  
  if(u < (4*k+2)*PI){
   float r = 100*(0.8 + 1.6 * sin(6 * beta));
   float theta = 2 * beta;
   float phi = 0.6 * PI * sin(12 * beta); 
   
     //3 knot formulas
     //float mu = beta * (2*PI) * 10000 / NSEGMENTS;
     //float x = cos(mu) * (1 + cos(100*mu/10000) / 2.0);
     //float y = sin(mu) * (1 + cos(100*mu/10000) / 2.0);
     //float z = sin(100*mu/10000) / 2.0;
   
   // 4 knot formula
   //float x = r * cos(phi) * cos(theta);
   //float y = r * cos(phi) * sin(theta);
   //float z = r * sin(phi);  
   
   
   //8 knot formula
   //float x = 10 *(cos(beta) + cos(3*beta)) + cos(2*beta) + cos(4*beta);
   //float y = 6*sin(beta) + 10*sin(3*beta);
   //float z = 4*sin(3*beta)*sin(5*beta / 2) + 4*sin(4*beta) - 2*sin(6*beta); 
 
    //clinquefoil knot formulas
    float x = cos(u) *(2 - cos(2*u/(2*k + 1)));
    float y = sin(u)*(2 - cos(2*u/(2*k + 1)) );
    float z = -sin(2*u/(2*k + 1));

    
    u+=0.03;
    
    
    a.add(new PVector(x,y,z));
    
    
  }
   beginShape();
   for(PVector v : a)
   {
     float m = v.mag();
     stroke(25,255,255);
     point(v.x,v.y,v.z);
   }
   endShape();
   //saveFrame("frames/####.png");
}