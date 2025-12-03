#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=false
image_speed=0
image_index=0
leave=false
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer
if action=action_ride && animation="ride2"{
action=action_normal
animation="flightdash"
x_speed=8
y_speed=-4}

sound_stop(sndRollerCoaster)

instance_create(x,y,objExplode)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=true && instance_exists(objPlayer)
{
if leave=false{
image_speed=.2
image_angle=objPlayer.animation_angle}

if objPlayer.animation!="ride2"{
leave=true
hspeed=12
image_angle=0
image_speed=.2}
}
#define Collision_objNIGHTCoasterDes
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
other.image_speed=.3
other.alarm[0]=60
with other
sound_play(sndRankFlip)
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=true
{
if instance_exists(objPlayer){
if objPlayer.animation!="ride2"
instance_destroy()}
else
instance_destroy()}
