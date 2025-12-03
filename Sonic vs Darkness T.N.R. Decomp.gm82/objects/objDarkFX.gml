#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objDarkness)
sprite_index=sprDarkEnd
else
sprite_index=sprDarkStart
image_speed=.3
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objDarkness){
with objDarkness
instance_destroy()}
else
instance_create(x,y,objDarkness)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_index=sprDarkEnd
draw_set_blend_mode_ext(bm_src_color,bm_dest_alpha)
else
draw_set_blend_mode_ext(bm_src_alpha,bm_one)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,1)
draw_set_blend_mode(bm_normal)
