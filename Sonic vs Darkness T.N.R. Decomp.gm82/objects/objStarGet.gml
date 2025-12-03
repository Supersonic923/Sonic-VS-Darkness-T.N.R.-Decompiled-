#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot=false
alarm[0]=60
orbit_angle = 90;
orbit_radius = 40;
orbit_speed = -10;
XLen                    =   1;
YLen                    =   0;
sound_play(adCheer2)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=objPlayer.x
arg2=objPlayer.y-40
arg3=0
arg4=65280
arg5=1
*/
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,objStarDie)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot=true
alarm[1]=120
alarm[2]=20
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if global.starpiece=1
sound_play(anon4)
if global.starpiece=2
sound_play(anon5)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if rot=false{
image_speed=.2
x=objPlayer.x
y=objPlayer.y-40}
else
{
instance_create(x+YLen*4,y-XLen*4,objStarPFX);
image_speed=.2
orbit_angle += orbit_speed;
x = objPlayer.x + orbit_radius * cos(orbit_angle * pi / 180);
y = objPlayer.y - orbit_radius * sin(orbit_angle * pi / 180);
}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,-1,1,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
