#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=541
applies_to=self
invert=0
arg0=sprSpringingUp
arg1=0
arg2=.3
*/
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=541
applies_to=self
invert=0
arg0=sprSpringUp
arg1=0
arg2=1
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,x,y)

if room=rmTRAIN && global.reflection=true{
var i;

i=instance_position(x,y+40,objReflectSolid)
if i!=noone{
draw_set_blend_mode(bm_add);
draw_sprite_general(sprite_index,image_index,0,0,sprite_width,sprite_height,floor(x)-sprite_width/2,floor(y-2)+sprite_height*1.5,1,-1,0,c_black,c_black,c_black,c_white,1)
draw_set_blend_mode(bm_normal);}}
