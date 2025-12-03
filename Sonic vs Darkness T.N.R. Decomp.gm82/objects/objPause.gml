#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
image_speed=0
if global.xbox=true
joystick_rumble(0,0,0)

if global.HUB=true
index=1
else if global.TUT=true || global.time_attack=true
index=2
else
index=0

if index=0
index2=0
else
index2=1

alpha=0

ymov=0
ymov2=1

alpha2=-1
alpha3=-2

alpha4=0
alpha5=-1
alpha6=-2

pausechoice=0
pausechoice2=1
confirm=false

selection=""

leave=false
menu=false

if index2=0
center=-12
else
center=-6
sound_play(sndPause)

if global.online_mode=true
with objPlayer
checknend=true
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if confirm=true
{
if selection="Restart"
{
if global.c_room=rmTRAIN{
global.destination=rmTRAIN
global.room_change=rmQuickLoad}
else
global.room_change=TestIntro
op=instance_create(0,0,objFadeOut)
op.alph=-.05
global.loadlevel=0
global.room_lag=true
}
if selection="Back To Base"
{
global.room_change=rmHUB
op=instance_create(0,0,objFadeOut)
op.alph=-.05
global.loadlevel=1
}
if selection="Quit Game"
{
global.room_change=rmStartMenu
op=instance_create(0,0,objFadeOut)
op.alph=-.05
global.loadlevel=1
if global.time_attack=true
global.time_attack=2
}

if !FMODInstanceIsPlaying(global.BGMD) && !FMODInstanceIsPlaying(global.BGMINV) && !FMODInstanceIsPlaying(global.BGMS)
FMODGroupSetPaused(3,0)

if FMODInstanceIsPlaying(global.BGMR)
FMODInstanceSetPaused(global.BGMR,0)

FMODGroupSetPaused(4,0)
FMODGroupSetPaused(2,0)
FMODGroupSetPaused(1,0)
sound_unpause_all()
instance_create(0,0,objPauseFade)
room_goto(global.c_room)
}
else
{
if !FMODInstanceIsPlaying(global.BGMD) && !FMODInstanceIsPlaying(global.BGMINV) && !FMODInstanceIsPlaying(global.BGMS)
FMODGroupSetPaused(3,0)

FMODGroupSetPaused(4,0)
FMODGroupSetPaused(2,0)
FMODGroupSetPaused(1,0)

sound_unpause_all()

if FMODInstanceIsPlaying(global.BGMR)
FMODInstanceSetPaused(global.BGMR,0)

if global.backtoreverb=true{
global.backtoreverb=false
global.reverb=true}
room_goto(global.c_room)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (confirm=false && alpha4<=0) && leave=false && menu=false{
if alpha<1
alpha+=.1

if alpha2<1
alpha2+=.1

if alpha3<1
alpha3+=.1}

else if (alpha4<=0)||leave=true||menu=true{
if alpha>0
alpha-=.1

if alpha2>-1
alpha2-=.1

if alpha3>-2
alpha3-=.1
}

if (alpha=0 && confirm=true) && leave=false && menu=false
{
if alpha4=0{
sound_play(sndPause)
pausechoice2=1
ymov2=1}

if alpha4<1
alpha4+=.1

if alpha5<1
alpha5+=.1

if alpha6<1
alpha6+=.1
}

if confirm=false||leave=true||menu=true
{
if alpha4>0
alpha4-=.1

if alpha5>-1
alpha5-=.1

if alpha6>-2
alpha6-=.1
}


// Inventory or Achievements
if (alpha=0 && menu=true) && leave=false && confirm=false
{
if selection="Achievements" && !instance_exists(objAchievementMenu)
instance_create(0,0,objAchievementMenu)
if selection="Inventory" && !instance_exists(objInventoryMenu)
instance_create(0,0,objInventoryMenu)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ymov=0
selection=""
if (ymov=1 && index=0) || (ymov=1 && index=2)
selection="Restart"
if (ymov=2 && index=0)
selection="Back To Base"
if (ymov=4 && index=0) || (ymov=3 && index=1) || (ymov=3 && index=2)
selection="Quit Game"
if (ymov=1 && index=1)
selection="Inventory"
if (ymov=3 && index=0) || (ymov=2 && index=1)
selection="Achievements"
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(.3)
if global.nds=true
draw_rectangle_color(view_xview[7],view_yview[7],view_wview,view_yview[0]+view_hview,c_black,c_black,c_black,c_black,0)
else
draw_rectangle_color(view_xview,view_yview,view_wview,view_hview,c_black,c_black,c_black,c_black,0)

draw_set_alpha(1)
// MENU
draw_sprite_ext(sprPauseMenu,index2,112+98,60+62+center,alpha,alpha,0,c_white,alpha)
// HIGHLIGHT
draw_sprite_blend_ext(sprPauseHighlight,0,162,111+12*ymov+center,1,1,0,c_white,alpha3,bm_add)
draw_sprite_ext(sprPauseHighlight,1,162,111+12*ymov+center,1,1,0,c_white,alpha3)
// WORDS
draw_sprite_ext(sprPauseMenuC,index,169,112+center,1,1,0,c_white,alpha2)


//**********************
// CONFIRM
//**********************

// MENU
draw_sprite_ext(sprPauseMenu,2,112+98,60+62,alpha4,alpha4,0,c_white,alpha4)
// HIGHLIGHT
draw_sprite_blend_ext(sprPauseHighlight,0,162,111+12+12*ymov2,1,1,0,c_white,alpha6,bm_add)
draw_sprite_ext(sprPauseHighlight,1,162,111+12+12*ymov2,1,1,0,c_white,alpha6)
// WORDS
draw_sprite_ext(sprPauseMenuC,3,169,112,1,1,0,c_white,alpha5)
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ymov>0{
ymov-=1
sound_play(sndMenuCursor)
alpha3=0
pausechoice-=1
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha4=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ymov2>0){
ymov2-=1
sound_play(sndMenuCursor)
alpha6=0
pausechoice2-=1
}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ymov<3&&index>0)||(ymov<4&&index=0){
ymov+=1
sound_play(sndMenuCursor)
alpha3=0
pausechoice+=1
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha4=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ymov2<1){
ymov2+=1
sound_play(sndMenuCursor)
alpha6=0
pausechoice2+=1
}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//***************************************
// Main Pause Confirm
//***************************************

if confirm=false{
sound_play(sndPause2)
leave=true
alarm[0]=15
alpha3=0}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha4=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
confirm=false
sound_play(sndPause2)
alpha6=0
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//***************************************
// Main Pause Confirm
//***************************************

// Confirm
if pausechoice=0{
sound_play(sndPause2)
alpha3=0
leave=true
alarm[0]=15}

// Inventory
else if (pausechoice=1 && index=1){
sound_play(sndMenuAccept)
alpha3=0
menu=true
//sound_play(sndMenuBack)
}

// Achievements
else if (pausechoice=3 && index=0)||(pausechoice=2 && index=1){
/*sound_play(sndMenuAccept)
alpha3=0
menu=true*/
sound_play(sndMenuBack)
}

// Are you sure? or Block
else if ((pausechoice=1||pausechoice=2||pausechoice=4) && index=0) ||
((pausechoice=3) && index=1) ||
((pausechoice=1||pausechoice=3) && index=2){
confirm=true
sound_play(sndMenuAccept)
alpha3=0}
else
sound_play(sndMenuBack)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha4=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if pausechoice2=1{
confirm=false
sound_play(sndPause2)
alpha6=0}
else
{
sound_play(sndMenuAccept)
leave=true
alarm[0]=15
alpha6=0
}
