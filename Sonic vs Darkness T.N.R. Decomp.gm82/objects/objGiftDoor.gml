#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
done=false
fade=false
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var op;

if instance_exists(objPlayer) && !instance_exists(objFadeOut){
if objPlayer.animation="enter"{
if fade=true{
global.room_position=""
global.room_change=rmHUBGift
op=instance_create(0,0,objFadeOut)
op.alph=-1
global.loadlevel=0
fade=false
}
}
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if done=true
if instance_exists(objFadeOut)
if objFadeOut.alph=1{
room_goto(rmLOADING)}
