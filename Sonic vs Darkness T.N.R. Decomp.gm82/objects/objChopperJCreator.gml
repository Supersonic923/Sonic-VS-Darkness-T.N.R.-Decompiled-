#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=room=rmRAD
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndRadJet)

v=instance_create(view_xview-300,view_yview+50,objRadJet)
v2=instance_create(view_xview-600,view_yview+50,objRadJet)

v.p=true
v2.p=true
with v
path_end()
with v2
path_end()

v.hspeed=21
v2.hspeed=21
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objChopperFishJ
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
