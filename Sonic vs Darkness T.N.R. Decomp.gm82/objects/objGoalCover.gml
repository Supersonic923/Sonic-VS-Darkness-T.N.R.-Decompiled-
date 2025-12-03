#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if scale<1 && image_speed=0
scale+=.1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,floor(image_index),x,y)

if image_speed=0
{
if global.online_mode=false
draw_sprite_ext(sprGoalPeace,0,x,y,scale,scale,0,c_white,1)
else{
draw_sprite_ext(sprGoalPlace,global.online_place-1,x,y,scale,scale,0,c_white,1)}
}
