#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
alpha=0
ids=0
us=0
stop=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var gob;
if stop=false{
for (i=1;i<19;i+=1)
{
gob=variable_global_get('buy'+string(i));

if ids=i && gob=0
image_index=0
}
stop=true
}

us=variable_global_get('use'+string(ids));

//if ids>12
//image_index=0

if alpha<1
alpha+=.1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,alpha)
if us=1{
draw_set_alpha(.5)
draw_rectangle_color(x,y,x+65,y+72,c_black,c_black,c_black,c_black,false)
draw_set_alpha(1)}
