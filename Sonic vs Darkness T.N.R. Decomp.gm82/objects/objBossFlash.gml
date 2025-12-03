#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph=.5
back=false

with objPlayer
hitrumble=180
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(1700,736,objGoal)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if back=false
alph+=.1
if back=true
alph-=.01


if alph=1.6
back=true

if alph=0
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
if global.nds=true
draw_rectangle(view_xview[7],view_yview[7],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],0)
else
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],0)
draw_set_blend_mode(bm_normal)
draw_set_alpha(1)
