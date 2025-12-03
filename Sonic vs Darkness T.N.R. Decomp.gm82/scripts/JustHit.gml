//returns if the objects just hit
var hitnow; hitnow = place_meeting(x,y,other);
if(!hitnow) return false;

var x1,y1,x2,y2;
x1 = x;
y1 = y;
x2 = other.x;
y2 = other.y;
x = xprevious;
y = yprevious;
other.x = other.xprevious;
other.y = other.yprevious;

var hitthen; hitthen = place_meeting(x,y,other);

x = x1;
y = y1;
other.x = x2;
other.y = y2;

return !hitthen;
