#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
v=instance_create(x,y-8,objNIGHTFirework)
if !variable_local_exists("angle")
v.angle=0
else
v.angle=angle

if !variable_local_exists("timer")
v.timer=70
else
v.timer=timer
