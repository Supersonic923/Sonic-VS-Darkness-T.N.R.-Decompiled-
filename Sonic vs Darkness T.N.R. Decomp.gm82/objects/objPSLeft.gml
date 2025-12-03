#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.17
des=false
if global.player="Shadow"
sprite_index=sprPressScript2

keyind=scrCheckASCII(global.k_left)

if !variable_local_exists("side")
side=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if ((objPlayer.x>x+20 && side=0) || (objPlayer.x<x-20 && side=1)) && distance_to_object(objPlayer)<200
des=true
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if des=true
image_alpha-=.1
if image_alpha=0
instance_destroy()
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if des=true
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.xbox=false{
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,image_alpha)
draw_sprite_ext(sprPressScriptL,keyind,x,y,1,1,0,c_white,image_alpha)}
else{
draw_sprite_ext(sprPressScript360,7,x,y,1,1,0,c_white,image_alpha)
draw_sprite_ext(sprPressScriptArrow,image_index,x,y,1,1,0,c_white,image_alpha)}
