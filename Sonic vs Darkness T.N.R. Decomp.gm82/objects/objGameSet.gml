#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=10
alarm[0]=10
tme=300
win=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if spd!=0
instance_create(x,y,objGameSetTrail)
alarm[0]=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=spd

if spd>0
spd-=.35
if spd<0{
t=instance_create(x,y+70,objYouWL)
if win=true{
t.image_index=1
sound_play(sndComboComplete2)}
else
sound_play(sndMenuBlocked)
}
if spd<0
spd=0

tme-=1
if tme<=0
y+=10

if tme<-60{
instance_create(0,0,objWhiteFlash)
room_goto(rmHUBArcade)//room_restart()
}
