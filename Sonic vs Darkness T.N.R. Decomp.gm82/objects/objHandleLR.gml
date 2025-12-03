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
move=false
looper=10
near=1
gs=2

reset=false
stop=false
change=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//stop=false
reset=true
move=false
mask_index=sprite_index
with block
instance_destroy()
change=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if stop=true{
move=false
alarm[0]=120
stop=false}
if reset=true && x>xstart
x-=4

if looper>0
looper-=1
if looper=0{
near=instance_nearest(x,y,objZipLine).tha
looper=-1
}
if near!=1
if move=true
{
reset=false
if x<near
x+=7
else
x=near
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=1
arg0=near=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=move=true && x>=near
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
change=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
sound_stop(sndHandleMove)
if action=action_hang{
hang=0
action=action_normal
x_speed=4}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if stop=false{
sound_stop(sndHandleMove)
mask_index=nomask
block=instance_create(x,y,objTargetBlockerV)
stop=true}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if move=true{
if gs>0
gs-=1
if gs=0
{
if global.specialfx>2
instance_create(x,y-16,objHangSparks)
gs=2
}}
