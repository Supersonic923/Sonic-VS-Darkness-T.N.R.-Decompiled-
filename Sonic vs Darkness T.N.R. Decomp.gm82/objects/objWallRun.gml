#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if abs(objPlayer.x_speed)<=5 || objPlayer.y>y+84 || objPlayer.ground=false
mask_index=nomask
else
mask_index=-1
}
