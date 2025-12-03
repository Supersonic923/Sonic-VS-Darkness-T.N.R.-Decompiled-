//instance_nearest_ext(x,y,obj)

var inst,dis,tar;
inst=noone;
for(i = 0; i < instance_number(argument2); i += 1)
{
tar=instance_find(argument2,i)
if distance_to_point(tar.x,tar.y)<400 && ((objPlayer.x+50<tar.x && objPlayer.animation_direction=1) || (objPlayer.x-50>tar.x && objPlayer.animation_direction=-1))
&& !collision_line(x,y,tar.x,tar.y,objSolid,true,true){
inst=instance_nth_nearest(x,y,tar,i)
return inst;
exit;}
}
if inst=noone
return -1;
