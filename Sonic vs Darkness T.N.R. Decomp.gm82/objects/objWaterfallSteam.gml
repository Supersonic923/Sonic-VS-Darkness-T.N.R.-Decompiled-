#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=2
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index+=1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index>=52
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
draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,.7)
draw_set_blend_mode(bm_normal)
