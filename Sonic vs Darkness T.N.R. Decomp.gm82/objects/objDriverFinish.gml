#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
image_speed=0
if image_index=1{
tme=300
spd=10}
else{
tme=600
spd=17}
win=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index=1
y+=spd
else
x+=spd

if spd>0
spd-=.35
if spd<0{
if image_index=0{
sound_play(sndComboComplete2)}
else
sound_play(sndMenuBlocked)
}
if spd<0
spd=0

tme-=1
if tme<=0 && image_index=1
y+=10
else if tme<=0
x+=10

if image_index=0 && tme<450{
if !instance_exists(objARCADEComplete)
instance_create(0,0,objARCADEComplete)
visible=false}

if tme<-60{
instance_create(0,0,objWhiteFlash)
global.arcade=false
global.HUB=true
instance_create(0,0,objSaving)
sound_stop(sndCarEngine)
room_goto(rmHUBArcade)//room_restart()
}
