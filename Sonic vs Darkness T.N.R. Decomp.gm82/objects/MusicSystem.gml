#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Music/SFX and StartUp
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var sizeinms;
//////////////////////
//Simple setup
//On Game Start

LoadFMOD();
FMODinit(100);
initGMSEmulate(500);

//using a password
//FMODSetPassword("password");

global.mute=false

global.EFF=0
global.EFF2=0
global.EFFS=0
global.EFFD=0

global.ADD=0

change=false
noloop=false

unfademusic=81
fademusic=false
fade=false
fade2=false
maxv=0

delay=-1

//To load sounds
//levels
//show_message("SFX loaded")

beach = 0//FMODSoundAdd("music/SA_HUB.ogg",false,true);
test = 0//FMODSoundAdd("music/SA_Neo.ogg",false,true);
hub = 0
night = 0
sun = 0
snow = 0 // loop point =
train = 0
shop = 0
//others

boss=0
boss2=0

otherbgm = 0//FMODSoundAdd("music/SA_Default.ogg",false,true);
intro = 0//FMODSoundAdd("music/SA_StartMenu.ogg",false,true);
menu = 0//FMODSoundAdd("music/SA_MainMenu.ogg",false,true);
green = 0//FMODSoundAdd("music/SA_Green.ogg",false,true);
rad = 0//FMODSoundAdd("music/SA_Rad.ogg",false,true);
mini = 0//FMODSoundAdd("music/SA_Mini.ogg",false,true);
mini2 = 0//FMODSoundAdd("music/SA_Mini2.ogg",false,true);
mini3 = 0//FMODSoundAdd("music/SA_Mini3.ogg",false,true);
minimenu = 0//FMODSoundAdd("music/SA_MiniMenu.ogg",false,true);
gmover = 0

serene=0

global.RES = 0
global.RES1= 0//FMODSoundAdd("music/SvD_Result1.ogg",false,true);
global.RES2= 0//FMODSoundAdd("music/SvD_Result2.ogg",false,true);
global.RES3= 0

global.DROWN = 0//FMODSoundAdd("music/SP_Drown.ogg",false,true);
global.INV = 0//FMODSoundAdd("music/SvD_Invincible.ogg",false,true);
//global.SPEED = 0//FMODSoundAdd("music/SA_SpeedUp.ogg",false,true);
global.RAIL = 0//FMODSoundAdd("music/RAIL.pch",false,true);
global.COM = 0//FMODSoundAdd("music/SvD_Complete.ogg",false,true);
global.SUP = 0
//global.PED = 0//FMODSoundAdd("music/SA_Pedestrians.ogg",false,true);
//global.PED2 = 0//FMODSoundAdd("music/SA_Arcade.ogg",false,true);

//show_message("Music loaded")

//sizeinms = FMODSoundGetLength(global.COM)
//FMODSoundSetLoopPoints(global.COM,14157/sizeinms,1);

//FMODSoundSetMaxVolume(global.RAIL,.3);
/*
//game background music
FMODSoundSetGroup(global.SPEED,2);
FMODSoundSetGroup(global.ADD,3);
FMODSoundSetGroup(global.COM,3);
FMODSoundSetGroup(global.RES1,3);
FMODSoundSetGroup(global.RES2,3);
FMODSoundSetGroup(global.DROWN,4);
FMODSoundSetGroup(global.INV,1);

//To set the volume to 80%
FMODSoundSetMaxVolume(global.SPEED,.48);
FMODSoundSetMaxVolume(global.ADD,.4);
FMODSoundSetMaxVolume(global.DROWN,.55);
FMODSoundSetMaxVolume(global.INV,.55);

FMODSoundSetMaxVolume(global.PED,.4);
FMODSoundSetMaxVolume(global.PED2,.4);
FMODSoundSetMaxVolume(global.COM,.5);
FMODSoundSetMaxVolume(global.RES1,.54);
FMODSoundSetMaxVolume(global.RES2,.54);

FMODGroupSetVolume(2,global.musicvolume)
FMODGroupSetVolume(3,global.musicvolume)
FMODGroupSetVolume(4,global.musicvolume)
FMODGroupSetVolume(1,global.musicvolume)



if global.mute=false{
FMODGroupSetMuted(2,0)
FMODGroupSetMuted(3,0)
FMODGroupSetMuted(4,0)
FMODGroupSetMuted(1,0)}
else{
FMODGroupSetMuted(2,1)
FMODGroupSetMuted(3,1)
FMODGroupSetMuted(4,1)
FMODGroupSetMuted(1,1)}
*/

