#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph=1
back=false

/****************************
> Sunlight Paradise End Scene
****************************/
xpos=736
ypos=400
cam_spd_x=1
cam_spd_y=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alph>0 && back=false
alph-=.015
else if alph<1 && back=true
alph+=.005


if x<xpos
x+=cam_spd_x
if x>xpos
x-=cam_spd_x

if x>xpos-cam_spd_x && x<xpos+cam_spd_x
x=xpos


if y<ypos
y+=cam_spd_y
if y>ypos
y-=cam_spd_y

if y>ypos-cam_spd_y && y<ypos+cam_spd_y
y=ypos
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_black)
draw_set_alpha(alph)
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],0)
draw_set_alpha(1)
#define KeyPress_82
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=223
invert=0
arg0=0
*/
