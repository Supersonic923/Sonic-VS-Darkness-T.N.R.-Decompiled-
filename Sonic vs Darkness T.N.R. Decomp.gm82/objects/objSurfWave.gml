#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.2
hide=1000
show=false
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer
if bigone=-1 && action!=action_bigsurf{
hitrumble=8
rstrenght=.8}
alarm[0]=30
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if show=true
if hide>0
hide-=2
if hide<0
hide=0

if show=false
if hide<1000
hide+=5

if hide=0 && !instance_exists(objSurfGen)
instance_create(view_xview+360,view_yview+100,objSurfGen)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
if hide=0 && show=true{
objPlayer.bigwave=true
objPlayer.action=objPlayer.action_bigsurf}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,view_xview-hide,room_height)
