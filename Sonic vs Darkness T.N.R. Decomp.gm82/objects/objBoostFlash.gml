#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph=.7
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph-=.1

if alph<0
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_white)
draw_set_alpha(alph)
draw_set_blend_mode(bm_add)
draw_rectangle(view_xview,view_yview,view_xview+640,view_yview+360,0)
draw_set_blend_mode(bm_normal)
draw_set_alpha(1)
