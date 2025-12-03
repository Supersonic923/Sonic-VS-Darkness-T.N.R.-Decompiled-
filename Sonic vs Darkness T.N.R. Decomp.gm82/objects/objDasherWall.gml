#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.6
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if dont=0 && animation="side_run"{
w=instance_create(other.x,other.y+50,objWhiteDash)
w.sprite_index=sprWhiteDashTop
sideruntime=70
siderunboost=8
instance_create(x,y,objSpeedWind)
sound_play(sndDasher);
dont=25
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
if action=action_soaring
action=action_normal
if x_speed<12
x_speed = 12
animation_direction=1
sound_play(sndDasher);
if instance_exists(objGBoost){
animation="spinboost";
sound_play(sndBoostDash);}
dont=15
stomp=true
rstrenght=.9
hitrumble=10
}
