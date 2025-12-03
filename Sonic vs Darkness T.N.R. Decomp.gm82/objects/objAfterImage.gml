#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

blend=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha-=.1 //or .1 or .075 or .025 or whatever
if image_alpha<=0 {instance_destroy()}

image_speed=0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.specialfx>1{
if blend=0
draw_sprite_ext(sprite_index,floor(image_index),x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
else
draw_sprite_blend_ext(sprite_index,floor(image_index),x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha,blend)}
