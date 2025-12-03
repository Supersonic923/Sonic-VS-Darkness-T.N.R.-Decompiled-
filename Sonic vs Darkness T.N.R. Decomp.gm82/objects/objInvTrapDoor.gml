#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
done=false
if !variable_local_exists("xrange")
xrange=500
if !variable_local_exists("yrange")
yrange=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    if objPlayer.x>x+50 && objPlayer.x<x+xrange && objPlayer.y<y+sprite_height+20 && objPlayer.y>=y-yrange
    {
        with objEnemyTeleport
        activate=true

        mask_index=sprite_index
    }
}

if done=true
{
instance_destroy()
}
