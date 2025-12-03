#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y-=343
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if objPlayer.path_index!=pathpush1
instance_destroy()
}
else
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dots = path_get_length(pathpush1)/20 //this is the amount of dots you want to draw on the path. the more dots, the more you start to see the outline of the path.
draw_set_blend_mode(bm_add)
for (i = 0; i < dots; i += 1) //loop for each dot
{
    //since path_get_x and y require a position between 0 and 1, we use (1/dots) and then multiple by i to advance across the path.
    if i<dots/2
    draw_sprite(sprPathBubble,0, x+path_get_x(pathpush1,(1/dots)*i), y+path_get_y(pathpush1,(1/dots)*i));
    if i>dots/2 && i<dots/1.5
    draw_sprite(sprPathBubble,1, x+path_get_x(pathpush1,(1/dots)*i), y+path_get_y(pathpush1,(1/dots)*i));
    if i>dots/1.5
    draw_sprite(sprPathBubble,2, x+path_get_x(pathpush1,(1/dots)*i), y+path_get_y(pathpush1,(1/dots)*i));
}
draw_set_blend_mode(bm_normal)
