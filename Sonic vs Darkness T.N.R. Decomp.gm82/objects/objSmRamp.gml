#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
comboget=false
if !variable_local_exists("y_speed")
y_speed=-8
if !variable_local_exists("x_speed")
x_speed=10
if !variable_local_exists("nomovet")
nomovet=25
if !variable_local_exists("notargt")
notargt=25
if !variable_local_exists("noboost")
noboost=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.3
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
draw_sprite_general(sprite_index,image_index,0,0,sprite_width,sprite_height,floor(x),floor(y-1)+sprite_height*2,1,-1,0,c_black,c_black,c_black,c_white,1)
draw_set_blend_mode(bm_normal);}}
