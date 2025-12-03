#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//image_speed=.15
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index = global.motion_time div 120;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,.6)
draw_sprite_ext(sprRingLighting2,image_index,x,y,1,1,image_angle,c_white,.6)
draw_set_blend_mode(bm_normal)
