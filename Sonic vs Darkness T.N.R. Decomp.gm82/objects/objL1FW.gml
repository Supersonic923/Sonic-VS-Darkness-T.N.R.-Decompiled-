#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=choose(sprL1FW,sprL1FW2,sprL1FW,sprL1FW2,sprL1FW3)

scale=1
ypos=y
parx=.98

if y>=150 && y<=220{
parx=.98
scale=1}
if y>220 && y<=320{
parx=.83
scale=1.2}
if y>320 && y<=400{
parx=.72
scale=1.5}
scale=1

pary=choose(.425)


x1=x-view_xview*parx
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBossLooper)
x1-=global.bossspeed*(1-parx)

if !instance_exists(objBGNIGHT)
instance_destroy()
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=view_current=0 || view_current=7
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,-1,(view_xview*parx)+x1,view_yview*pary+ypos,scale,scale,0,c_white,1)
draw_set_blend_mode(bm_normal)
