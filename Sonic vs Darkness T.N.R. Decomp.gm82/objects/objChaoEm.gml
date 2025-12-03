#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objShadowChao)
image_index=1
else
image_index=0

image_speed=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objChao)//{
//if distance_to_point(objChao.x-2,objChao.y-10)>1
move_towards_point(objChao.x-2,objChao.y-10,point_distance(x,y,objChao.x,objChao.y) * .5)
//else
///motion_set(0,0)}
