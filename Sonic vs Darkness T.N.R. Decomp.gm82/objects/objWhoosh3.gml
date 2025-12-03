#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
who=false
no=15
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if objWhoosh3.who=true
objWhoosh3.no-=1

if objWhoosh3.no<=0
{
objWhoosh3.who=false
objWhoosh3.no=15
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if objWhoosh3.no=15
{
if abs(x_speed)>=10 && (action=action_grind)
{
sound_play(sndBWHOOSH)
objWhoosh3.who=true
}
}
