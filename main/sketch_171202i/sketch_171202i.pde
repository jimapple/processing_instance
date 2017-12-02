void setup(){
    size(400, 400);
    noStroke();

    ellipseMode(CENTER);
    smooth();
}

void draw(){
    background(0);
    float i=random(200);
    float j=random(200);
    ellipse(300,300,i,j);
}