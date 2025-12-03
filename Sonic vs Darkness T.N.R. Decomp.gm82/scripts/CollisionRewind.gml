//CollisionRewind(factor)
//CollisionRewind(1) is standard for AI, .5 for smoother
//call in collision event
//objects should have am_Mass variable, >0 Could be pounds or kg
//pushes each other out of the way while moving each other out of contact
//Origins must be centered
//argument0 is the max rewind step (4 for fast, .5 for slow and accurate)

//if!(place_meeting( x,y,other.id)) return 0;
var a,xoff1,yoff1,xoff2,yoff2,maxcheck;
//a = point_direction( x,y,other.x,other.y)
//xoff = lengthdir_x( argument0,a);
//yoff = lengthdir_y( argument0,a);
var om,mm;
om = other.m_Mass/m_Mass;
mm = m_Mass/other.m_Mass;
var mag; mag=sqrt((om*om)+(mm*mm))
om/=mag;
mm/=mag;
mag = (sqr(other.hspeed)+sqr(other.vspeed)+sqr(hspeed)+sqr(vspeed))
if(mag<=0) return 0;
xoff1 = hspeed/mag * om * argument0;
yoff1 = vspeed/mag * om* argument0;
xoff2 = other.hspeed/mag * mm* argument0;
yoff2 = other.vspeed/mag * mm* argument0;

maxcheck = ((speed+other.speed)/argument0)*2 + 1;
while( place_meeting( x,y,other.id) and maxcheck>=0)
{
    x -= xoff1 * om;
    y -= yoff1 * om;
    other.x += xoff2 * mm;
    other.y+=yoff2 * mm;
    maxcheck-=1;
}
return maxcheck>=0;
