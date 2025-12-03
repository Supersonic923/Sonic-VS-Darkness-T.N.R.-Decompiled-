#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
MassInit();
RotationInit();
if x<room_width/2
hspeed=-2
else
hspeed=2
image_speed=.2
#define Collision_objWhirlBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed*=-1
