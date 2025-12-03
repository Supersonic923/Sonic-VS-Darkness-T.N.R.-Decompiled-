#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.4
spd=0
vspeed=choose(-1,-2,-3,-4)
if instance_exists(objPlayer)
hspeed=choose(-.5,-1,-1.5,-2,-2.5,-3)*objPlayer.animation_direction
image_index=choose(0,1,2)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle=point_direction(x,y,x+hspeed,y+vspeed)
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
draw_sprite_ext(sprite_index,floor(image_index),x,y,image_xscale,1,image_angle,c_white,1)
draw_set_blend_mode(bm_normal)
