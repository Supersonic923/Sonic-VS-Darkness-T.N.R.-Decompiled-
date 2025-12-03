#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
comboget=false
image_speed=0
alarm[0]=10
/*
if room=rmNIGHT || room=rmNIGHT2 || room=rmTEST || room=rmTEST2 || room=rmSUNLIGHT
image_index=1
else
image_index=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objRailParts
arg1=x
arg2=y
*/
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
