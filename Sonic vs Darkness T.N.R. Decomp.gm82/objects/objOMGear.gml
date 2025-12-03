#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
glow=250
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=1
glow-=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprOMGear,0,640,180,1,1,image_angle,c_white,.5)
draw_set_blend_mode(bm_normal)
