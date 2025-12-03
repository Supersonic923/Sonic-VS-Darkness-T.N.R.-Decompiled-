#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if dont=0 && slide=1{
if x>other.x-5{
c=instance_create(other.x+30,other.y-22,objWhiteDash)
c.image_xscale=-1}
if x_speed>-12
x_speed = -12
instance_create(x,y,objSpeedWind)
animation_direction=-1
sound_play(sndDasher);
dont=15
rstrenght=.9
hitrumble=10
}
#define Collision_objPlayerAI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if dont=0 && slide=1{
if x_speed>-12
x_speed = -12
animation_direction=-1
sound_play(sndDasher);
dont=15
rstrenght=.9
hitrumble=10
}
