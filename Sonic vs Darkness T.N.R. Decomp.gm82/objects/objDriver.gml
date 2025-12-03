#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
angle=0
image_speed=.3
acc=0
vert=0
place=1
add=0
tme=6
global.pausereturn=false
go=false

cam=instance_create(x,y,objDriverCamera)
finish=false


sound_loop(sndCarEngine)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
depth=vert

//ALT Buttons
if global.a_button=true{
keyboard_key_press(vk_space)
keyboard_key_release(vk_space)
global.a_button=false
}

if (keyboard_check(vk_space)!=true && global.holda_button!=true) && sound_isplaying(sndCarHorn)
sound_stop(sndCarHorn)

if keyboard_check(vk_right) && acc<20 && go=true
acc+=.2
else if acc<.5
acc=0
else if acc>0 && (!keyboard_check(vk_right) || go=false)
acc-=.5

if acc<0
acc=0

x+=acc

angle-=acc

if acc>10
image_speed=.5
else
image_speed=.3

if keyboard_check_pressed(vk_up) && vert<2 && acc>10 && !place_meeting(x,y-8,objDriver2){
vert+=1
add=-7.5
}

if keyboard_check_pressed(vk_down) && vert>0 && acc>10 && !place_meeting(x,y+8,objDriver2){
vert-=1
add=7.5
}

y+=add

if abs(add)=7.5
tme-=1

if tme=0
{
add=0
tme=6
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if abs(acc)<2{ pitch=1}
    if abs(acc)>=2 && abs(acc)<19{ pitch=abs(acc)/2/10+1}
    if abs(acc)>=20{ pitch=2}
    FMODInstanceSetPitch(global.fgetloop,(pitch))
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cam.x=x+150
cam.y=y
#define Collision_objDriver2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if depth=other.depth
{
if x<other.x && acc>5{
sound_play(sndCarCrash)
sound_play(choose(snd,snd,sndCarHorn2))
acc=0}
if x>other.x && go=true && acc>5
other.acc=0
}
#define Collision_objDriverCheckPoint
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objDriverHUD
laps+=1
with instance_nearest(x,y,objDriverLightD)
image_index=3
sound_play(sndDriverCheckPoint)
with other
instance_destroy()
#define Collision_objDriverFinishLine
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var v;
if finish=false{
global.stoptime=true
if place=1
{
v=instance_create(view_xview-100,90,objDriverFinish)
v.image_index=0}
else
{
v=instance_create(view_xview+320,-20,objDriverFinish)
v.image_index=1
v.tme=300
v.spd=10}
finish=true}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=false
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
sound_stop(sndCarEngine)
room_goto(rmHUBArcade)
}
room_persistent=false
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,x,y)
draw_sprite_ext(sprDriverWheels,0,x-49,y+12,1,1,angle,c_white,1)
draw_sprite_ext(sprDriverWheels,0,x+59,y+12,1,1,angle,c_white,1)
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
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objDriverFinish) && !instance_exists(objDEStart)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndCarHorn)
sound_play(sndCarHorn)
