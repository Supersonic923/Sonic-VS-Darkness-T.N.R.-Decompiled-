#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=false
global.pausereturn=false
first=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=true{
if keyboard_check(vk_left) && x>122 x-=5
if keyboard_check(vk_right) && x<512 x+=5}

if instance_exists(objBoomerang){
sprite_index=sprBoomerangH2
first=false
}
else if objDriverHUD.booms<4 && first=false{
sprite_index=sprBoomerangH
first=true
sound_play(sndPoleCatch)}

//ALT Buttons
if global.a_button=true{
keyboard_key_press(vk_space)
keyboard_key_release(vk_space)
global.a_button=false
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pausereturn=true{
global.pausereturn=false
instance_create(0,0,objWhiteFlash)
global.arcade=false
global.HUB=true
room_goto(rmHUBArcade)
}
room_persistent=false
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objSaving) && !instance_exists(objFadeOut)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=go=true && !instance_exists(objDriverFinish)
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
sound_pause_all()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
joystick_rumble(0,0,0)
FMODGroupSetPaused(3,1)
FMODGroupSetPaused(2,1)
FMODGroupSetPaused(4,1)
FMODInstanceSetPaused(global.BGMR,1)
room_persistent=true;//Make the current room persistent so everything is the same when we come back
screen_save('pause_back.bmp');//Save the current screen to a file
room_goto(rmPauseArcade);//Go to the pause room
background_replace(bg_Pause,'pause_back.bmp',0,1);//Replace the pause room background with the newly saved image
file_delete('pause_back.bmp');//Delete the image file because we no longer need it
#define KeyPress_32
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objBoomerang) && go=true && objDriverHUD.booms<4 && !instance_exists(objDriverFinish)
instance_create(x,y-25,objBoomerang)
