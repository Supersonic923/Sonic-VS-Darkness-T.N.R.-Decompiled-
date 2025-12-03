#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.drowned=false
vspeed=-7;
gravity=0.175;
objPlayer.shield=0;
if global.xbox=true
joystick_rumble(0,0,0)
hitrumble=75
if global.drowned=false{
sound_play(sndHurt);
sound_play(choose(vcHurtV,vcHurt2V));}
else
sound_play(sndObore)
image_speed=.3
startover=false
gety=y
look_shift_y=0
if FMODInstanceIsPlaying(global.BGMD)
{
    FMODInstanceStop(global.BGMD)
    FMODGroupSetPaused(3,0)
}
if FMODInstanceIsPlaying(global.BGMINV)
{
    FMODInstanceStop(global.BGMINV)
    FMODGroupSetPaused(3,0)
}
if FMODInstanceIsPlaying(global.BGMS)
{
    FMODInstanceStop(global.BGMS)
    FMODGroupSetPaused(3,0)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=301
relative=0
applies_to=self
invert=0
arg0=230
arg1=0
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=startover=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=712
invert=0
arg0=-1
arg1=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.sound_fan=0
global.sound_wfall=0
global.sound_fountain=0
global.sound_air=0
global.sound_tair=0
global.sound_spinner=0

sound_stop_all()
with objFadeOut
back=true
FMODInstanceStop(global.BGMR)
sound_fxfree()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=223
invert=0
arg0=0
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
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=startover=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objCheckpointClosed)
objCheckpointClosed.persistent=false

global.sound_fan=0
global.sound_wfall=0
global.sound_fountain=0
global.sound_air=0
global.sound_tair=0
global.sound_spinner=0

global.start_x = -1;
global.start_y = -1;
global.trans_x = -1
global.trans_y = -1
sound_stop_all()
FMODInstanceStop(global.BGMR)
with objFadeOut
back=true
sound_fxfree()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=223
invert=0
arg0=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if vspeed>8
vspeed=8
hitrumble-=1
if hitrumble>0{
if global.xbox=true
joystick_rumble(0,.5,.5)}
else{
if global.xbox=true
joystick_rumble(0,0,0)}

if alarm[0]=80
instance_create(view_xview,view_yview,objFadeOut)
if lives>0{
if alarm[0]=40 && global.HUB=false{
global.died=true
lives-=1}}
else{
if alarm[0]=40{
lives = 3
startover=true}}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=3
