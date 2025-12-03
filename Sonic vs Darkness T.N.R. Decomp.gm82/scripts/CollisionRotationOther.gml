var a;
//a = angle_difference(point_direction(xprevious,yprevious,other.xprevious,other.yprevious),point_direction(x,y,other.x,other.y))
//m_RotSpeed-=a*other.m_Mass/(m_Mass);
a = angle_difference(point_direction(other.xprevious,other.yprevious,xprevious,yprevious),point_direction(other.x,other.y,x,y))
other.m_RotSpeed-=a*m_Mass/(other.m_Mass);
