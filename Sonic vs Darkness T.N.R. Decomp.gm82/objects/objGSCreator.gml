#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.8
gs=2
spd=0
pitch=1
grd=0
global.BGMR = FMODSoundLoop(global.RAIL);
FMODInstanceSetVolume(global.BGMR,global.soundvolume)
if global.reverb=true{
FMODInstanceSetVolume(global.railreverb,global.soundvolume-.95)
global.railreverb=FMODInstanceAddEffect(global.BGMR,13,1)}

if global.specialfx=1
visible=false
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FMODInstanceStop(global.BGMR)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{

    if abs(objPlayer.x_speed)<5{ pitch=.5}
    if abs(objPlayer.x_speed)>=5 && abs(objPlayer.x_speed)<7{ pitch=abs(objPlayer.x_speed)/10}
    if abs(objPlayer.x_speed)>=7 && abs(objPlayer.x_speed)<9{ pitch=abs(objPlayer.x_speed)/10}
    if abs(objPlayer.x_speed)>=9 && abs(objPlayer.x_speed)<11{ pitch=abs(objPlayer.x_speed)/10}
    if abs(objPlayer.x_speed)>=10{ pitch=1}
    FMODInstanceSetPitch(global.BGMR,(pitch))


x=objPlayer.x
y=objPlayer.y
image_xscale=objPlayer.animation_direction
image_angle=objPlayer.angle
if objPlayer.slide!=1
{
    instance_destroy()
}
}
else
{
    instance_destroy()
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Rail Loop
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
if objPlayer.animation="corkscrew" && objPlayer.slide=1
{
var r;
r=(objPlayer.animation_corkscrew_end-objPlayer.animation_corkscrew_start)-(objPlayer.animation_corkscrew_end-floor(objPlayer.animation_frame))
if r<5
y=objPlayer.y-r*5
else
y=objPlayer.y-(10-r)*5
if global.player="Sonic"{
if objPlayer.animation_frame>=58 && objPlayer.animation_frame<=63
depth=1
else
depth=-6}
else{
if objPlayer.animation_frame>=274 && objPlayer.animation_frame<=279
depth=1
else
depth=-6
}
}


if gs>0
gs-=1
if gs=0
{
if global.specialfx>2{
l=instance_create(x+lengthdir_x(14,image_angle-90),y+lengthdir_y(14,image_angle-90),objGrindSparks)
l.depth=depth}
gs=2
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,floor(image_index),x,y,image_xscale,1,image_angle,c_white,.7)
draw_set_blend_mode(bm_normal)
