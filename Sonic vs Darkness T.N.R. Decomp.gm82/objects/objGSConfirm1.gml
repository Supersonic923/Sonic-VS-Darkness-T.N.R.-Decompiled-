#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bgalpha=.6
alpha=0
tme=180
ymove=20
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ymove>0
ymove-=1
tme-=1
if alpha<1 && tme>0
alpha+=.1
else if tme<0{
alpha-=.2
bgalpha-=.1}

if alpha<0
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(bgalpha)
draw_rectangle_color(view_xview,view_yview,view_wview,view_hview,c_black,c_black,c_black,c_black,0)
draw_set_alpha(1)
draw_sprite_ext(sprGSConfirm1,0,320,180-ymove,1,1,0,c_white,alpha)
