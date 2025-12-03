#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alphachange=1
toalpha=false
timealpha=room_speed*3

ccolor=c_white
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*timealpha-=1
if timealpha<=0
toalpha=true

if toalpha=true
alphachange-=.1

if alphachange=0
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(alphachange)
draw_rectangle_color(view_xview,view_yview,view_xview+720,view_yview+360,ccolor,ccolor,ccolor,ccolor,false)
draw_set_alpha(1)
