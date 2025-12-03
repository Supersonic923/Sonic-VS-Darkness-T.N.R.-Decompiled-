#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
alpha=.7
alpha2=1
rot=0
alarm[0]=120
alarm[1]=180

scale=0
scale2=2.5
xmov=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha2=1
alpha2=0
else
alpha2=1
alarm[0]=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot+=2

if scale<1
scale+=.05

if scale2>1
scale2-=.1

//xmov=-20*instance_number(objMonitorResult)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_blend_ext(sprMonitorGlow,0,view_xview+214+xmov,view_yview+206,scale,scale,-rot,c_white,alpha,bm_add)
draw_sprite_blend_ext(sprMonitorGlow,1,view_xview+214+xmov,view_yview+206,scale,scale,rot,c_white,alpha,bm_add)

draw_sprite_ext(sprMonitorBG,0,view_xview+214+xmov,view_yview+206,scale2,scale2,0,c_white,alpha2)
draw_sprite_ext(sprite_index,image_index,view_xview+214+xmov,view_yview+206,scale2,scale2,0,c_white,alpha2)
