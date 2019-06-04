class Particle
{
   PVector m_Position;
   PVector m_Dimensions;
   
   ArrayList<Ray> m_Rays;
   
   Particle(float posX, float posY, float dimX, float dimY, int numRays)
   {
     m_Position = new PVector(posX, posY);
     m_Dimensions = new PVector(dimX, dimY);
     
     m_Rays = new ArrayList<Ray>();
     
     float angleIncrement = TWO_PI/numRays;
     
     for(float iter = 0; iter < TWO_PI; iter += angleIncrement)
     {
        m_Rays.add(new Ray(m_Position, PVector.fromAngle(iter))); 
     }
   }
   
   Particle(PVector pos, PVector dimensions, int numRays)
   {
     m_Position = pos.get();
     m_Dimensions = dimensions.get();
     
     m_Rays = new ArrayList<Ray>();
     
     float angleIncrement = TWO_PI/numRays;
     
     for(int iter = 0; iter < TWO_PI; iter += angleIncrement)
     {
        m_Rays.add(new Ray(m_Position, PVector.fromAngle(iter))); 
     }
   }
   
   void Display()
   {
      ellipse(m_Position.x, m_Position.y, m_Dimensions.x, m_Dimensions.y);
   }
   
   void UpdatePos()
   {
      m_Position.x = mouseX;
      m_Position.y = mouseY;
      
      for (Ray ray : m_Rays)
      {
         ray.m_StartPos.x = m_Position.x;
         ray.m_StartPos.y = m_Position.y;
      }
   }
   
   void Update(ArrayList<Shape> shapes)
   {
      UpdatePos();
     
      Display(); 
     
      for (Ray ray : m_Rays)
      {
         ContactPoint contactPoint = new ContactPoint(0, 0);
         if (ray.Cast(shapes, contactPoint))
         {
           stroke(255, 60);
           line(m_Position.x, m_Position.y, contactPoint.m_Position.x, contactPoint.m_Position.y);
         }
      }
   }
}
