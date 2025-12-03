#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0.5
if !variable_local_exists("deptheffect")
deptheffect=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if deptheffect=true
{
if instance_exists(objPlayer){
if objPlayer.layer=1
depth=-11
else
depth=0}
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if dont=0 && other.depth>-11 && ground=true{
if x>other.x+30{
m=instance_create(other.x+20+60,other.y-3,objWhiteDash)
m.image_xscale=-1}
animation_direction=-1
if x_speed<=-15
x_speed = -18
if x_speed>-12
x_speed = -12
instance_create(x,y,objSpeedWind)
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
animation_direction=-1
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,x,y)

if room=rmTRAIN && global.reflection=true{
var i;

i=instance_position(x,y+40,objReflectSolid)
if i!=noone{
draw_set_blend_mode(bm_add);
draw_sprite_general(sprite_index,image_index,0,0,sprite_width,sprite_height,floor(x),floor(y-1)+sprite_height*2,1,-1,0,c_black,c_black,c_black,c_white,1)
draw_set_blend_mode(bm_normal);}}
