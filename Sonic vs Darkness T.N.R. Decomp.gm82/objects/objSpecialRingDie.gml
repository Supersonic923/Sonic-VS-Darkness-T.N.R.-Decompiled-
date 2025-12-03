#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
die=0
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
die-=.7
draw_set_blend_mode(bm_add)
draw_sprite(sprite_index,die,x,y)
draw_set_blend_mode(bm_normal)
