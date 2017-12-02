//void setup(){
    //size(200, 200);
    //rect(0, 0, 50, 50);
    //translate(100, 100);
    //rect(0, 0, 50, 50);
    
    //size(200, 200);
    //rect(0, 0, 50, 50);
    //translate(75, 75);
    //scale(2.0);
    //rect(0, 0, 50, 50);
    
    //size(200, 200);
    //rect(100, 100, 50, 50);
    //rotate(PI/16);
    //rect(100, 100, 50, 50);
    
    //size(200, 200);
    //rect(100, 100, 50, 50);
    //translate(100, 100); //系统坐标转换
    //rotate(PI/16);
    //rect(0, 0, 50, 50);
    
    //size(200, 200);
    //rectMode(CENTER);
    //rect(100, 100, 50, 50);
    //translate(100, 100);
    //rotate(PI/16);
    //rect(0, 0, 50, 50);
    
    //size(200, 200);
    //rectMode(CENTER);
    //noFill();
    //translate(100, 100);
     
    //for (int i = 1 ; i < 16 ; i++) {
    //    rotate((PI/16)*i);
    //    rect(0, 0, 100, 100);
    //}
    
    //size(200, 200);
    //rectMode(CENTER);
    //noFill();
    //smooth();
    //strokeWeight(2);//加粗
    //colorMode(RGB, 100);
     
    //pushMatrix();
     
    //  translate(100, 100);
    //  pushMatrix();
     
        //rotate(PI/4);
        //pushMatrix();
     
        //  translate(20, 20);
        //  scale(2.0);
        //  stroke(255, 0, 0); // Red
        //  ellipse(0, 0, 50, 10);
     
        //popMatrix();
        //stroke(0, 255, 0); // Green
        //rect(0, 0, 50, 25);
     
    //  popMatrix();
    //  stroke(0, 0, 255); // Blue
    //  rect(0, 0, 75, 50);
     
    //popMatrix();
    //stroke(128, 128, 128); // Gray
    //rect(0, 0, 50, 50);
    
    //size(100, 100, P3D);
    //noFill();
    //translate(width/2, height/2);
    //box(20, 20, 20);
    
    //size(200, 200, P3D);
    //noFill();
    //smooth();
    
    //size(100, 100, P3D);
    //background(0);
    //noStroke();
    //pointLight(50, 100, 180, 80, 20, 40);
    //translate(20, 50, 0);
    //sphere(40);
//}

//void draw(){
//    background(0);
//    translate(width/2, height/2, -(width/2));
//    rotateY(map(mouseX, 0, width, -PI, PI));
//    stroke(100);
//    box(150);
//    rotateX(map(mouseY, 0, height, -PI, PI));
//    stroke(150);
//    box(75);
//}

float x, y, z;          // Current Position
float velocity = 120.0; // Muzzle velocity;
float alpha = 30.0;     // Angle from y-axis
float gamma = 60.0;     // Angle from x-axis
float g = 9.8;          // Acceleration due to gravity (m/s^2)
float time = 0.0;
float dt = 0.1;
float rotX = 0.0, rotY = 0.0;
 
void setup() {
  size(300, 400, P3D);
  smooth();
  x = 0.0; y = 0.0; z = 0.0;
}
 
 
void draw() {
  float b, Lx, Ly, Lz;
  time += dt;
   
  background(0);
   
  // Calculate cosines for the cannon orientation (static)
  b = cos((90.0-alpha) * 3.14/180.0);
  Lx = b * cos(gamma * 3.14/180.0);
  Ly = cos(alpha * 3.14/180.0);
  Lz = b * sin(gamma * 3.14/180.0);
  
  // Calculate the position of the box at the given time
  x = velocity * Lx * time;
  y = (cos(alpha*3.14/180.0)) + (velocity * Ly * time) - 
    (0.5 * g * time * time);
  z = velocity * Lz * time;
 
  // Rotate the box around the x- and y-axis.
  rotX += PI/256.0;
  rotY += PI/128.0;
 
  // Create two light sources (one blue and one red)
  pointLight(0, 100, 255, 0, 0, 0);
  pointLight(255, 0, 0, 400, 400, 0);
 
  println("x " + x + " y " + y + " z " + z );
 
  // Place the box in the display
  pushMatrix();
  translate(100, 400-y, -z);
  rotateX(rotX); rotateY(rotY);
  box(90);  
  popMatrix();
}