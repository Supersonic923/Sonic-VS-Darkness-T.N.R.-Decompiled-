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
if dont=0{
action=action_normal
animation_direction=-1
ground=true
player_set_angle(-180)
ground=true
y-=3
if x_speed<=-15
x_speed = -18
if x_speed>-12
x_speed = -12
sound_play(sndDasher);
if instance_exists(objBoostPar) && action=action_normal{
animation_reset=true
animation="spinboost";
sound_play(sndBoostDash);

max_x_speed = 16;
if x_speed>-max_x_speed
x_speed=-max_x_speed}
dont=15
stomp=true
rstrenght=.9
hitrumble=10
}
#define Collision_objPlayerAI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if dont=0{
action=action_normal
animation_direction=-1
ground=true
player_set_angle(-180)
ground=true
y-=3
if x_speed>-12
x_speed = -12
sound_play(sndDasher);
if instance_exists(objGBoost) && action=action_normal{
animation="spinboost";
sound_play(sndBoostDash);}
dont=15
stomp=true
rstrenght=.9
hitrumble=10
}
