;interface Shape
{
   boolean CheckIntersection(Ray ray);
   void Display();
}

class Line implements Shape
{
  PVector m_Start, m_End;
  
  Line(PVector start, PVector end)
  {
     m_Start = start.get();
     m_End = end.get();
  }
  
  boolean CheckIntersection(Ray ray)
  {
    
  }
  
  void Display()
  {
     stroke(255);
     line(m_Start.x, m_Start.y, m_End.x, m_End.y);
  }
}
