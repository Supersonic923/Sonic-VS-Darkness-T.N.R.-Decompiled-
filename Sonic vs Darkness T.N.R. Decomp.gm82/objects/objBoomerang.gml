#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity = 0.6
MassInit();
RotationInit();
big=0
limit=choose(150,100,115,120,80,90,95,155,125,110,85)
don=choose(0,1)
stop=false
angle=0
delete=10
alarm[0]=5
sound_play(sndTwirl)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !inside_view(x,y,0) && instance_exists(objBoomerangB){
with objDriverHUD
booms+=1}

if objDriverHUD.booms=4 && instance_exists(objBoomerangB)
{
global.stoptime=true
v=instance_create(view_xview+320,-20,objDriverFinish)
v.image_index=1
v.tme=300
v.spd=10
}
else if !instance_exists(objBoomerangB)
{
global.stoptime=true
v=instance_create(view_xview-100,90,objDriverFinish)
v.image_index=0
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if speed>0{
t=instance_create(x,y,objBoomerangT)
t.image_angle=angle
}
alarm[0]=7
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if stop=false
gravity_direction = point_direction (x,y,xstart,ystart)
else
gravity=0
if abs(big)<limit{
if don=true
big+=1
else
big-=1}
image_angle+=1
if stop=false{
x=xstart+lengthdir_x(big,image_angle)
y=ystart+lengthdir_y(28*12,image_angle)}
angle+=20

if delete>0
delete-=1
#define Collision_objBoomerangH
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=delete=0 && y<other.y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Collision_objBoomerangW
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

other.stop=true

with other
if speed<5
speed=5

with other
if speed>10
speed=10
#define Collision_objBoomerangB
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=other.chance=false  && other.extra=-60
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objBoomerangB)
global.stoptime=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.extra=0{
if other.go=false
sound_play(sndEnemyBreak)
other.go=true
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if distance_to_point(room_width/2,room_height/2)>400
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x,y,1,1,angle,c_white,1)
