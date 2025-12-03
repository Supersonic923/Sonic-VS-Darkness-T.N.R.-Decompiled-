#define Create_0
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

//if room=rmTRAIN{
var i;

//i=instance_position(x,y+40,objConcSolid)
//if i!=noone{
if global.reflection=true{
draw_set_blend_mode(bm_add);
draw_sprite_general(sprite_index,image_index,0,0,sprite_width,sprite_height,floor(x),floor(y-1)+sprite_height*2,1,-1,0,c_black,c_black,c_black,c_white,1)
draw_set_blend_mode(bm_normal);//}}
}
