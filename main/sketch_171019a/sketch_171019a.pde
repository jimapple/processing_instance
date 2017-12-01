void setup(){

size(400, 400);

}

 

void draw(){

background(#FFEE31);

pushMatrix();

translate(200, 200 - 60);

//eyes

PVector mouse = new PVector(mouseX, mouseY);

mouse.sub(200, 200 - 60, 0);

mouse.limit(7);

fill(0);

noStroke();

rectMode(CENTER);

rect(-1*40+mouse.x, -15+mouse.y, 15, 25, 8);

if(mousePressed)

rect(40+mouse.x, -15+mouse.y, 28, 10, 5);

else

rect(40+mouse.x, -15+mouse.y, 15, 25, 8);

//mouth

noFill();

strokeWeight(12);

stroke(0);

arc(0, 0, 150, 120, PI/4, PI-PI/4);

popMatrix();

//text

textSize(25);

textAlign(CENTER);

text("Enjoy your hacking with\nProcessing!", width/2, height/2+100);

}