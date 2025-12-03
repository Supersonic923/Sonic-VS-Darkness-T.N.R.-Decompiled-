#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
alarm[0]=75
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=1
applies_to=self
invert=0
arg0=objEnergyAbsorbFx
arg1=0
arg2=-5
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle-=5

if image_alpha<1
image_alpha+=.1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_blend_ext(sprite_index,0,x,y,image_alpha,image_alpha,-image_angle,c_white,image_alpha,bm_add)
