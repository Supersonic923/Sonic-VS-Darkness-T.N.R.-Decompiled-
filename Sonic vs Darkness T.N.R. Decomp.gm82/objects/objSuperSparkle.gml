#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=8
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeat(choose(2,3))instance_create(x+random(30)-15,y+random(30)-15,objEMS)
alarm[0]=8
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer){
x=objPlayer.x
y=objPlayer.y}
else
instance_destroy()
