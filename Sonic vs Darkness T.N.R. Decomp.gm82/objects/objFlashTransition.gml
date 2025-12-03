#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
back=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if back=false
if alpha<1.5
alpha+=.02

if alpha=1.5 && back=false
{
room_goto(rmStartMenu)
back=true
}

if back=true
if alpha>0
alpha-=.015
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//draw_set_blend_mode(bm_add)
draw_set_alpha(alpha)
draw_set_color(c_black)
draw_rectangle(x,y,420,240,false)
draw_set_alpha(1)
//draw_set_blend_mode(bm_normal)
