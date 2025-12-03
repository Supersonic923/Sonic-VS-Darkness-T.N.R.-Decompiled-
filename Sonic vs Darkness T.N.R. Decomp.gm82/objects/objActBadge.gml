#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getx=600
gety=149

getx2=467
gety2=106
if global.player="Sonic"
act=0
else if global.player="Shadow"
act=1
else if global.player="Blaze"
act=2
else
act=0
go=false
drawalpha=-1
drawalpha2=1
flip=0

angle=0
spd=12.88
spd2=0
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
spd2-=.2

if go=false
{
//if getx2>55
getx2-=spd
//else
//getx2=55
if drawalpha<2
drawalpha+=.1
}
else
{
getx2+=spd2
drawalpha2-=.05
drawalpha-=.05
if drawalpha=0
instance_destroy()
}

flip+=.05
if flip=1
flip=-1

angle+=2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprNameSign,act,view_xview+353+getx2-10,view_yview+gety2,1,1,0,c_white,drawalpha)
