#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_alpha=1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if objPlayer.animation="side_run"
image_angle=90
else{
image_xscale=objPlayer.animation_direction
image_angle=objPlayer.angle}

x=objPlayer.x
y=objPlayer.y

if abs(objPlayer).x_speed<4 && abs(objPlayer).y_speed<2
instance_destroy()
}
else
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
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
