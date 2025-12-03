#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmNIGHT || room=rmNIGHT2
sprite_index=sprNightBridge
alarm[0]=10

image_speed=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmNIGHT || room=rmNIGHT2{
if instance_exists(objBGNIGHT)
image_index=0
else if instance_exists(objBGNIGHT2)
image_index=1}

alarm[0]=10
