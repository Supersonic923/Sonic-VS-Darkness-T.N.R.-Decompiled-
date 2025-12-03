#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.sound_fan=0{
global.sound_fan=1
if !instance_exists(objFanSound)
instance_create(x,y,objFanSound)}
image_speed=.4
