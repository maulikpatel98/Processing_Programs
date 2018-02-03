class Drop{
  float x=random(-width,width);
  float y=random(-10000,-100);
  
  float z=random(0,10);
  float len = map(z,0,10,5,20);
  float yspeed=map(z,0,10,5,10);
  void fall(){
    //x+=7;
    y+=yspeed;
    //yspeed+=0.05;
    if(y>height)
    {
      yspeed=0;
        yspeed=map(z,0,10,5,10);
       y=random(-200,-100);
    }
  }
  
  void show(){
    float px = map(z,0,10,1,2);
    strokeWeight(px);
    stroke(138,43,226);
    line(x,y,z,x,y+len,z);
  }
  
}