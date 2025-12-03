#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
depth=-1
spd=0
go=false
alarm[0]=5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=true
spd+=.3
if spd>=13
instance_destroy()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
depth=-1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,spd,x,y,1,1,0,c_white,.9)
draw_set_blend_mode(bm_normal)
draw_sprite(sprButtonBoxFrame,spd,x,y)
