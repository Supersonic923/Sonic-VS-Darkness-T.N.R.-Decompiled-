#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph=1
back=false
alarm[0]=10
tran=false

image_speed=.3

get=false
rot=false

orbit_angle = 90;
orbit_radius = 40;
orbit_speed = -10;
XLen                    =   1;
YLen                    =   0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if distance_to_object(objPlayer)<600 && global.specialfx=3
instance_create(x+random(30)-15,y+random(30)-15,objEMS)
alarm[0]=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if back=false
alph-=.1
else
alph+=.1

if alph=.3
back=true
if alph=1
back=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if rot=true{
//instance_create(x+YLen*4,y-XLen*4,objStarPFX);
orbit_angle += orbit_speed;
x = objPlayer.x + orbit_radius * cos(orbit_angle * pi / 180);
y = objPlayer.y - orbit_radius * sin(orbit_angle * pi / 180);
if tran=false
orbit_radius-=.25
else
orbit_radius-=tran
}
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=floor(orbit_radius)=0
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
/*if other.action!=other.action_super{
if global.specialfx>2{
v=instance_create(x,y,objSpinGlowW)
v.image_blend=c_purple}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot=true
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
if global.specialfx>1
draw_sprite_ext(sprEM7S,0,x,y,1,1,0,c_white,alph)
draw_set_blend_mode(bm_normal)
draw_sprite(sprite_index,image_index,x,y)

draw_set_blend_mode(bm_add)
if global.specialfx>1
draw_sprite_ext(sprEM7S,1,x,y,1,1,0,c_white,alph)
draw_set_blend_mode(bm_normal)
