#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=-10
tme=300
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+=10
tme-=1
if tme<0{
x=-10
tme=300}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add);
draw_sprite_ext(MMArrows,0,x,240,1,1,0,c_white,.4)
draw_set_blend_mode(bm_normal)
