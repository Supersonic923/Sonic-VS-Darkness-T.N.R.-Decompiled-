#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
if !variable_local_exists("reverse")
reverse=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if reverse=true
image_index = (global.motion_time)*.02;
else
image_index = -(global.motion_time)*.02;
