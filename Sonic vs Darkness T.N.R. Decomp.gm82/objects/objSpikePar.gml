#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=10

image_speed=0
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

if room=rmSUNLIGHT || room=rmSUNLIGHT2{
if instance_exists(objBGSUNLIGHT)
image_index=2
else if instance_exists(objBGSUNLIGHT2)
image_index=2}

alarm[0]=10
