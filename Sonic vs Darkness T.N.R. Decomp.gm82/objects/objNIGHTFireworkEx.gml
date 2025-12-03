#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
index=0

with objPlayer{
rstrenght=1
hitrumble=30}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
index+=.6
if index>=37
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if floor(index)<37//50
draw_sprite_blend_ext(sprL1FWM,floor(index),x,y,1,1,0,c_white,1,bm_add)
