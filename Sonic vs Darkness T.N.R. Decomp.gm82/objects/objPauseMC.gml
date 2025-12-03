#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=sprPauseMC
image_index=0
image_speed=.2
if !instance_exists(objPauseNavC)
instance_create(x,y,objPauseNavC)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index=1{
image_speed=0}
