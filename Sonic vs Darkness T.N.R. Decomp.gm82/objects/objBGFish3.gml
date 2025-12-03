#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.1

depth=choose(-10,-.5)

if global.specialfx<2
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,floor(image_index),x,y)
draw_sprite_blend(sprBGFish5G,0,x,y,bm_add)
