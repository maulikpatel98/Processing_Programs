import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


Drop[] drops = new Drop[5000];
//PeasyCam cam;
void setup(){
size(700,700,P3D);
//cam = new PeasyCam(this,500);
for(int i=0;i<drops.length;i++)
  {
   // drops[i].fall();
    //drops[i].show();
    drops[i]=new Drop();
  }
}
void draw(){
background(51);  
//translate(0,0,-80);  
  for(int i=0;i<drops.length;i++)
  {
    drops[i].fall();
    drops[i].show();
  }
  
  //saveFrame("output/drops_#####.png");
  
}