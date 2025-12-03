#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=0
image_speed=.1
if instance_exists(objPlayer){
x=objPlayer.x-20
y=objPlayer.y-20}
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objSenderFX
arg1=x
arg2=y
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if objPlayer.drown<=680 && instance_exists(objBB)
{
var bb; bb=instance_nearest(x,y,objBB)
if distance_to_point(bb.x,bb.y)<500{
move_towards_point(bb.x,bb.y,10)
if x<bb.x
image_xscale=1
else
image_xscale=-1}
}
else
{
if distance_to_point(objPlayer.x-20*objPlayer.animation_direction,objPlayer.y-20)>19
spd = distance_to_point(objPlayer.x-20*objPlayer.animation_direction,objPlayer.y-20)/10
else if distance_to_point(objPlayer.x-20*objPlayer.animation_direction,objPlayer.y-20)<20
spd=0
move_towards_point(objPlayer.x-20*objPlayer.animation_direction,objPlayer.y-20,spd)
if x<objPlayer.x
image_xscale=1
else
image_xscale=-1
}
}
else{
spd=0
motion_set(0,0)
}

if instance_exists(objShieldChao) && sprite_index!=sprSalomChaoS
sprite_index=sprSalomChaoS
if !instance_exists(objShieldChao) && sprite_index!=sprSalomChao
sprite_index=sprSalomChao

if place_meeting(x,y,objHurtPlayer) || place_meeting(x,y,objEGDraw) || place_meeting(x,y,objEnemy) || place_meeting(x,y,objEnemyForce)
|| place_meeting(x,y,objChopperFish) || place_meeting(x,y,objChopperFishJ){
if !instance_exists(objShieldChao)
instance_create(x,y,objShieldChao)}
else
{
with objShieldChao
back=true
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.chaofacing=true{
with objChao{
x=objPlayer.x+20
y=objPlayer.y-20}}
global.chaofacing=false
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.chaofacing=true{
with objChao{
x=objPlayer.x+20
y=objPlayer.y-20}}
global.chaofacing=false
