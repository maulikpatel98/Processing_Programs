import nervoussystem.obj.*;

import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


PImage img;
boolean record=false;
PeasyCam cam;
void setup()
{
  size(600,600,P3D);
  img = loadImage("pic.jpg");
  img.loadPixels();
  cam= new PeasyCam(this,100);
  noStroke();
  colorMode(HSB);
  translate(100,100,0);
}
void draw()
{
  if(record)
  {
    beginRecord("nervoussystem.obj.OBJExport", "pic.obj");
  }
  background(0);
  scale(5);
  //directionalLight(220,220,220,10,10,10);
  for(int x=0;x<100;x++)
    for(int y=0;y<100;y++)
      {
        int imgx = (int)map(x,0,100,0,img.width);
        int imgy = (int)map(y,0,100,0,img.height);
        float btr = brightness(img.get(imgx,imgy));
        
        pushMatrix();
        
        float hue =map(btr ,0,255,0,255);
        float set =map(btr ,0,255,0,255);
        float alpha = map(btr ,0,255,0,255);
        fill(hue,set,btr,alpha);
        float z = map(btr,0,255,0,10);
        translate(x,y,z);
        box(btr/200.0);
        popMatrix();
        if(record){
        endRecord();
        record=false;
        }
      }
}
void mousePressed()
{
  record = true;
}