#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
en=0
alpha=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
en+=.05
alpha-=.05
if alpha<=0
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,0,x,y,en,en,0,c_white,alpha)
draw_set_blend_mode(bm_normal)
