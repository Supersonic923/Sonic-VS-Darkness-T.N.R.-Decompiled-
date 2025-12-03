#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

alarm[0]=10
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if room=rmNIGHT || room=rmNIGHT2{
//}

if instance_exists(objBGNIGHT) || instance_exists(objBGSUNLIGHT)
image_index=1
else if instance_exists(objBGNIGHT2)
image_index=2
else if instance_exists(objBGSUNLIGHT2)
image_index=3
else
image_index=0

alarm[0]=10
