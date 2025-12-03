#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.1
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,objMonBreak)
sound_play(sndEnemyBreak)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=16777215
arg5=1
*/
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objWisp1
arg1=x
arg2=y
*/
