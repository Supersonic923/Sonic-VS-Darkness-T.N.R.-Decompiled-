#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists("fall")
fall=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fall=true
{
    gravity_direction=270

    if place_meeting(x,y+vspeed+1,objSolid) || place_meeting(x,y+vspeed+1,objPlatform) || place_meeting(x,y+vspeed+1,objBoxWooden)
    {
    gravity=0
    vspeed=0
    }
    else
    gravity=.4
}
