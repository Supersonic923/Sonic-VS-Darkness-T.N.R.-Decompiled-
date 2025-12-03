#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y_angle = random(360)
y_speed = 5
y_amount = .2
pi2 = pi / 180
image_speed=.1

phase="stance"

getsign=0
fishspeed=4

yborder=ystart+10
yborder2=ystart-10


if instance_exists(objPlayer)
image_xscale=sign(x-objPlayer.x)
else
image_xscale=-1

alarm[0]=200

depth=choose(-10,-.5)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var dirc;
dirc=choose(1,-1)

if hspeed=0 && phase!="turn"
{
if phase="stance" && image_xscale!=dirc{
phase="turn"
getsign=dirc
alarm[0]=random(100)+100}
else
{
hspeed=fishspeed*dirc
shift=random_range(fishspeed,-fishspeed)/1.5
if (y>yborder && shift>0) || (y<yborder2 && shift<0)
shift*=-1
vspeed=shift
alarm[0]=random(100)+100
}
}
else
alarm[0]=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y_angle += y_speed
y_angle = y_angle mod 360
y += cos(y_angle * pi2) * y_amount

if hspeed>0
hspeed-=.1
if hspeed<0
hspeed+=.1

if vspeed>0
vspeed-=.1
if vspeed<0
vspeed+=.1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Avoid Player
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var shift;

if instance_exists(objPlayer){
if distance_to_point(objPlayer.x,objPlayer.y)<20 && hspeed=0 && phase!="turn"
{
if phase="stance" && image_xscale!=sign(x-objPlayer.x){
phase="turn"
image_index=2
getsign=sign(x-objPlayer.x)
alarm[0]=random(100)+100}
else
{
hspeed=fishspeed*sign(x-objPlayer.x)
shift=random_range(fishspeed,-fishspeed)/1.5
if (y>yborder && shift>0) || (y<yborder2 && shift<0)
shift*=-1
vspeed=shift
alarm[0]=random(100)+100
}
}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Sprite Control
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var shift;

if phase="stance"
{
image_speed=.1
if image_index+image_speed>=2
image_index=0
}

if phase="turn"
{
image_speed=.3

if image_index+image_speed>=5
{
image_index=0
phase="stance"
image_xscale*=-1

hspeed=fishspeed*getsign

shift=random_range(fishspeed,-fishspeed)/1.5
if (y>yborder && shift>0) || (y<yborder2 && shift<0)
shift*=-1
vspeed=shift
}
}
