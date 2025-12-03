#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
freeze=false
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
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer{
x=other.x+other.sprite_width
x_speed=0}

freeze=true

instance_create(0,0,objStageSelect)
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer
goal=false

freeze=false
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
/*if !instance_exists(objWFadeOut){
if checknend=false
global.loadscreen=40
checknend=true
if animation="crouch_slide"
animation="crouch_slide2"
if room=rmHUB{
global.loadlevel=2
global.room_lag=true
global.destination=rmNIGHT
global.room_change=TestIntro}}*/

if goal=false{
x_speed=max(x_speed,4)
other.alarm[0]=45
goal=true
if animation="crouch_slide"
animation="crouch_slide2"}
