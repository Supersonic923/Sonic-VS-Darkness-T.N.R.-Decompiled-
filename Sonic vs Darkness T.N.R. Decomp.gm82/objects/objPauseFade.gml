#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objFadeOut)
if objFadeOut.alph=1{
FMODInstanceStop(global.BGM)
global.ADD=0
room_goto(rmLOADING)
instance_destroy()}
