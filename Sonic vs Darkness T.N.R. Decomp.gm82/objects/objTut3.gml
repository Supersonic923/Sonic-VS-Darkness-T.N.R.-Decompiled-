#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.17
if global.player="Shadow"
sprite_index=sprPressScript2

keyind=scrCheckASCII(global.k_down2)
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
draw_sprite_ext(sprPressScript360,1,x,y,1,1,0,c_white,image_alpha)
draw_sprite_ext(sprPressScriptArrow,image_index,x,y,1,1,0,c_white,image_alpha)}