//Play the music
global.BGM = ""
global.BGMD = ""
global.BGMINV = ""
global.BGMS = ""
global.BGMR = ""
global.BGMP = ""
global.BGMP2 = ""

global.filter=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// BGM Fading
if fademusic=true{
FMODGroupFadeVolume(3,0,80)}

if fademusic=true{
if unfademusic>0
unfademusic-=1}

if unfademusic=0{
fademusic=false
unfademusic=81
FMODInstanceStop(global.BGM)
FMODGroupFadeVolume(3,1,1)}

// music play delay at beginning of room change
if delay>0
delay-=1
if delay=0
{
if noloop=true{
noloop=false
global.BGM = FMODSoundPlay(global.ADD);}
else
global.BGM = FMODSoundLoop(global.ADD);
delay=-1
}


if fade2=true || (fade=true && FMODInstanceIsPlaying(global.BGMP2)){
FMODInstanceFadeVolume(global.BGMP2, 1, 0,room_speed, 0)
fade2=false}
if fade=true{
FMODInstanceFadeVolume(global.BGMP, 1, 0,room_speed, 0)
fade=false}

if FMODInstanceGetVolume(global.BGMP)=0
FMODInstanceStop(global.BGMP)
if FMODInstanceGetVolume(global.BGMP2)=0
FMODInstanceStop(global.BGMP2)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//On Sound Controller end Step
FMODUpdate();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Automated Sound Pan/Volume
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if global.soundbank!=global.soundbank[0]
global.soundbank[1]=global.soundbank
else
global.soundbank[0]=global.soundbank
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//On Game End
//to free the sounds
FMODAllStop()
FMODSoundFree(global.ADD);
FMODSoundFree(global.DROWN);
FMODSoundFree(global.INV);
FMODSoundFree(global.RAIL);
FMODSoundFree(global.COM);
FMODSoundFree(global.DROWN);
FMODSoundFree(global.SUP);
FMODSoundFree(global.RES1);
FMODSoundFree(global.RES2);
sound_stop_all();
sound_free_all();
//to free the system
FMODfree();
UnloadFMOD();
//Simple setup end
////////////////////////
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Normal Music
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var sizeinms;
if room!=rmLOADING && room!=rmPause && room!=rmPauseArcade && room!=TestIntro && room!=STARTUP && room!=Setup && room!=rmPlayer
&& room!=ExtendIntro && room!=rmUnlock && room!=rmGameIntro{
//To load sounds
if room=rmStartMenu{
if intro = 0
intro = FMODSoundAdd("music/SvD_StartMenu.ogg",false,true);
if global.ADD != intro{
change=true
global.ADD = intro
//sizeinms = FMODSoundGetLength(global.ADD)
FMODSoundSetLoopPoints(global.ADD,0,1);//FMODSoundSetLoopPoints(global.ADD,2199/sizeinms,1- (1/sizeinms * .1));
maxv=.6}}//maxv=.4}}

else if room=rmItemShop{
if shop=0
shop = FMODSoundAdd("music/SvD_ItemShop.ogg",false,true);
if global.ADD != shop{
change=true
global.ADD = shop
sizeinms = FMODSoundGetLength(global.ADD)
delay=25
FMODSoundSetLoopPoints(global.ADD,safe_division(1154,sizeinms),1);//6569 4 b, 11995 4 b2
maxv=.54
}}

else if room=rmHUB{
if hub=0
hub = FMODSoundAdd("music/SvD_Base.ogg",false,true);
if global.ADD != hub{
change=true
global.ADD = hub
sizeinms = FMODSoundGetLength(global.ADD)
delay=50
FMODSoundSetLoopPoints(global.ADD,safe_division(6569,sizeinms),1);//6569 4 b, 11995 4 b2
maxv=.3
}}

else if room=rmTRAIN || room=rmFreeze{
if train=0
train = FMODSoundAdd("music/SvD_Train.ogg",false,true);
if global.ADD != train{
change=true
global.ADD = train
sizeinms = FMODSoundGetLength(global.ADD)
delay=50
FMODSoundSetLoopPoints(global.ADD,27173/sizeinms,1);//18350
maxv=.5
}}

else if room=rmNIGHT||room=rmNIGHT2||room=rmTEST{
if night=0
night = FMODSoundAdd("music/SvD_Night.ogg",false,true);
if global.ADD != night{
change=true
global.ADD = night
sizeinms = FMODSoundGetLength(global.ADD)
delay=50
FMODSoundSetLoopPoints(global.ADD,8060/sizeinms,1); //old 27273
maxv=.68
}}

else if room=rmSUNLIGHT||room=rmSUNLIGHT2{
if sun=0
sun = FMODSoundAdd("music/SvD_Sun.ogg",false,true);
if global.ADD != sun{
change=true
global.ADD = sun
sizeinms = FMODSoundGetLength(global.ADD)
delay=50
FMODSoundSetLoopPoints(global.ADD,12933/sizeinms,1);
maxv=.52
}}
/*
else if room=rmWINTER{
if winter=0
winter = FMODSoundAdd("music/SvD_Snow.ogg",false,true);
if global.ADD != winter{
change=true
global.ADD = winter
sizeinms = FMODSoundGetLength(global.ADD)
delay=50
FMODSoundSetLoopPoints(global.ADD,33276/sizeinms,1);
maxv=.68
}}*/

else if room=rmBOSSRUN{
if boss=0
boss = FMODSoundAdd("music/SvD_Boss.ogg",false,true);
if global.ADD != boss{
change=true
global.ADD = boss
sizeinms = FMODSoundGetLength(global.ADD)
delay=50
FMODSoundSetLoopPoints(global.ADD,22450/sizeinms,1);//9291
maxv=.69//55
}}

else if room=rmSUNLIGHTB{
if boss2=0
boss2 = FMODSoundAdd("music/SvD_Boss2.ogg",false,true);
if global.ADD != boss2{
change=true
global.ADD = boss2
sizeinms = FMODSoundGetLength(global.ADD)
delay=50
FMODSoundSetLoopPoints(global.ADD,56824/sizeinms,1);//9291
maxv=.54
}}

else if room=rmBEACH{
if beach=0
beach = FMODSoundAdd("music/SP_Beach.ogg",false,true);
if global.ADD != beach{
change=true
global.ADD = beach
sizeinms = FMODSoundGetLength(global.ADD)
FMODSoundSetLoopPoints(global.ADD,3097/sizeinms,1- (1/sizeinms*5292));//117418));
maxv=.65
}}

else if room=rmTEST2 || room=rmNEO{
if test=0
test = FMODSoundAdd("music/SP_Ess.ogg",false,true);
if global.ADD != test{
change=true
global.ADD = test
sizeinms = FMODSoundGetLength(global.ADD)
FMODSoundSetLoopPoints(global.ADD,11454/sizeinms,1);//FMODSoundSetLoopPoints(global.ADD,16000/sizeinms,1);
maxv=.5 //.7 wrong .4 old
}}

else if room=rmTEST2 || room=rmSUN{
if test = 0
test = FMODSoundAdd("music/SP_Ess.ogg",false,true);
if global.ADD != test{
change=true
global.ADD = test
sizeinms = FMODSoundGetLength(global.ADD)
FMODSoundSetLoopPoints(global.ADD,6426/sizeinms,1);
maxv=.5}}

else if room=rmGameOver{
if gmover=0
gmover = FMODSoundAdd("music/SvD_GameOver.ogg",false,true);
if global.ADD != gmover{
change=true
noloop=true
global.ADD = gmover
FMODSoundSetLoopPoints(global.ADD,0,1);
maxv=.5
}}
/*
else{
if otherbgm = 0
otherbgm = FMODSoundAdd("music/SA_Grind.ogg",false,true);
if global.ADD != otherbgm{
change=true
global.ADD = otherbgm
FMODSoundSetLoopPoints(global.ADD,0,1);
maxv=.4}}*/
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Scene Music
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var sizeinms;
if room=scnSUNLIGHT_E{
if serene=0
serene = FMODSoundAdd("music/SvD_ScSerene.ogg",false,true);
if global.ADD != serene{
change=true
global.ADD = serene
//sizeinms = FMODSoundGetLength(global.ADD)
delay=25
FMODSoundSetLoopPoints(global.ADD,0,1);//6569 4 b, 11995 4 b2
maxv=.3
}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Setup
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if change=true
{
fademusic=false
unfademusic=81
FMODInstanceStop(global.BGM)
FMODGroupFadeVolume(3,global.musicvolume,1)
FMODSoundSetGroup(global.ADD,3);
FMODSoundSetMaxVolume(global.ADD,maxv);
if delay=-1{
if noloop=true{
noloop=false
global.BGM = FMODSoundPlay(global.ADD);}
else
global.BGM = FMODSoundLoop(global.ADD);
}
change=false
}
