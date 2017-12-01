Drop[] drops;
int numDrops = 30;
int curDrop = 0;
 
void setup() { //<>//
  size(400, 400);
  ellipseMode(CENTER);
  smooth();
  drops = new Drop[numDrops]; //<>//
  for (int i = 0 ; i < numDrops ; i++) {
    drops[i] = new Drop(); //<>//
    drops[i].diameter = 0;
  }
}
 
void draw() {
  background(0);
  for (int i = 0 ; i < numDrops ; i++) {
      drops[i].spread();
      drops[i].show();
  }
}
 
void mousePressed() {
  drops[curDrop].init( mouseX, mouseY );
  if (++curDrop == numDrops) curDrop = 0;
}
class Drop {
 
  int x, y;     // Coordinate (center of circle)
  int diameter;     // Diameter of circle (unused == 0).
   
  void init( int ix, int iy ) {
   x = ix;
   y = iy;
   diameter = 1;
  }
   
  void spread() {
    if (diameter > 0) diameter += 1;
  }
   
  void show() {
    if (diameter > 0) {
      ellipse( x, y, diameter, diameter );
      if (diameter > 500) diameter = 0;
    }
  }
   
}