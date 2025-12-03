#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=choose(0,1)
depth=-.9
alarm[0]=5
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objMonBreak
arg1=x+25
arg2=y+25
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeat(choose(4,5,6))instance_create(x+25,y+25,objBoxPieces)
x=x+25
y=y+25
sound_stop(sndCrateSmash)
sound_play(sndCrateSmash)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
depth=-1
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=0
arg0=action=action_stomping || animation="crouch_slide" || instance_exists(objGBoost)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
