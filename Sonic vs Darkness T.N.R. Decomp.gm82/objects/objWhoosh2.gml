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
if objWhoosh2.who=true
objWhoosh2.no-=1

if objWhoosh2.no<=0
{
objWhoosh2.who=false
objWhoosh2.no=15
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if objWhoosh2.no=15
{
if x_speed<=-10 && (action=action_normal || action=action_corkscrew)
{
sound_play(sndBWHOOSH)
objWhoosh2.who=true
}
}
