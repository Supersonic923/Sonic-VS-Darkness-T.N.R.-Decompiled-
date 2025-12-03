#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xmove=0
ymove=120
image_speed=.2
alarm[0]=120
stop=false
shoot=true
chose=0
lazer=false
charge=60
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objExplode
arg1=x
arg2=y
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if shoot=true{
chose=choose(1,2)
if chose=1{
instance_create(x,y,objChaserMissile)
alarm[0]=120}
if chose=2{
lazer=true
alarm[0]=300}
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if stop=false{
x=view_xview+xmove
y=view_yview+ymove
if instance_exists(objPlayer){
if xmove<300
xmove+=20
if xmove>=300 && xmove<400
xmove+=10
if xmove>=400 && xmove<500
xmove+=5
if xmove>=500 && xmove<550
xmove+=2}
else
{
xmove+=20
}}

if lazer=true
{
if charge>0 && ymove<220
ymove+=10
if charge=60
instance_create(x,y,objChaserCharge)
if charge>0
charge-=1
if charge=0{
with objChaserCharge
instance_destroy()
instance_create(x,y,objChaserBlast)
sound_stop(sndLazerCharge)
sound_play(sndLazerShoot)
charge=60
lazer=false}
}
if lazer=false && !instance_exists(objChaserBlast)
if ymove>120
ymove-=10

if place_meeting(x,y+20,objEGDraw)
instance_destroy()
#define Collision_objEggDestroyer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if stop=false
{
with objPlayer{
boostcam=true
hitcam=true}
sound_play(choose(sndEnemyBreak,sndEnemyBreak2))
stop=true
}
