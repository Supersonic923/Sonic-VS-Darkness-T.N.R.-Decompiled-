#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0;
image_alpha=1
image_blend=c_green
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha-=.025 //or .1 or .075 or .025 or whatever
if image_alpha<=0 {instance_destroy()}
