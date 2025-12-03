#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.7
if instance_exists(objPlayer)
{
image_angle=objPlayer.angle
image_xscale=objPlayer.animation_direction
}
if global.specialfx=1
visible=false
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
