#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=630
tme=300
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x-=8
tme-=1
if tme<0{
x=630
tme=300}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add);
draw_sprite_ext(MMArrows2,0,x,117,1,1,0,c_white,.2)
draw_set_blend_mode(bm_normal)
