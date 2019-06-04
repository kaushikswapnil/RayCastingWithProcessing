class Ray
{
   PVector m_StartPos;
   PVector m_Dir;
   
   Ray(float posX, float posY, float dirTheta)
   {
      m_StartPos = new PVector(posX, posY);
      m_Dir = PVector.fromAngle(dirTheta);
   }
   
   Ray(PVector start, PVector dir)
   {
     m_StartPos = start.get();
     m_Dir = dir.get();
   }
   
   void Display()
   {
       stroke(255, 0, 0);
       line(m_StartPos.x, m_StartPos.y, m_StartPos.x + (m_Dir.x * 30), m_StartPos.y + (m_Dir.y * 30));
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
           if (IsLesserWithEpsilon(distToContactPoint, record))
           {
               PVector relDirToTestPoint = PVector.sub(testPoint.m_Position, m_StartPos);
               relDirToTestPoint.normalize();
               
               if (IsEqualWithEpsilon(PVector.dot(relDirToTestPoint, m_Dir), 1))
               {
                  outPoint.SetPosition(testPoint.m_Position.x, testPoint.m_Position.y);
                  record = distToContactPoint; 
               }
           }
        }
      }
      
      return record < MAX_FLOAT;
   }
}
