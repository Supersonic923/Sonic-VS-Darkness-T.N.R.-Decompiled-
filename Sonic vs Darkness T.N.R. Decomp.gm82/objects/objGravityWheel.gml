#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
angle=0
instance_create(x+70,y-10,objWhoosh)
instance_create(x-100,y-10,objWhoosh2)
if !instance_exists(objGravitySound)
instance_create(x,y,objGravitySound)
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
angle-=5
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_blend_ext(sprGravityWheelS,0,x,y,1,1,-angle,c_white,1,bm_add)
draw_sprite(sprite_index,1,x,y)
draw_sprite_ext(sprite_index,2,x,y,1,1,angle,c_white,.17)
draw_sprite(sprite_index,0,x,y)
