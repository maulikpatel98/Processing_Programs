

Bullet b2 = new Bullet();
class Tank2{

PVector bodyPos = new PVector(700,500);
PVector barPos=new PVector(720,490);
float bodySize = 50;
PVector barSize = new PVector(10,10);


void show()
{
  noStroke();
  fill(255,0,0);
  rect(bodyPos.x,bodyPos.y,bodySize,bodySize);
  rect(barPos.x,barPos.y,barSize.x,barSize.y);  
}
void UP()
{
  if(barPos.y>0){
  barPos.x=bodyPos.x+20;
  barPos.y=bodyPos.y-10;
  bodyPos.y-=3;
  barPos.y-=3;  
  //show();
  up2 = true;
  down2 = false;
  left2 = false;
  right2= false;
  }
  
}
void DOWN()
{  
  if(barPos.y<height){
  barPos.x=bodyPos.x+20;
  barPos.y=bodyPos.y+50;
  bodyPos.y+=3;
  barPos.y+=3;
  //show();
  up2 = false;
  down2 = true;
  left2 = false;
  right2= false;
  }
  
}
void LEFT()
{
  if(barPos.x>0){
  barPos.x=bodyPos.x-10;
  barPos.y=bodyPos.y+20;
  bodyPos.x-=3;
  barPos.x-=3;
  //show();
  up2 = false;
  down2 = false;
  left2 = true;
  right2= false;
  }
}
void RIGHT()
{
  if(barPos.x<width){
  barPos.x=bodyPos.x+50;
  barPos.y=bodyPos.y+20;
  bodyPos.x+=3;
  barPos.x+=3;
  //show();
  up2 = false;
  down2 = false;
  left2 = false;
  right2= true;
  }
  
}

void fire( Tank1 t )
{
  //println("ggg");
  if(left2||right2)
  b2.pos = new PVector( barPos.x-(2.5),barPos.y+5);
  if(up2||down2)
  b2.pos = new PVector( barPos.x+(5),barPos.y+4);
  else
  b2.pos = new PVector( barPos.x-(2.5),barPos.y+5);
  while(true){
    if(left2){b2.pos.x-=1;}
    else if(right2){b2.pos.x+=1;}
    else if(up2){b2.pos.y-=1;}
    else if(down2){b2.pos.y+=1;}
  
  if(b2.pos.x>width||b2.pos.x<0||b2.pos.y>height||b2.pos.y<0||
  (b2.pos.x>t.bodyPos.x&&b2.pos.x<t.bodyPos.x+t.bodySize&&
  b2.pos.y>t.bodyPos.y&&b2.pos.y<t.bodyPos.y+t.bodySize))break;
  //b1.pos.x+=4;
  b2.show();
}
}

}