#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot=0
alpha=-1
ymove=10
slow=3.3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha<1
alpha+=.08

rot+=.8
if ymove<120
ymove+=slow

ymove=min(ymove,120)

if slow>0
slow-=.05

slow=max(slow,0)

if slow<=0 && !instance_exists(objPoweredBy)
instance_create(0,0,objPoweredBy)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//draw_set_blend_mode(bm_add)
draw_sprite_ext(sprSolSunLogo,0,210,floor(ymove),1,1,rot,c_white,alpha)
//draw_set_blend_mode(bm_normal)

draw_sprite_ext(sprSolEngineBars,0,0,0,1,1,0,c_white,alpha)
draw_sprite_ext(sprSolEngineBars,0,0,240-8,1,1,0,c_white,alpha)
