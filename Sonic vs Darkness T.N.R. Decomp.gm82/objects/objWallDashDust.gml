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
ia=0
ix=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
s=instance_create(x,y,objWallDustEnd)
s.image_angle=ia
s.image_xscale=ix
sound_stop(sndSpinDashLp)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_direct(ord('A')){
if sprite_index!=sprSpinDashDust
sprite_index=sprSpinDashDust
if loop=true{
if !sound_isplaying(sndSpinDashLp)
sound_loop(sndSpinDashLp)
sound_volume(sndSpinDashLp,1)
loop=false}}

if keyboard_check_pressed(ord('A'))
wave=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=objPlayer
invert=0
arg0=animation!="chargewall"
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
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
    if image_xscale=1
    image_angle=objPlayer.angle+90
    else
    image_angle=objPlayer.angle-90
    if image_xscale=1{
    x=objPlayer.x+16
    y=objPlayer.y+4}
    else{
    x=objPlayer.x-17
    y=objPlayer.y+5}
}

if ia=0{
ia=image_angle
ix=image_xscale}
