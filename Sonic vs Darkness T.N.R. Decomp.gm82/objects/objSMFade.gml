#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode_ext(bm_dest_color, bm_zero)
draw_set_blend_mode_ext(bm_zero, bm_src_color)
draw_sprite(sprite_index,0,x,y)
draw_set_blend_mode(bm_normal)
