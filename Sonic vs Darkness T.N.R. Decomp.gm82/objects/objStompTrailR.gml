#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=.6
image_speed=.3
spd=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd+=.2
/*
if instance_exists(objPlayer){
if (objPlayer.y_speed)>13
vspeed=objPlayer.y_speed-13

if objPlayer.action!=objPlayer.action_stomping
vspeed=0}
else
vspeed=0
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
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
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,spd,x,y,1,1,0,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
