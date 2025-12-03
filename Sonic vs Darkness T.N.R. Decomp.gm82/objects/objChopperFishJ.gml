#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tme=60
vspeed=0
hspeed=0
image_angle=90
stop=false
spd=20
image_speed=0
image_index=0
y=2112
x=51168
chomp=0
sound_play(sndBigSplash)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pth_Chopper
arg1=spd
arg2=0
arg3=1
*/
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndHugeSplash)
sound_play(sndBigSplash)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if tme=0
{
if path_speed=4
image_angle-=.2
else if path_speed=20
image_angle-=1
else
image_angle-=.6
}
if tme>0
tme-=1

if chomp>0
chomp-=1
if chomp=79
sound_play(sndChopperCry)

if chomp=2{
image_index=1}

if chomp=1{
image_index=2
instance_create(x+160,y+20,objChompOff)
sound_play(sndChopperChomp)}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Collision_objParRail
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
