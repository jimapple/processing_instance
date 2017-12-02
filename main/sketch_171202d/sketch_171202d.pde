void setup() {
  size(400, 400);
  smooth();
}
 
void draw() {
  PImage img1 = loadImage("/Users/Jimapple/Downloads/IMG_5801.JPG");
  PImage img2 = loadImage("/Users/Jimapple/Downloads/IMG_5802.JPG");
  img1.blend( img2, 0, 0, 400, 400, 0, 0, 400, 400, ADD );
  image(img1, 0, 0);
}