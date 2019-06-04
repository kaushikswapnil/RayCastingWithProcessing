ArrayList<Shape> obstacles;
Particle particle;

void setup()
{
  size(800, 800);
  
  obstacles = new ArrayList<Shape>();
  
  int numObs = (int)random(3, 10);
  
  for (int iter = 0; iter < numObs; ++iter)
  {
     obstacles.add(new Line(new PVector(random(width), random(height)), new PVector(random(width), random(height)))); 
  }
  
  particle = new Particle(width/2, height/2, 10, 10, 300);
}

void draw()
{
   background(0); 
   
   particle.m_Position.x = mouseX;
   particle.m_Position.y = mouseY;
   
   particle.Display();
   
   particle.Update(obstacles);
   
   for (Shape shape : obstacles)
   {
      shape.Display(); 
   }
}
