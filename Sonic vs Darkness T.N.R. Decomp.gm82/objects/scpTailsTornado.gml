#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.4
bounce_angle=0

global.flyposx=0
global.flyposy=0

global.fly_off=false

next=0
frame=0
alarm[0]=345
sound_loop(sndTornadoFly)
dia_timer=0
Vol=1
fm_spd=.3
rp=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=BG Manipulation
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBGSUNLIGHT){
bakg=objBGSUNLIGHT
bakg2=3}

with bakg
{
    for(i=0;i<other.bakg2;i+=1)
    other.bget[i]=bg[i,5]
}
move_speed=10
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
next=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Fly Off
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.fly_off=true
with objDialogueCam
back=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bounce_angle+=2

if bounce_angle>=360
bounce_angle-=360

if frame>2 && frame<3
fm_spd=.15
else
fm_spd=.3

if next<2
frame+=fm_spd
else
frame-=fm_spd

if next=0 && frame>=2
frame=0

if next=1 && frame>=5
frame=3

if next=2 && frame<1{
next=0
frame=0}

if !instance_exists(objDialogue) && dia_timer>0
{
    dia_timer-=1
    if dia_timer=0{
    next=2
    alarm[1]=20}
}

if global.fly_off=true
{
    global.flyposx-=1.5
    global.flyposy-=.2
    if Vol>0
    Vol-=.005
    sound_volume(sndTornadoFly,Vol)
    sound_volume(sndBGWind,Vol)
    if rp=true
    FMODGroupFadeVolume(3,0,160)
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=BG Manipulation
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with bakg
{
    for(i=0;i<other.bakg2;i+=1)
    bg[i,5] = floor(other.move_speed)*(1-bg[i,3]);
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndTornadoFly)
sound_stop(sndBGWind)

if FMODInstanceIsPlaying(global.BGM){
FMODInstanceStop(global.BGM)
FMODGroupSetVolume(3,global.musicvolume)
rp=false}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,floor(image_index),floor(x+global.flyposx),floor(ystart+lengthdir_x(3,bounce_angle)+global.flyposy))
draw_sprite(scsTails_Pilot,floor(frame),floor(x+global.flyposx),floor(ystart+lengthdir_x(3,bounce_angle)+global.flyposy))
