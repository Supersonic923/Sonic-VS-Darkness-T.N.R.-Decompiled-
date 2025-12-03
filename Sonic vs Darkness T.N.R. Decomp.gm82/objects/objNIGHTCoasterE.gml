#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.3
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=-(random(3)+5)
hit=false

extime = choose(50,45,35,40,55);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if hit=true{
extime-=1

if extime<25{
if hspeed>10
hspeed-=.5
if hspeed<-10
hspeed+=.5
}
image_angle+=hspeed*1.5

}

else
{
if hspeed>0
hspeed-=.005
}
#define Collision_objPlatform
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objExplosionGround
arg1=x
arg2=other.y+20
*/
#define Collision_objBoostPar
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if hit=false{
global.camshake=50
global.camlength=15
sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3))

vspeed=(random(5)+3)*-1

hspeed=random_range(18,22)

if global.boost>5
global.boost-=5
else
global.boost=0

hit=true}
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=y>view_yview+view_hview
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
