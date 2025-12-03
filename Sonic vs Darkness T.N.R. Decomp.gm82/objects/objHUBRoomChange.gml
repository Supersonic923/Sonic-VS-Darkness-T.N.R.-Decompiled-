#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.online_mode=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=202
applies_to=self
invert=0
arg0=objInvWall
arg1=1
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objFadeOut) && go=true
if objFadeOut.alph=1{
FMODInstanceStop(global.BGM)
global.ADD=0
room_goto(rmLOADING)
instance_destroy()}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
//room_goto(rmItemShop)
if !instance_exists(objFadeOut){
global.room_change=rmItemShop
op=instance_create(0,0,objFadeOut)
op.alph=-.05
global.loadlevel=1
other.go=true}
/*if !instance_exists(objFadeOut){
if checknend=false
global.loadscreen=40
checknend=true
if animation="crouch_slide"
animation="crouch_slide2"
if room=rmHUB{
global.loadlevel=2
global.room_lag=true
global.destination=rmItemShop
global.room_change=TestIntro}}
