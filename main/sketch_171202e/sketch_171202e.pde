// Particle Swarm Optimization
int numParticles = 200;
int iteration = 0;
float dimension = 500;
Swarm mySwarm = new Swarm();
 
void setup() {
  background(255);
  fill(0);
  size(500,500);
  smooth();
}
 
void draw() {
  background(255); // remove for trails
  mySwarm.run();
  if ((iteration++ % 10) == 0) mySwarm.showGlobalBest();
}

class Particle {
 
  float locX, locY;
  float velX = 0.0, velY = 0.0;
  float fitness = 0.0;
  float bestFitness = -10.0;
  float pbestX = 0.0, pbestY = 0.0; // Best particle solution
  float vMax = 10.0; // Max velocity
  float dt = 0.1;    // Used to constrain changes to each particle
 
  Particle() {
    locX = random( dimension );
    locY = random( dimension );
  }
 
  void calculateFitness() {
    // Clip the particles
    if ((locX < 0) || (locX > dimension) || 
        (locY < 0) || (locY > dimension)) fitness = 0;
    else {
      // Calculate fitness based on the sombrero function.
      float x = locX - (dimension / 2);
      float y = locY - (dimension / 2);
      float r = sqrt( (x*x) + (y*y) );
      fitness = (sin(r)/r);
    }
  
    // Maintain the best particle solution
    if (fitness > bestFitness) {
      pbestX = locX; pbestY = locY;
      bestFitness = fitness;
    }
  }
   
  void update( float gbestX, float gbestY, float c1, float c2 ) {
    // Calculate particle.x velocity and new location
    velX = velX + (c1 * random(1) * (gbestX - locX)) + 
                  (c2 * random(1) * (pbestX - locX));
    if (velX > vMax) velX = vMax;
    if (velX < -vMax) velX = -vMax;
    locX = locX + velX*dt;
 
    // Calculate particle.y velocity and new location
    velY = velY + (c1 * random(1) * (gbestY - locY)) + 
                  (c2 * random(1) * (pbestY - locY));
    if (velY > vMax) velY = vMax;
    if (velY < -vMax) velY = -vMax;
    locY = locY + velY*dt;
  }
   
  void show() {
    point( (int)locX, (int)locY);
  }
   
  float pFitness() {
    return fitness;
  }
   
  float xLocation() {
    return locX;
  }
   
  float yLocation() {
    return locY;
  }
 
}

class Swarm {
 
  float gbestX = 0.0, gbestY = 0.0;   // Global best solution
  float c1 = 0.1, c2 = 2.0;           // Learning factors
 
  Particle swarm[];
 
  Swarm() {
    swarm = new Particle[numParticles];
    for (int i = 0 ; i < numParticles ; i++) {
      swarm[i] = new Particle();
    }
  }
   
  void run() {
    // Calculate each particle's fitness
    for (int i = 0 ; i < numParticles ; i++) {
      swarm[i].calculateFitness();
    }
     
    findGlobalBest();
     
    // Update each particle and display it.
    for (int i = 0 ; i < numParticles ; i++) {
      swarm[i].update( gbestX, gbestY, c1, c2 );
      swarm[i].show();
    }
  }
   
  void findGlobalBest() {
    float fitness = -10.0;
    for (int i = 0 ; i < numParticles ; i++) {
      if (swarm[i].pFitness() > fitness) {
        gbestX = swarm[i].xLocation(); gbestY = swarm[i].yLocation();
        fitness = swarm[i].pFitness();
      }
    }
  }
   
  void showGlobalBest() {
    println("Best Particle Result: " + gbestX + " " + gbestY);
  }
   
}