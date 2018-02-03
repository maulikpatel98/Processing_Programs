boolean[] keys = new boolean[255];

void keyPressed() {
  keys[keyCode] = true;
}

void keyReleased() {
  keys[keyCode] = false;
}
int x = 3;
int y = 3;
PFont f ;
Tank1 tank1 = new Tank1();
Tank2 tank2 = new Tank2();
void setup()
{
  //size(800,600);
  fullScreen();
  f = createFont("Comic Sans MS",64,true); 
  
  
}
void draw()
{
  background(0);
  if(frameCount<200){
  textFont(f);
  textAlign(CENTER);
  fill(255,0,255);
  text("TANKS",width/2,height/2);
  }
  if(frameCount>200){
    fill(0,115,255);
  textFont(f,60-y);
  text("TANKS",width/2,height/2-x);
  if(x<height/2-80)
  x+=2;
  
  y+=0.5;
  tank1.show();
  tank2.show();
  updatePlayers();
  }
}




void updatePlayers() {
  
 for(int i = 0; i < 255; i++) {
    if(keys[i]) { 
      if (i == 87)      { tank1.UP(); }
      else if (i == 65) { tank1.LEFT(); }
      else if (i == 83) { tank1.DOWN();  }
      else if (i == 68) { tank1.RIGHT();  }
      if (i == 38)      { tank2.UP(); }
      else if (i == 37) { tank2.LEFT(); }
      else if (i == 40) { tank2.DOWN();  }
      else if (i == 39) { tank2.RIGHT();  }
      else if (i == 32) { tank1.fire(tank2); }
      else if (i == 101 || i == 44) { tank2.fire(tank1); }
      
    } 
  }
}