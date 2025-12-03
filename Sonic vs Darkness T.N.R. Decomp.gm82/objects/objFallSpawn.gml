#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
get_id=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    if distance_to_point(objPlayer.x,objPlayer.y)>400
    {
        if get_id!=-1
        instance_create(x,y,get_id)
        instance_destroy()
    }
}
