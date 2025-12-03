#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=false
image_speed=.2

spd=20

fx=-10
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=true{
fx=0
with instance_create(x+15,y-18,objNIGHTCoasterE)
hspeed=random_range(other.hspeed,other.hspeed+4)+4
sound_play(sndCannonShot)}
alarm[0]=20
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=true{
visible=true
if instance_exists(objPlayer){
if objPlayer.animation="ride2"
hspeed=max(objPlayer.x_speed,spd)
else
hspeed=14}
else
hspeed=14}

if spd>0
spd-=.05

if fx>=0{
fx+=.25
if fx>=5
fx=-10}
#define Collision_objSpikeBall
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
instance_create(x,y,objExplode)
global.lookbehind=false
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer){
if objPlayer.x>x && objPlayer.x<x+1500 && objPlayer.animation="ride2"{
go=true
global.lookbehind=true
alarm[0]=100}

if go=true && x>objPlayer.x{
instance_destroy()
global.lookbehind=false}}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,floor(image_index),x,y)
draw_sprite(sprNIGHTCoasterS,0,x,y-6)
if fx>=0
draw_sprite_ext(sprShotDie,floor(fx),x+15,y-20,.5,.5,45//-135
,c_white,1)
