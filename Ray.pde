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
       
   }
}
