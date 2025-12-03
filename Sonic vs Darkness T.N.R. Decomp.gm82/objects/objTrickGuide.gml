#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if objPlayer.path_index!=pathtrick1
visible=false
else
visible=true
}
else
visible=false

rot+=5
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*dots = path_get_length(pathtrick1)/20 //this is the amount of dots you want to draw on the path. the more dots, the more you start to see the outline of the path.
draw_set_blend_mode(bm_add)
if e=0
for (i = 40; i < dots; i += 1) //loop for each dot
{
    //since path_get_x and y require a position between 0 and 1, we use (1/dots) and then multiple by i to advance across the path.
    /*if i<dots/3
    draw_sprite(sprPathBubble,0, x+path_get_x(pathpush1,(1/dots)*i), y+path_get_y(pathpush1,(1/dots)*i));
    if i>dots/3 && i<dots/1.5
    draw_sprite(sprPathBubble,1, x+path_get_x(pathpush1,(1/dots)*i), y+path_get_y(pathpush1,(1/dots)*i));
    if i>dots/1.5
    draw_sprite(sprPathBubble,2, x+path_get_x(pathpush1,(1/dots)*i), y+path_get_y(pathpush1,(1/dots)*i));
    if !place_empty(x+path_get_x(pathtrick1,(1/dots)*i), y+path_get_y(pathtrick1,(1/dots)*i)) && early=false{
    early=true
    e=i
    break;}
}
if e!=0
draw_sprite(sprTrickEnd,0, x+path_get_x(pathtrick1,(1/dots)*e), y+path_get_y(pathtrick1,(1/dots)*e));
else
draw_sprite(sprTrickEnd,0, x+path_get_x(pathtrick1,dots), y+path_get_y(pathtrick1,dots));
draw_set_blend_mode(bm_normal)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprTrickEnd,0, x, y,1,1,rot,c_white,.7);
draw_set_blend_mode(bm_normal)
