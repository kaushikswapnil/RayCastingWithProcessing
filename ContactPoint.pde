class ContactPoint
{
   PVector m_Position;
  
   ContactPoint(float x, float y)
   {
      m_Position = new PVector(x, y); 
   }
  
   ContactPoint(PVector position)
   {
       m_Position = position.get();
   }
}
