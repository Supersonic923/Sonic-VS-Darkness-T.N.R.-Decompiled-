#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hit = 0;
touched = 0;
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=room=rmTEST || room=rmNIGHT
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=0
arg0=path_index!=pth_Pipe01
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!sound_isplaying(sndSpinDashCharge2)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndSpinDashCharge2)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
with objBoost
instance_destroy()
with objGBoost
instance_destroy()
with objHVBoost
instance_destroy()
with objBBoost
instance_destroy()
with objRBoost
instance_destroy()
action = action_pipe;
animation="rolling"
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=0
arg0=x_speed>10
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=other
invert=0
arg0=pth_Pipe01
arg1=x_speed
arg2=0
arg3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=other
invert=0
arg0=pth_Pipe01
arg1=10
arg2=0
arg3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=room=rmTEST2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=0
arg0=path_index!=pth_Pipe02
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!sound_isplaying(sndSpinDashCharge2)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndSpinDashCharge2)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
with objBoost
instance_destroy()
with objGBoost
instance_destroy()
with objHVBoost
instance_destroy()
with objBBoost
instance_destroy()
with objRBoost
instance_destroy()
action = action_pipe;
animation="rolling"
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=0
arg0=x_speed>10
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=other
invert=0
arg0=pth_Pipe02
arg1=x_speed
arg2=0
arg3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=other
invert=0
arg0=pth_Pipe02
arg1=10
arg2=0
arg3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
