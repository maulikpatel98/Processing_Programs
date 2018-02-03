boolean left1,left2;
boolean right1,right2;
boolean up1,up2;
boolean down1,down2;





Bullet b1 = new Bullet();

class Tank1{

PVector bodyPos = new PVector(100,100);
PVector barPos=new PVector(120,90);
float bodySize = 50;
PVector barSize = new PVector(10,10);


void show()
{
  noStroke();
  fill(0,255,0);
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
  up1 = true;
  down1 = false;
  left1 = false;
  right1= false;
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
  up1 = false;
  down1 = true;
  left1 = false;
  right1= false;
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
  up1 = false;
  down1 = false;
  left1 = true;
  right1= false;
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
  up1 = false;
  down1 = false;
  left1 = false;
  right1= true;
  }
  
}

void fire(Tank2 t)
{ if(left1||right1)
  b1.pos = new PVector( barPos.x-(2.5),barPos.y+5);
  if(up1||down1)
  b1.pos = new PVector( barPos.x+(5),barPos.y+4);
  else
  b1.pos = new PVector( barPos.x-(2.5),barPos.y+5);
  while(true){
    if(left1){b1.pos.x-=1;}
    else if(right1){b1.pos.x+=1;}
    else if(up1){b1.pos.y-=1;}
    else if(down1){b1.pos.y+=1;}
  
  if(b1.pos.x>width||b1.pos.x<0||b1.pos.y>height||b1.pos.y<0||
  (b1.pos.x>t.bodyPos.x&&b1.pos.x<t.bodyPos.x+t.bodySize&&
  b1.pos.y>t.bodyPos.y&&b1.pos.y<t.bodyPos.y+t.bodySize))break;
  //b1.pos.x+=4;
  b1.show();
}
}

}