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
if global.specialfx=1
visible=false
v=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndSpinDashLp)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objSpinDustEnd
arg1=x
arg2=y
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_direct(global.k_a){
if sprite_index!=sprSpinDashDust
sprite_index=sprSpinDashDust
if loop=true{
if !sound_isplaying(sndSpinDashLp)
sound_loop(sndSpinDashLp)
sound_volume(sndSpinDashLp,1)
loop=false}}
else if delay=0{
if sprite_index!=sprSpinDashLow
sprite_index=sprSpinDashLow
sound_volume(sndSpinDashLp,.5)
loop=true}

if !keyboard_check_direct(global.k_a)
delay-=1
else
delay=30

if keyboard_check_pressed(global.k_a)
wave=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=wave=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer{
if global.specialfx>1{
if global.player="Salom"{
other.v=instance_create(x,y,objCircleFX)
other.v.image_blend=c_green}
else if global.player="Vermin"{
other.v=instance_create(x,y,objCircleFX)
other.v.image_blend=c_orange}
else if global.player="Sonic"{
other.v=instance_create(x,y,objCircleFX)
other.v.image_blend=c_blue}
else if global.player="Shadow"{
other.v=instance_create(x,y,objCircleFX)
other.v.image_blend=c_red}
else if global.player="Tails"{
other.v=instance_create(x,y,objCircleFX)
other.v.image_blend=c_yellow}
else if global.player="Knuckles"{
other.v=instance_create(x,y,objCircleFX)
other.v.image_blend=c_red}
else{
other.v=instance_create(x,y,objCircleFX)
other.v.image_blend=c_white}
}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
wave=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=objPlayer
invert=0
arg0=action!=action_spindash && action!=action_charge
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
    if v>0{
    v.x=objPlayer.x
    v.y=objPlayer.y}
}
