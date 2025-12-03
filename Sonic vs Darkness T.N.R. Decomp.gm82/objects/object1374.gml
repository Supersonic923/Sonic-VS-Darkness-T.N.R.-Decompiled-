#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d=0

if !variable_local_exists("ignore")
ignore=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if d>0
d-=1

image_index=(global.motion_time)*.018
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ignore=false{
if place_meeting(x,y,objWaterfallSlideT) && d=0 && other.action=other.action_pipe
{
with other{
x=other.x
y=other.y
tun_d=""
phase=false
action=action_waterfall
animation="waterfall3"
nomovet=20
x_speed=0
y_speed=0}
d=20
}
else if d=0 && other.action=other.action_pipe
{
//Go Down
if place_meeting(x,y+20,objTunnelPar) && other.y_speed>=0
other.tun_d="down"

//Go Up
if place_meeting(x,y-20,objTunnelPar) && other.y_speed<=0
other.tun_d="up"

//Go Left
if place_meeting(x-20,y,objTunnelPar) && other.x_speed<=0
other.tun_d="left"

//Go Right
if place_meeting(x+20,y,objTunnelPar) && other.x_speed>=0
other.tun_d="right"


sound_play(sndSpinDashCharge2)

other.x=x-other.x_speed
other.y=y-other.y_speed
x_speed=0
y_speed=0

d=20
}
}
