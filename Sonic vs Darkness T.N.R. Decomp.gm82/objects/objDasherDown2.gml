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
animation_direction=1
ground=true
player_set_angle(-90)
ground=true
x-=3
if action=action_soaring
action=action_normal
if x_speed<12 || (y_speed>-12 && cork="up/down")
x_speed = 12
stomp=true
sound_play(sndDasher);
if instance_exists(objBoostPar) && action=action_normal{
animation_reset=true
animation="spinboost";
sound_play(sndBoostDash);}
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
if dont=0{
animation_direction=1
ground=true
player_set_angle(-90)
ground=true
x-=3
if x_speed<12 || (y_speed>-12 && cork="up/down")
x_speed = 12
stomp=true
sound_play(sndDasher);
if instance_exists(objGBoost) && action=action_normal{
animation="spinboost";
sound_play(sndBoostDash);}
dont=15
rstrenght=.9
hitrumble=10
}
