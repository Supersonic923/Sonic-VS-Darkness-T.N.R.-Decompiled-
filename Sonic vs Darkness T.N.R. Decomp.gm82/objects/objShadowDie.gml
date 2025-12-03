#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.drowned=false
vspeed=-7;
gravity=0.175;
global.shield=0;
global.shieldlayer=0;
if global.xbox=true
joystick_rumble(0,0,0)
hitrumble=75
if global.drowned=false{
sound_play(vcRDie)
sound_play(sndHurt);}
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
action_id=603
applies_to=self
*/
if global.time_attack=false
alarm[0]=230
else
alarm[0]=160
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
arg0=startover=false && global.time_attack=false
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
global.boost=127

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
arg0=startover=true || global.time_attack=true
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
global.start_x = -1;
global.start_y = -1;
global.trans_x = -1
global.trans_y = -1

global.sound_fan=0
global.sound_wfall=0
global.sound_fountain=0
global.sound_air=0
global.sound_tair=0
global.sound_spinner=0

sound_stop_all()
FMODInstanceStop(global.BGMR)
with objFadeOut
back=true
startover=false
sound_fxfree()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=224
invert=0
arg0=rmGameOver
arg1=0
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
if global.xbox=true && global.controllervib=true
joystick_rumble(0,.5,.5)}
else{
if global.xbox=true && global.controllervib=true
joystick_rumble(0,0,0)}

if alarm[0]=80
instance_create(view_xview,view_yview,objFadeOut)

if lives<=0 && alarm[0]>=78 && instance_exists(objFadeOut) && global.online_mode=false && global.time_attack=false
alarm[0]=79

if instance_exists(objFadeOut) && alarm[0]=79
if objFadeOut.alph=1{
alarm[0]=1
lives = -1
startover=true}

if lives>0{
if alarm[0]=40 && global.HUB=false{
global.died=true
if global.online_mode=false && global.time_attack=false
lives-=1}}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=3
