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
give=false
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
if reset=true && y<ystart
y+=4

near=instance_nearest(x,y,objZipLift2).y
if move=true
{
reset=false
if y>near+16
y-=16
else
y=near+16
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=move=true && y<=near+16
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
action=action_normal
animation="ramp"
y_speed=-8
phase=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndHandleMove)
y=near+16
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if stop=false{
block=instance_create(x,y,objTargetBlockerV)
stop=true}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
