#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmSUNLIGHTB{
draw_sprite_part(sprite_index,0,0,0,194,sprite_height,x,y)
draw_sprite_part(sprite_index,0,194,34,sprite_width-194,sprite_height-34,x+194,y+34)}
else
draw_sprite(sprite_index,0,x,y)
