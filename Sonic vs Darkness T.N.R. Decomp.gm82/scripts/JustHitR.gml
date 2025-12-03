///returns if the objects just hit with rotation

var hitnow; hitnow = place_meeting(x,y,other);
if(!hitnow) return false;

var x1,y1,x2,y2,a1,a2;
x1 = x;
y1 = y;
a1 = image_angle;
x2 = other.x;
y2 = other.y;
a2 = other.image_angle;
x = xprevious;
y = yprevious;
image_angle = m_OldAngle;
other.x = other.xprevious;
other.y = other.yprevious;
other.image_angle = other.m_OldAngle;

var hitthen; hitthen = place_meeting(x,y,other);

x = x1;
y = y1;
image_angle = a1;
other.x = x2;
other.y = y2;
other.image_angle = a2;

return !hitthen;
