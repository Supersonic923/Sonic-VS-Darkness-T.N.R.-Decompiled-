#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xmove=random(25)-15
ymove=random(25)-15
scale=0
alpha=0
rot=0
back=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if back=false
scale+=.05
else
scale-=.05

if scale=1
back=true

if scale=0 && back=true
instance_destroy()

alpha=scale
rot-=2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprRankSparkle,0,view_xview+128+xmove,view_yview+152+ymove,scale,scale,rot,c_white,alpha)
draw_set_blend_mode(bm_normal)
