#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=0

repeat(random(3)+5)v=instance_create(x,y,objSpinFlareW)

v.image_blend=image_blend
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale+=.05

if scale=1
instance_destroy()

if v.image_blend!=image_blend
v.image_blend=image_blend
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,0,image_blend,1.5-scale)
draw_set_blend_mode(bm_normal)
