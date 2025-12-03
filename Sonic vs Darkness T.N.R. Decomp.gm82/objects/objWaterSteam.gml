#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.2
die=room_speed
y_speed=-12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndSteam)
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=floor(image_index)<4
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if dont=0 && ground=true{
ground=false
y_speed=other.y_speed
animation_reset = true;
action=action_normal
animation="ramp"
dont=10}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
