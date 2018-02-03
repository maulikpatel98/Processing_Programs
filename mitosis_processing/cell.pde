class Cell{
  
PVector pos = new PVector(random(200,width-200),random(200,height-200));
//PVector pos = new PVector(random(200,width-200),random(200,height-200));
float r = 100;
int c = color(random(100,255),random(100,255),random(100,255),300);

Cell()
{
}

Cell(PVector pos,float r)
{
  this.pos = pos.copy();
  this.r = r;
 // this.c = c;
}

Cell mitosis()
{
  pos.x = pos.x+random(-r*0.5,r*0.5);
  pos.y = pos.y+random(-r*0.5,r*0.5);
  Cell cell = new Cell(pos,r*0.8); 
  return cell;
}

boolean clicked(float x,float y)
{
  float d = dist(pos.x,pos.y,x,y);
  if(d<r)
  return true;
  else
  return false;
}

void move(){
  PVector vel = PVector.random2D();
  pos.add(random(-10,10),random(-10,10));
}

void show()
{
  noStroke();
  fill(c);
  //translate(pos.x,pos.y,0);
  ellipse(pos.x,pos.y,r,r);
  //sphere(r);
}

}