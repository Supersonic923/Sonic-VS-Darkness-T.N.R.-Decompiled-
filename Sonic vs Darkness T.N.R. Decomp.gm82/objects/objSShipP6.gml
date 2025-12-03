#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmSUNLIGHTB{
draw_sprite_part(sprite_index,0,0,69,322,sprite_height-69,x,y+69)
draw_sprite_part(sprite_index,0,322,0,sprite_width-322,sprite_height,x+322,y)}
else
draw_sprite(sprite_index,0,x,y)
