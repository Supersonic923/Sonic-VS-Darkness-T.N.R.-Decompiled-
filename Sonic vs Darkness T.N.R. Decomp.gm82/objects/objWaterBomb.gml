#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.4
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objExplode
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with instance_create(x,y,objSplash){
    sprite_index=sprWaterSteam2
    depth=0}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if objPlayer.animation="waterfall3" || objPlayer.animation="waterfall2" ||objPlayer.y<y-20
mask_index=nomask
else
mask_index=sprite_index

if objPlayer.y>y || objPlayer.animation="waterfall3"
depth=0
else
depth=-101
}
#define Collision_objPlayer
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
if global.arcade=true
{
global.game_time+=5000
}
#define Collision_objPlayerAI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
