#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=0.4
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=0
arg1=.4
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndMissileLaunch)
vspeed=3.5
hspeed=1
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objNegaChaser)
instance_create(x,y,objExplodeTrail)
else
instance_create(x,y,objExplode)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objNegaChaser)
{
x=objNegaChaser.x-hspeed
}
else{
image_xscale=-1
hspeed=20}
#define Collision_objSolid
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Collision_objRailLong
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
