#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
//instance_create(x+32,y,objWFCreate)
if global.sound_wfall=0{
global.sound_wfall=1
if !instance_exists(objWaterFallSound)
instance_create(x+32,y,objWaterFallSound)}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=global.imageindex
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=distance_to_object(objControl)<1000
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,1)
draw_set_blend_mode(bm_normal)
