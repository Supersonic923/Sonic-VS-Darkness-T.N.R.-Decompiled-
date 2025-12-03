#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
wipe=false
y=-100
ymove=0
xmove=-412
getx=406
getx2=x-60
gety=0
go=false
drawalpha=-2
title=sprTitleIntro

/*if title=sprTitleTest
banner=0
else if title=sprTitleTest2
banner=1
else*/
banner=0

spd=12.88 //12.8 and 12.9
spd2=0

if global.destination=rmSUNLIGHT || global.destination=rmSUNLIGHT2 || global.destination=rmSUNLIGHTB
level=1
else
level=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objActSign
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objActBadge
arg1=x
arg2=y
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objRotateBG){
if objRotateBG.tolevel=-200
go=true}

if spd>.2
spd-=.2
else
spd=.1

if go=true
spd2+=.2

if go=false
{
if drawalpha<2
drawalpha+=.1
//if xmove<0
xmove+=spd
//else
//xmove=0
}
else
{
xmove+=spd2
drawalpha-=.05
if drawalpha=0
instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(title,level,view_xview+getx+xmove-15,view_yview+76,1,1,0,c_white,drawalpha)
