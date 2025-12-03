#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndSteam)
instance_create(x+30,y,objWFCreate)
image_speed=.3
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if dont=0{
x_speed=5
action=action_normal
dont=10}
