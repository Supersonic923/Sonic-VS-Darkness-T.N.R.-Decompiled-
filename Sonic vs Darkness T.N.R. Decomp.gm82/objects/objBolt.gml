#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=choose(0,1,2,3)
image_speed=0
stop=false
vspd=0
fling=false
set=0
completestop=false

done=false
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if completestop=false{
if instance_exists(objPlayer)
{
    if objPlayer.screwon=true
    {
        image_speed=objPlayer.x_speed/-20
        if fling=true{
        objPlayer.x_speed=set
        x+=set/2
        objPlayer.x=x+32}
    }
    else
    {
        image_speed=0
    }
    if stop=false{
    vspd=image_speed*5
    if abs(vspd)>.5
    y+=vspd}
    if vspd!=0
    objPlayer.y=y-14
}
}
#define Collision_objEnemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Collision_objBoltStopper
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if vspd>0 && y<other.y
{
vspd=0
stop=true
}

if vspd<0 && y>other.y
{
vspd=0
stop=true
}
if image_speed>=0 && y>other.y
stop=false
if image_speed<=0 && y<other.y
stop=false


if stop=true && other.release=true
{
done=true
with objPlayer
screwon=false
with objBoost
visible=true
}
#define Collision_objObjectStopper
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fling=false
stop=true
completestop=true
#define Collision_objBoltFlinger
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspd=0
stop=true
fling=true
if instance_exists(objPlayer)
set=objPlayer.x_speed
