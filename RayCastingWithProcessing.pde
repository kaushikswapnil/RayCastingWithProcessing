ArrayList<Shape> obstacles;
Particle particle;

void setup()
{
  size(800, 800);
  
  obstacles = new ArrayList<Shape>();
  
  int numObs = (int)random(5, 20);
  
  for (int iter = 0; iter < numObs; ++iter)
  {
     obstacles.add(new Line(new PVector(random(width), random(height)), new PVector(random(width), random(height)))); 
  }
  
  obstacles.add(new Line(new PVector(0, 0), new PVector(0, height)));
  obstacles.add(new Line(new PVector(0, 0), new PVector(width, 0)));
  obstacles.add(new Line(new PVector(width, 0), new PVector(width, height)));
  obstacles.add(new Line(new PVector(0, height), new PVector(width, height)));
  
  particle = new Particle(width/2, height/2, 10, 10, 500);
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

boolean IsNullWithEpsilon(float value)
{
  return abs(value - 0.0) <= EPSILON;
}

boolean IsGreaterWithEpsilon(float a, float b)
{
  return (a - b) > EPSILON;
}

boolean IsLesserWithEpsilon(float a, float b)
{
  return (a - b) < EPSILON;
}

boolean IsEqualWithEpsilon(float a, float b)
{
  return IsNullWithEpsilon(a-b); 
}
