#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd-=2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_tiled_ext(sprSMBGM,0,spd,y,1,1,c_white,.6)
draw_set_blend_mode(bm_add)
draw_sprite(sprSMFG,0,x,y)
draw_set_blend_mode(bm_normal)
