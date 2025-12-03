#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=place_meeting(x,y,objBallMove)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pth_BobLR01
arg1=3
arg2=3
arg3=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=place_meeting(x,y,objBallMove2)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pth_BobUD01
arg1=3
arg2=3
arg3=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if path_index!=-1
path_position=choose(0,1)

angle=0

if !variable_local_exists("spd")
spd=4

if !variable_local_exists("xmove")
xmove=false

if !variable_local_exists("ymove")
ymove=false

if !variable_local_exists("ypos")
ypos="top"

if !variable_local_exists("ydis")
ydis=100


if ypos="top"
ystart+=ydis

if ypos="bottom"
ystart-=ydis
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xmove=true || ymove=true
angle+=spd


if ymove=true
y=ystart+lengthdir_y(ydis,angle)

if xmove=true
x=xstart+lengthdir_x(ydis,angle)
