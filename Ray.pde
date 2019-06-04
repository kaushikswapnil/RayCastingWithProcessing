class Ray
{
   PVector m_StartPos;
   PVector m_Dir;
   
   Ray(float posX, float posY, float dirX, float dirY)
   {
      m_StartPos = new PVector(posX, posY);
      m_Dir = new PVector(dirX, dirY);
   }
   
   Ray(PVector start, PVector dir)
   {
     m_StartPos = start.get();
     m_Dir = dir.get();
   }
   
   void Display()
   {
       stroke(255);
       line(m_StartPos.x, m_StartPos.y, m_StartPos.x + (m_Dir.x * 10), m_StartPos.y + (m_Dir.y * 10));
   }
   
   boolean Cast(ArrayList<Shape> shapes, ContactPoint outPoint)
   {
      float record = MAX_FLOAT;
      
      ContactPoint testPoint = new ContactPoint(0, 0);
      
      for (Shape shape : shapes)
      {
        if (shape.CheckIntersection(this, testPoint))
        {
           float distToContactPoint = PVector.dist(m_StartPos, testPoint.m_Position);
           if (distToContactPoint < record)
           {
               outPoint.SetPosition(testPoint.m_Position.x, testPoint.m_Position.y);
               record = distToContactPoint;
           }
        }
      }
      
      return record < MAX_FLOAT;
   }
}
