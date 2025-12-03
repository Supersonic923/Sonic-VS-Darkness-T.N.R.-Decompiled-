#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tme=0
vspeed=0
hspeed=0
gravity=.4
direction=270
image_angle=60
stop=false
image_speed=.1
sound_play(sndChopperAppear)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if tme=0
{
vspeed=-20
tme=99
image_angle=60
sound_play(sndBigSplash)
if stop=true
instance_destroy()
}
image_angle-=1
tme-=1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if objPlayer.x_speed>19
hspeed=objPlayer.x_speed
else
hspeed=20
}
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
