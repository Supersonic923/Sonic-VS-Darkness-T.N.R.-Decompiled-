#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
image_speed=0
index=0
sound_play(sndSdwTeleport)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if index<5
index+=.2
else
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite(sprite_index,index,x,y)
draw_set_blend_mode(bm_normal)
