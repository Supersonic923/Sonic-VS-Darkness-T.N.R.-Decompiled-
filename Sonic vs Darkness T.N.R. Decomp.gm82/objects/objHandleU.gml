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
reset=false
stop=false
if !variable_local_exists("spd")
spd=7
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
if reset=true && y<ystart
y+=4

near=instance_nearest(x,y,objZip2).y
if move=true
{
reset=false
if y>near+32
y-=spd
else{
y=near+32
with objPlayer
canmove=true
}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=move=true && y<=near+32
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
canmove=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndHandleMove)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=objPlayer
invert=0
arg0=action!=action_hang
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if stop=false{
mask_index=nomask
block=instance_create(x,y,objTargetBlockerV)
stop=true}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
