import spout.*;

PGraphics canvas; 

//save the touched sqaures 
int[] touchedRectX;
int[] touchedRectY;

//little square size
int size = 40;

// DECLARE A SPOUT OBJECT
Spout spout;

void setup() {
  
  touchedRectX = new int[25];
  touchedRectY = new int[25];
  
  // Initial window size
  size(640, 360, P3D);
  textureMode(NORMAL);
  
  // Create a graphics object
  canvas = createGraphics(1280, 720, P3D);
  
  // CREATE A NEW SPOUT OBJECT
  spout = new Spout(this);
  
  // CREATE A NAMED SENDER
  spout.createSender("Spout Processing");
  
} 

void draw()  { 

    background(0);
    noStroke();
    
    canvas.beginDraw();
    canvas.lights();
    canvas.background(0);
    canvas.fill(255,0,0);
    canvas.circle(mouseX, mouseY, 10);
    createSquares(canvas);
    createTouchedRects(canvas);
    canvas.endDraw();
    spout.sendTexture(canvas);
    
}

void createSquares(PGraphics pgr)
{
  int counter = 0;
  for(int i=0; i<5; i++)
  {
    for(int j=0; j<5; j++)
    {
      int x = 40*i+25*i+100;
      int y = 40*j+25*j+100;
      
      if(mouseX > x && mouseX < x + size && mouseY > y && mouseY < y + size)
      {
        pgr.fill(255,0,0);
        pgr.rect(x,y,size,size,7);
        touchedRectX[counter] = x;
        touchedRectY[counter] =y;
        
      }
      counter++;
    }
  }
}

void createTouchedRects(PGraphics pgr)
{
    int counter = 0;
  for(int i=0; i<5; i++)
  {
    for(int j=0; j<5; j++)
    {
        pgr.fill(255,0,0);
        pgr.rect(touchedRectX[counter],touchedRectY[counter],size,size,7);
        counter++;
    }
  }
}
