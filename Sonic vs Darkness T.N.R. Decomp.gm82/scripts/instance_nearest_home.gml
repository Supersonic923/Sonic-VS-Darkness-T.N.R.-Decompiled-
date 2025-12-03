var total;
var nearest;

if instance_exists(objHoming)
{
total = instance_number(objHoming); // Get total of homeable objects within region

for (i=0;i<total;i+=1)
{
nearest = instance_nth_nearest(x,y,objHoming,min(i,total)); // Check each instance one by one
if distance_to_point(nearest.x,nearest.y)<nearest.dst && (((animation_direction = 1 && x<nearest.x))||((animation_direction = -1 && x>nearest.x))) &&
!collision_line(x,y,nearest.x,nearest.y,objSolid,true,true) && (!collision_line(x,y,nearest.x,nearest.y,objPlatform,true,true) || (point_direction(x,y,nearest.x,nearest.y)>=0 &&
point_direction(x,y,nearest.x,nearest.y)<=180)) && !collision_line(x,y,nearest.x,nearest.y,objBridgeNode,true,true) &&
!collision_line(x,y,nearest.x,nearest.y,objWallJumpBlock,true,true) && !collision_line(x,y,nearest.x,nearest.y,objTargetBlocker,true,true) &&
!collision_line(x,y,nearest.x,nearest.y,objTargetBlockerV,true,true) && !collision_line(x,y,nearest.x,nearest.y,objPoleTwirl,true,true) &&
!collision_line(x,y,nearest.x,nearest.y,objParSpeedRing,true,true) && nearest.target=true &&
(((point_direction(x,y,nearest.x,nearest.y)>=310 && point_direction(x,y,nearest.x,nearest.y)<=360)||(point_direction(x,y,nearest.x,nearest.y)>=0 && point_direction(x,y,nearest.x,nearest.y)<=50))
|| (point_direction(x,y,nearest.x,nearest.y)>=130 && point_direction(x,y,nearest.x,nearest.y)<=230))
return nearest; // If conditions return true, return the homeable object
}
 return false; // If none of the homeable object can be targeted, return false
}
else
return false;
