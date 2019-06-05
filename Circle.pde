class Circle implements Shape
{
  PVector m_Center;
  float m_Radius;
  
  Circle(PVector center, float radius)
  {
     m_Center = center.get();
     m_Radius = radius;
  }

  boolean CheckIntersection(Ray ray, ContactPoint outPoint)
  {
    boolean foundPoint = false;
    
    PVector centerToRayStart = PVector.sub(ray.m_StartPos, m_Center);
    
    float a = PVector.dot(ray.m_Dir, ray.m_Dir);
    float b = 2 * PVector.dot(centerToRayStart, ray.m_Dir); 
    float c = PVector.dot(centerToRayStart, centerToRayStart) - (m_Radius * m_Radius);
    
    float discriminant = (b*b) - (4*a*c);
    
    if (IsGreaterOrEqualWithEpsilon(discriminant, 0))
    {
       discriminant = sqrt(discriminant);
       
       float t1 = (-b - discriminant)/(2*a);
       
       if (IsGreaterOrEqualWithEpsilon(t1, 0)) //<>//
       {
           float posX = ray.m_StartPos.x + (t1 * (ray.m_Dir.x));
           float posY = ray.m_StartPos.y + (t1 * (ray.m_Dir.y));
           outPoint.SetPosition(posX, posY);
           
           foundPoint = true;
       }
       else
       {
           float t2 = (-b + discriminant)/(2*a);
           
           if (IsGreaterOrEqualWithEpsilon(t2, 0))      
           {
             float posX = ray.m_StartPos.x + (t2 * (ray.m_Dir.x));
             float posY = ray.m_StartPos.y + (t2 * (ray.m_Dir.y));
             outPoint.SetPosition(posX, posY);
             
             foundPoint = true;
           }
       }
    }
    
    return foundPoint;
  }
   void Display()
   {
     stroke(255);
     noFill();
     ellipse(m_Center.x, m_Center.y, m_Radius*2, m_Radius*2);
   }
}
