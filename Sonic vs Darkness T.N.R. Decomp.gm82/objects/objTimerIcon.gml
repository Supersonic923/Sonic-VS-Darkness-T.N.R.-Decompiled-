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
action_id=532
relative=1
applies_to=self
invert=0
arg0=1
arg1=0
arg2=0
arg3=0
arg4=16777215
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=1
applies_to=self
invert=0
arg0=1
arg1=0
arg2=0
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
action_id=603
applies_to=self
*/
sound_play(sndTimeDecrease)
if global.game_time>5000
global.game_time-=5000
else
global.game_time=0
