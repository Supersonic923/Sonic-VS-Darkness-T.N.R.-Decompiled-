#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objWoodBox)
{
    var box;
    box=instance_nearest(x,y,objWoodBox)
    if place_meeting(x,y,box)
    depth=box.depth+1
    else
    depth=0
}
