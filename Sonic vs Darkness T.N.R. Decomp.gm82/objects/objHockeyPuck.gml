#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
MassInit();
RotationInit();
spd=0
spd2=0
global.pausereturn=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objHockeyBG){
if keyboard_check(vk_up){
if spd<7
spd+=1
y-=spd}
if keyboard_check(vk_down){
if spd<7
spd+=1
y+=spd}

if keyboard_check_released(vk_up) || keyboard_check_released(vk_down)
spd=0


if keyboard_check(vk_left){
if spd2<7
spd2+=1
x-=spd2}
if keyboard_check(vk_right){
if spd2<7
spd2+=1
x+=spd2}

if keyboard_check_released(vk_left) || keyboard_check_released(vk_right)
spd2=0

}
#define Collision_objHockeyCeiling
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=yprevious
#define Collision_objHockeyLimit
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=xprevious
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
arg0=!instance_exists(objHockeyMadness) && !instance_exists(objGameSet)
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
#define KeyPress_82
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//room_restart()
