#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.4
sound_loop(sndWaterSkid)

if instance_exists(objPlayer)
{
    image_xscale=objPlayer.animation_direction
    image_angle=objPlayer.angle
    x=objPlayer.x
    y=objPlayer.y+18
}
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndWaterSkid)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
if (action!=action_skid && action!=action_skid2 && action!=action_rolling && animation!="slide" && animation!="sprinting" && animation!="spinboost" && animation!="crouch_slide"
&& animation!="running" && animation!="sprinting" && action!=action_surf && animation!="surf" && animation!="surfduck")//||abs(x_speed)<18
with objWaterSkidL
instance_destroy()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    image_xscale=objPlayer.animation_direction
    image_angle=objPlayer.angle
    x=objPlayer.x
    y=objPlayer.y+18
}
else
instance_destroy()
