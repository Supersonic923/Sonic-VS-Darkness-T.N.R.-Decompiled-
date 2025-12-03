#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.05
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
if global.specialfx>1{
draw_set_blend_mode(bm_add)
draw_sprite(sprWelcomeSignG,image_index,x-5,y-14)
draw_set_blend_mode(bm_normal)}
