#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer){
image_angle=point_direction(x,y,objPlayer.x,objPlayer.y)
}
image_speed=.25
image_alpha=1
tor=5
alarm[0]=30

cul=c_white
#define Alarm_0
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
tor-=1
if tor>0
if instance_exists(objPlayer)
image_angle=point_direction(x,y,objPlayer.x,objPlayer.y)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Hyper Style
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.hyperboost>0{
if sprite_index!=sprHPBoostEf
sprite_index=sprHPBoostEf
if instance_exists(sprBBoost)
cul=objBBoost.cul}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=false
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,floor(image_index),x,y,1,1,image_angle,cul,image_alpha)
draw_set_blend_mode(bm_normal)
