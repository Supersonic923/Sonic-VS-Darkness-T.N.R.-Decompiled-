#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.7
sound_loop(sndWaterSkid)
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
applies_to=objPlayer
*/
if (action!=action_surf)
with objSurfSkid
instance_destroy()

if (animation="surfjump")
with objSurfSkid
instance_destroy()

if slide=true
with objSurfSkid
instance_destroy()
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
