#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
loop=true
image_speed=.7
delay=30
wave=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=objSonic
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=16765440
arg5=1
*/
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
s=instance_create(x,y,objSuperSpinDashEnd)
s.image_angle=image_angle
s.image_xscale=image_xscale
sound_stop(sndSpinDashLp)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if loop=true{
if !sound_isplaying(sndSpinDashLp)
sound_loop(sndSpinDashLp)
sound_volume(sndSpinDashLp,1)
loop=false}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=objPlayer
invert=0
arg0=action!=action_spindash && action!=action_spindash_boost
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
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
    if image_xscale=1
    x=objPlayer.x-8
    else
    x=objPlayer.x+8
    y=objPlayer.y+14
}
