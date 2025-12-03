#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

if instance_exists(objBGNIGHT2)
image_index=1
else
image_index=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_part(sprite_index,image_index,0,0,192,sprite_height,x,y)
