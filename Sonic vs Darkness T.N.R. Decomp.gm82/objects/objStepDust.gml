#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.2
image_index=0
if instance_exists(objPlayer){
image_angle=objPlayer.angle
if objPlayer.action=objPlayer.action_siderun
depth=0}
change=false

hpd=x
vpd=y
//getspd=objPlayer.x_speed*sign(objPlayer.xprevious-objPlayer.x)
dwn=-1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_exists(objPlayer)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=abs(objPlayer.x_speed)>10
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
sprite_index=sprStepDust2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if sprite_index=sprStepDust2 && image_index>=5
instance_destroy()
else if sprite_index=sprStepDust && image_index>=4
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
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,floor(image_index),x,y,1,1,image_angle,c_white,image_alpha)
