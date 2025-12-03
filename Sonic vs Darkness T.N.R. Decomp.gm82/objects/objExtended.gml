#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.25
if global.player="Vermin"
sprite_index=sprExtendedV
else if global.player="Sonic"
sprite_index=sprExtendedSo
else if global.player="Shadow"
sprite_index=sprExtendedSh
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lives += 1;
sound_play(sndExtraLife);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objTrickSparkle
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=x
arg2=y
arg3=0
arg4=2678783
arg5=1
*/
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
other.drawone=100
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
