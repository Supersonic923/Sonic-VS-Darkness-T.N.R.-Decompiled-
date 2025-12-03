#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.4

if instance_exists(objPlayer)
{
    x=objPlayer.x
    y=objPlayer.y
}
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndWaterSkid)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    x=objPlayer.x
    y=objPlayer.y
    if objPlayer.action=objPlayer.action_speed_tube
    image_angle=point_direction(x,y,xprevious,yprevious)-90
    if objPlayer.action!=objPlayer.action_waterfall && objPlayer.action!=objPlayer.action_speed_tube
    instance_destroy()
}
else
instance_destroy()
