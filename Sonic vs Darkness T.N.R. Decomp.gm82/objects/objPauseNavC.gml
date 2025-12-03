#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//ALT Buttons
if global.b_button=true{
keyboard_key_press(vk_backspace)
keyboard_key_release(vk_backspace)
global.b_button=false
}
#define Trigger_press Enter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var op;
if image_index=0{
sound_play(sndMenuBack)
instance_create(objPauseCon.x,objPauseCon.y,objPause)
with objPauseCon
instance_destroy()
with objPauseMC
instance_destroy()
with objPauseNavC
instance_destroy()}

if image_index=1
{
if global.pausechoice="restart"
{
if global.c_room=rmTRAIN{
global.destination=rmTRAIN
global.room_change=rmQuickLoad}
else
global.room_change=TestIntro
sound_play(sndMenuAccept)
op=instance_create(0,0,objFadeOut)
op.alph=-.05
global.loadlevel=0
global.room_lag=true
}
if global.pausechoice="hub"
{
global.room_change=rmHUB
sound_play(sndMenuConfirm)
op=instance_create(0,0,objFadeOut)
op.alph=-.05
global.loadlevel=1
}
if global.pausechoice="save"
{
sound_play(sndMenuAccept)
instance_create(x,y,objPauseSav)
with objPauseCon
instance_destroy()
with objPauseMC
instance_destroy()
with objPauseNavC
instance_destroy()
}

if global.pausechoice="quit"
{
global.room_change=rmStartMenu{
sound_play(sndMenuAccept)
op=instance_create(0,0,objFadeOut)}
op.alph=-.05
//MusicSystem.fade=true
global.loadlevel=1
}

if global.pausechoice!="save"{
if !FMODInstanceIsPlaying(global.BGMD) && !FMODInstanceIsPlaying(global.BGMINV) && !FMODInstanceIsPlaying(global.BGMS)
FMODGroupSetPaused(3,0)

if FMODInstanceIsPlaying(global.BGMR)
FMODInstanceSetPaused(global.BGMR,0)

FMODGroupSetPaused(4,0)
FMODGroupSetPaused(2,0)
instance_create(0,0,objPauseFade)
room_goto(global.c_room)}
}
#define Trigger_press Menu A
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var op;
if image_index=0{
sound_play(sndMenuBack)
instance_create(objPauseCon.x,objPauseCon.y,objPause)
with objPauseCon
instance_destroy()
with objPauseMC
instance_destroy()
with objPauseNavC
instance_destroy()}

if image_index=1
{
if global.pausechoice="restart"
{
if global.c_room=rmTRAIN{
global.destination=rmTRAIN
global.room_change=rmQuickLoad}
else
global.room_change=TestIntro
sound_play(sndMenuAccept)
op=instance_create(0,0,objFadeOut)
op.alph=-.05
global.loadlevel=0
global.room_lag=true
}
if global.pausechoice="hub"
{
global.room_change=rmHUB
sound_play(sndMenuAccept)
op=instance_create(0,0,objFadeOut)
op.alph=-.05
global.loadlevel=1
}
if global.pausechoice="save"
{
sound_play(sndMenuConfirm)
instance_create(x,y,objPauseSav)
with objPauseCon
instance_destroy()
with objPauseMC
instance_destroy()
with objPauseNavC
instance_destroy()
}

if global.pausechoice="quit"
{
global.room_change=rmStartMenu{
sound_play(sndMenuAccept)
op=instance_create(0,0,objFadeOut)}
op.alph=-.05
//MusicSystem.fade=true
global.loadlevel=1
}

if global.pausechoice!="save"{
if !FMODInstanceIsPlaying(global.BGMD) && !FMODInstanceIsPlaying(global.BGMINV) && !FMODInstanceIsPlaying(global.BGMS)
FMODGroupSetPaused(3,0)

if FMODInstanceIsPlaying(global.BGMR)
FMODInstanceSetPaused(global.BGMR,0)

FMODGroupSetPaused(4,0)
FMODGroupSetPaused(2,0)
instance_create(0,0,objPauseFade)
room_goto(global.c_room)}
}
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index!=1
sound_play(sndMenuCursor)

if image_index=0
image_index=1
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index!=0
sound_play(sndMenuCursor)

if image_index=1
image_index=0
#define Trigger_press Menu S
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndMenuBack)
instance_create(objPauseCon.x,objPauseCon.y,objPause)
with objPauseCon
instance_destroy()
with objPauseMC
instance_destroy()
with objPauseNavC
instance_destroy()
