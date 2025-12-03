//instance_nearest_ext(x,y,obj)

var inst,dis,tar;
inst=noone;
for(i = 0; i < instance_number(argument2); i += 1)
{
tar=instance_find(argument2,i)
if distance_to_point(tar.x,tar.y)<400 && ((x+50<tar.x && animation_direction=1) || (x-50>tar.x && animation_direction=-1))
inst=tar
}
return inst;
