#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=1
applies_to=self
invert=0
arg0=objHandle360
arg1=0
arg2=16
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=1
applies_to=self
invert=0
arg0=objZipLine360
arg1=0
arg2=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,x,y)

if room=rmTRAIN{
var i;

i=instance_position(x,y+40,objReflectSolid)
if i!=noone{
draw_set_blend_mode(bm_add);
draw_sprite_general(sprite_index,image_index,0,0,sprite_width,sprite_height,floor(x)-sprite_width/2,floor(y-2)+sprite_height*1.5,1,-1,0,c_black,c_black,c_black,c_white,1)
draw_set_blend_mode(bm_normal);}}
