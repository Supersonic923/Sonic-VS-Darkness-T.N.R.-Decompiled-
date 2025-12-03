#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

if !instance_exists(objConveyorSound)
instance_create(x+65,y,objConveyorSound)

if !variable_local_exists("reverse")
reverse=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if reverse=true
image_index = -(global.motion_time)*.03;
else
image_index = (global.motion_time)*.03;
