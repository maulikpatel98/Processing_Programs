class Bullet
{
  PVector pos;
  float size = 10;
  
  
  
  void show()
  { 
    color C = (int)(random(255));
    fill(C);
    noStroke();   
    ellipse(pos.x,pos.y,size,size);   
    
  }
  
  
  
}