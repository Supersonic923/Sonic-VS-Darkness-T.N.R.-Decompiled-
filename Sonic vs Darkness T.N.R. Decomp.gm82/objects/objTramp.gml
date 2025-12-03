#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
change=false
secs=30
image_speed=.1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if change=true
{
if secs>0
secs-=1
else{
secs=30
sprite_index=sprTramp
change=false}
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if change=false
{
sprite_index=sprTrampB
change=true
}
