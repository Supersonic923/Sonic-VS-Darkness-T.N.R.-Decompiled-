#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=.9
MassInit();
RotationInit();
hspeed = choose(4,5,6)*choose(1,-1)
vspeed = choose(0,1,2,3,4)*choose(1,-1)
alarm[0]=5

sound_play(sndPuckLand)
sound_play(sndPuckHit)
re=0

unfreeze=10
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
arg4=65535
arg5=1
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if abs(hspeed)>7 || abs(vspeed)>7
instance_create(x,y,objHockeyTrail)
alarm[0]=5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if hspeed=0 && vspeed=0
unfreeze-=1
else
unfreeze=10
if unfreeze=0
{
hspeed=8
unfreeze=10
}

if re>0
re-=1

var(dir)=degtorad(point_direction(x,y,xprevious,yprevious));
var(xx)=cos(dir);
var(yy)=sin(dir);
if place_meeting(x,y,objHockeyPuckAI){
x+=xx;
y-=yy;
}

var(dir)=degtorad(point_direction(x,y,xprevious,yprevious));
var(xx)=cos(dir);
var(yy)=sin(dir);
if place_meeting(x,y,objHockeyPuck){
x+=xx;
y-=yy;
}

if hspeed>0&&hspeed<4
hspeed=4
if hspeed<0&&hspeed>-4
hspeed=-4

if vspeed>0&&vspeed<4
vspeed=4
if vspeed<0&&vspeed>-4
vspeed=-4

if hspeed>10
hspeed=10
if hspeed<-10
hspeed=-10

if vspeed>10
vspeed=10
if vspeed<-10
vspeed=-10
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*var i;

i=instance_nearest(x,y,objHockeyCeiling)

if place_meeting(x,y,objHockeyPuckAI){
x+=1}

if place_meeting(x,y,objHockeyPuck){
x-=1}
#define Collision_objHockeyPuck
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if(Towards()) CollisionBallOther();
if (JustHitR())
{
    CollisionRotationOther();
}
CollisionMoveAwayOther(1);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if re=0{
  re=5
  sound_play(choose(sndPuckWall,sndPuckWall2,sndPuckWall3))
  sound_play(sndPuckHit)}
else if distance_to_object(other)<10
re=5
#define Collision_objHockeyPuckAI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if(Towards()) CollisionBallOther();
if (JustHitR())
{
    CollisionRotationOther();
}
CollisionMoveAwayOther(1);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if re=0{
  re=5
  sound_play(choose(sndPuckWall,sndPuckWall2,sndPuckWall3))
  sound_play(sndPuckHit)}
else if distance_to_object(other)<10
re=5
#define Collision_objHockeyGoal
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=202
applies_to=self
invert=0
arg0=objHockeyBallD
arg1=1
*/
#define Collision_objHockeyCeiling
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=xprevious
  y=yprevious
  vspeed=-vspeed
  if re=0{
  re=5
  sound_play(choose(sndPuckWall,sndPuckWall2,sndPuckWall3))}
#define Collision_objHockeyWall
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=xprevious
  y=yprevious
  hspeed=-hspeed

  if re=0{
  re=5
  sound_play(choose(sndPuckWall,sndPuckWall2,sndPuckWall3))}
