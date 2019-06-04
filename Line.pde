class Line implements Shape
{
  PVector m_Start, m_End;
  
  Line(PVector start, PVector end)
  {
     m_Start = start.get();
     m_End = end.get();
  }
  
  boolean CheckIntersection(Ray ray, ContactPoint outPoint)
  {
    float x1 = ray.m_StartPos.x;
    float y1 = ray.m_StartPos.y;
    
    float x2 = ray.m_StartPos.x + ray.m_Dir.x;
    float y2 = ray.m_StartPos.y + ray.m_Dir.y;
    
    float x3 = m_Start.x;
    float y3 = m_Start.y;
    
    float x4 = m_End.x;
    float y4 = m_End.y;
    
    float denom = ((x1 - x2)*(y3 - y4)) - ((y1 - y2)*(x3 - x4));
    
    if (!IsNullWithEpsilon(denom))
    {
      float t = (((x1 - x3)*(y3 - y4)) - ((y1 - y3)*(x3 - x4)))/denom;
      float u = -(((x1 - x2)*(y1 - y3)) - ((y1 - y2)*(x1 - x3)))/denom;
      
      if ((t < 1.0 && t > 0.0) || (u < 1.0 && u > 0.0))
      {
        float posX = x1 + t*(x2 - x1);
        float posY = y1 + t*(y2 - y1);
        outPoint.SetPosition(posX, posY);
        
        return true;
      }      
    }
    
    return false;
  }
  
  void Display()
  {
     stroke(255);
     line(m_Start.x, m_Start.y, m_End.x, m_End.y);
  }
}
