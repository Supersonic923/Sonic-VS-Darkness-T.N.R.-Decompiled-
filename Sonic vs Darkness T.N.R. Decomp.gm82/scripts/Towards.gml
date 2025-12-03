//returns if the objects are moving towards each other
var d1; d1 = point_distance(xprevious,yprevious,other.xprevious,other.yprevious)
var d2; d2 = point_distance(x,y,other.x,other.y)
return (d1>d2) && ((d1-d2)<200)
