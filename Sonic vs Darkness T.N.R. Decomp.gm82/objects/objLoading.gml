#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


fade=1

xscale=20
yscale=20

stopmusic=60
commandfade=false

if instance_exists(objFadeOut)
if objFadeOut.commandfade=true
commandfade=true

rot=0
xmov=150
ymov=100
if global.xbox=true
joystick_rumble(0,0,0)

ds_list_clear(global.cpcontrol)

global.shield=0
global.shieldlayer=0

spd=0

global.backtoreverb=false

if global.loadlevel=0
timer=250
else if global.loadlevel=1
timer=300
else if global.loadlevel=2
timer=300

// SKIP THE BS LOADING TIME
timer=1
//sound_fxfree()
FMODEffectFree(global.EFF2)
global.EFF2=0
if global.EFF!=0 && global.filter=2
{
        FMODEffectFree(global.EFF)
        global.EFF=0
        global.filter=0
}
if global.EFF!=0 && global.filter=1
    {
        FMODEffectFree(global.EFF)
        global.EFF=0
        FMODEffectFree(global.EFFS)
        global.EFFS=0
        FMODEffectFree(global.EFFD)
        global.EFFD=0
        global.filter=0
    }
global.loadlevel=0

if global.room_change=TestIntro || commandfade=true
MusicSystem.fademusic=true
//stops other music
if FMODInstanceIsPlaying(global.BGMS)
FMODInstanceStop(global.BGMS)
if FMODInstanceIsPlaying(global.BGMINV)
FMODInstanceStop(global.BGMINV)
if FMODInstanceIsPlaying(global.BGMD)
FMODInstanceStop(global.BGMD)
if FMODInstanceIsPlaying(global.BGMR)
FMODInstanceStop(global.BGMR)
FMODGroupSetPaused(3,0)

//Load Rail SFX
if global.RAIL=0{
global.RAIL = FMODSoundAdd("sounds/sndRail.wav",false,true);//wav",false,true);
FMODSoundSetMaxVolume(global.RAIL,.3);}

with objFadeOut
{
visible=false
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//sound_play(sndLoading)

global.coins=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fade>0
fade-=.1

rot+=5

if xscale>1{
xscale-=2
yscale-=2}
else{
xscale=1
yscale=1}

if xmov<340
xmov+=20

if ymov<220
ymov+=20

spd+=.03

if timer>0
timer-=1

if timer=0{
sound_stop_all()
with objFadeOut{
visible=true
back=true}
with objWFadeOut{
back=true}
with objRFadeOut{
visible=true
back=true}
//if gms_vs_ready() && global.online_mode=true && objGOD.connect_online=true
//room_goto(global.room_change)
//else if global.online_mode=false || objGOD.connect_online=false
room_goto(global.room_change)
sound_play(sndLoadDone)}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.online_mode=false
instance_create(0,0,objSaving)//save_scr("game_save.ini")
