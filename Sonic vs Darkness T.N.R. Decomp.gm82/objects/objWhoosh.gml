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
if objWhoosh.who=true
objWhoosh.no-=1

if objWhoosh.no<=0
{
objWhoosh.who=false
objWhoosh.no=15
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if objWhoosh.no=15
{
if abs(x_speed)>=10 && (action=action_corkscrew || action=action_corkscrew_roll)
{
sound_play(sndBWHOOSH)
objWhoosh.who=true
}
}
