#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xp=x
yp=y
go=false
alpha=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha>0
alpha-=.05
if alpha=0
alpha=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprTitleArrow,0,view_xview+xp,view_yview+yp,1,1,0,c_white,alpha)
