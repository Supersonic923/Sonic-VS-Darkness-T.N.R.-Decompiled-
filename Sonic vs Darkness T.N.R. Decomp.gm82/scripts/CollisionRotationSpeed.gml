//CollisionRotationSpeed
var a;
a = angle_difference(point_direction(x-hspeed,y-vspeed,other.x-other.hspeed,other.y-other.vspeed),point_direction(x,y,other.x,other.y))
m_RotSpeed-=a*other.m_Mass/(m_Mass);
a = angle_difference(point_direction(other.x-other.hspeed,other.y-other.vspeed,x-hspeed,y-vspeed),point_direction(other.x,other.y,x,y))
other.m_RotSpeed-=a*m_Mass/(other.m_Mass);
