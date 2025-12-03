#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
change=0
go=false

tme=500
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=true{
tme-=1
if image_index!=7
image_index+=1
if image_index=5 && change!=20{
change+=1
image_index=0}
}

if image_index=7{
with objPlayer{
if ground=true{
x_speed=0
y_speed=0
goal=true
react=0
action=action_normal
animation="gresult"}
}
if !instance_exists(objARCADEComplete)
instance_create(0,0,objARCADEComplete)
}
if tme=0
{instance_create(0,0,objWhiteFlash)
global.arcade=false
global.HUB=true
instance_create(0,0,objSaving)
room_goto(rmHUBArcade)}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=(image_index=1 || image_index=6) && change>1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=33023
arg5=1
*/
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=go=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=33023
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndSignPost)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=true
global.stoptime=true
