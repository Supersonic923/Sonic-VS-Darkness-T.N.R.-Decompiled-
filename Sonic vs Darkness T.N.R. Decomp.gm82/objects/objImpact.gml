#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.4
image_index=0
spd=0
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Other_7
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
draw_sprite_ext(sprite_index,floor(image_index),x,y,1,1,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
