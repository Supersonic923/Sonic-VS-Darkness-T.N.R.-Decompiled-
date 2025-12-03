#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
image_speed=.2
sound_play(sndFlameTrap)
//sound_loop(sndFlameTrapLp)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objFlameTrapT
arg1=x
arg2=y
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if floor(image_index)=7
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite(sprite_index,image_index,x,y)
draw_set_blend_mode(bm_normal)
