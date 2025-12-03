//Move objects away but not compltely out of contact, one unit of movement
var a,xoff,yoff;
a = point_direction( x,y,other.x,other.y)
xoff = lengthdir_x( argument0,a);
yoff = lengthdir_y( argument0,a);
Normalize(m_Mass, other.m_Mass)
    x -= xoff*__n2;
    y -= yoff*__n2;
    other.x += xoff*__n1;
    other.y+=yoff*__n1;
