#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.2
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=1
applies_to=self
invert=0
arg0=objFlameTrapG
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//sound_stop(sndFlameTrapLp)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite(sprite_index,image_index,x,y)
draw_set_blend_mode(bm_normal)
