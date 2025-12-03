#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=.3
hspeed=-2
vspeed=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale+=.008
depth=-10
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=x>=other.x
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objSurfGen
*/
alarm[1]=300
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
path_end()
y_speed=-5
bigwave=false
bigone=0
if action!=action_surf
sound_play(sndSpringHigh)
action=action_surf
surfp=1
rstrenght=.8
hitrumble=10
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,0,c_white,1)
