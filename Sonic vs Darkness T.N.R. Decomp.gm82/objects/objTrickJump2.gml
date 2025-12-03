#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.3
image_xscale=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    if objPlayer.green_boost=1
    {
        if sprite_index!=sprTrickJumpSub
        {
            instance_create(x+35,y+20,objrainbowtrick)
            sprite_index=sprTrickJumpSub
        }
    }
    else
    {
        if sprite_index!=sprTrickJump
        {
            instance_create(x+35,y+20,objrainbowtrick)
            sprite_index=sprTrickJump
        }
    }
}
