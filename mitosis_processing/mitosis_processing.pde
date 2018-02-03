import processing.sound.*;


ArrayList<Cell> cells = new ArrayList<Cell>();


void setup()
{
  
  size(1000,600,P3D);
  //for(int i=0;i<cells.length;i++){
  //cells[i]= new Cell();
  //}
  cells.add(new Cell());
  SoundFile s = new SoundFile(this,"jugnoo.mp3");
  s.play();
}


void draw()
{
  lights();
  background(51);
  for(int i=0;i<cells.size();i++){
  lights();
  cells.get(i).move();
  cells.get(i).show();
  }
}

void mousePressed()
{ 
  for(int i=cells.size()-1;i>=0;i--){
  if(cells.get(i).clicked(mouseX,mouseY)){
  
    Cell cellA = cells.get(i).mitosis();
    Cell cellB = cells.get(i).mitosis();
    //Cell cellC = cells.get(i).mitosis();
    //Cell cellD = cells.get(i).mitosis();
    
    cells.add(cellA);
    cells.add(cellB);
    //cells.add(cellC);
    //cells.add(cellD);
    cells.remove(i);
    //println("sadasd");
  }
  }
}