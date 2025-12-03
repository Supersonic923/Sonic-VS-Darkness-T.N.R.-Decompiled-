#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
range=0

hit=false

extime = choose(50,45,35,40,55);
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.specialfx>1
*/
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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objWaterLine)
{
    if y>objWaterLine.y
    {
        vspeed=min(3,vspeed)
        gravity=.1
    }
    else
    gravity=.2
}
else
{
    gravity=.2
}
gravity_direction=270
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if hit=false
x=view_xview[0]+range



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
#define Collision_objSolid
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
arg2=other.y
*/
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objBoostPar)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with instance_create(x,y,objExplode)
sprite_index=sprExplosionBigger
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

if global.specialfx>1 && instance_exists(objPlayer)
instance_create(mean(x,objPlayer.x),mean(y,objPlayer.y),objImpact);

vspeed=(random(5)+3)*-1

hspeed=random_range(18,22)

if global.boost>10
global.boost-=10
else
global.boost=0

global.camshake=50
global.camlength=15

hit=true
alarm[0]=50}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if y>view_yview+240
instance_destroy()
