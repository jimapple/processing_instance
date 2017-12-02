PImage img1;
 
void setup() {
  img1 = loadImage("/Users/Jimapple/Desktop/Rendering_white_01.png");
  size(img1.width, img1.height);
  smooth();
}
 
void draw() {
  image(img1, 0, 0);
  filter(GRAY);
}