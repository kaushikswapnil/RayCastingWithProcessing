ArrayList<Shape> obstacles;
Particle particle;

void setup()
{
  size(800, 800);
  
  Reset();
}

void draw()
{
   background(0); 
   
   //particle.m_Position.x = mouseX;
   //particle.m_Position.y = mouseY;
   
   particle.Display();
   
   particle.Update(obstacles);
   
   //for (Shape shape : obstacles)
   //{
      //shape.Display(); 
   //}
}

void keyPressed()
{
   if(key == 'r' || key == 'R')
   {
      Reset(); 
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

boolean IsGreaterOrEqualWithEpsilon(float a, float b)
{
   return IsGreaterWithEpsilon(a, b) || IsEqualWithEpsilon(a, b); 
}

boolean IsLesserOrEqualWithEpsilon(float a, float b)
{
   return IsLesserWithEpsilon(a, b) || IsEqualWithEpsilon(a, b); 
}

void Reset()
{
  obstacles = new ArrayList<Shape>();
  
  int numObs = (int)random(5, 20);
  
  for (int iter = 0; iter < numObs; ++iter)
  {
     if (random(2) - 1 < 0)
     {
       obstacles.add(new Line(new PVector(random(width), random(height)), new PVector(random(width), random(height))));
     }
     else
     {
       obstacles.add(new Circle(new PVector(random(width), random(height)), random(10, 80)));
       //obstacles.add(new Circle(new PVector(width - 50, height/2), 50));//random(10, 80)));
     }
  }
  
  obstacles.add(new Line(new PVector(0, 0), new PVector(0, height)));
  obstacles.add(new Line(new PVector(0, 0), new PVector(width, 0)));
  obstacles.add(new Line(new PVector(width, 0), new PVector(width, height)));
  obstacles.add(new Line(new PVector(0, height), new PVector(width, height)));
  
  particle = new Particle(width/2, height/2, 20, 1000);
}
