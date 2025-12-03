#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
instance_create(x,y,objPoleSwingT)

alp=0
moe=20
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alp>0
alp-=.05

if moe<20
moe+=1

if instance_exists(objPlayer)
if objPlayer.action=objPlayer.action_swing
if objPlayer.other_frame=4
{
moe=0
alp=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
if objPlayer.action=objPlayer.action_swing && place_meeting(x,y,objPlayer){
draw_sprite_ext(sprPoleSwingH,0,x,y,objPlayer.animation_direction,1,0,c_white,1)
draw_sprite_blend_ext(sprPoleSwingH,1,x+moe*objPlayer.animation_direction,y,objPlayer.animation_direction,1,0,c_white,alp,bm_add)}
draw_sprite(sprite_index,0,x,y)
