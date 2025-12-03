#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=1/3;
hspeed = -2;
vspeed = -4;
spd=.3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if( x<view_xview[0]-64 || y>view_yview[0]+view_hview[0]+64 || x>view_xview[0]+view_wview[0]+64){
instance_destroy();
}
spd+=.3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.4
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite(sprite_index,spd,x,y)
draw_set_blend_mode(bm_normal)
