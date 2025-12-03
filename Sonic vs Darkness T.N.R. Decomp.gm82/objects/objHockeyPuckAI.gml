#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
MassInit();
RotationInit();
spd=0
spd2=0
dir=0
dir2=0
tme=0
alarm[0]=60


change=false
change2=true
change3=false
change4=true

diff=0
difficulty=1
drag=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tme=choose(0,0,1)
alarm[0]=60
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objHockeyYRH)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objHockeyBall)
{

    // check if ball is moving towards ai
    if objHockeyBall.hspeed<0
    {
        if distance_to_object(objHockeyBall)<10
        diff=0
        if (objHockeyBall.hspeed<-4 || abs(x-objHockeyBall.x)<150)
        {
            if spd<6
            spd+=1
            if sign((objHockeyBall.y+diff)-y)<0&&change=false{
            change=true
            change2=false
            spd=0}
            else if sign((objHockeyBall.y+diff)-y)>0&&change2=false{
            change2=true
            change=false
            spd=0}
            y+=floor(sign((objHockeyBall.y+diff)-y)*spd)
            if objHockeyBall.hspeed<-10 || abs(objHockeyBall.vspeed)>10
            if distance_to_object(objHockeyBall)>70
            if x>70 && difficulty!=1{
            x-=1
            motion_set(0,0)}
        }
        dir2=choose(0,1)
    }
    else
    {
        if difficulty=1
        diff=choose(22,30,14,50,22,40,35)
        if difficulty=2
        diff=choose(14,22,30,14,22)
        if difficulty=3
        diff=0

        if distance_to_object(objHockeyBall)<10
        diff=0

        motion_set(0,0)
        if dir2=1 || tme=1
        {
            if spd2<6
            spd2+=1
            if x<96 && change3=false{
            change3=true
            change4=false
            motion_set(0,0)
            spd2=0
            }
            else if x>96+7 && change4=false{
            change4=true
            change3=false
            motion_set(0,0)
            spd2=0
            }
            if x<96{
            motion_set(0,0)
            x+=spd2}
            else if x>96+7{
            motion_set(0,0)
            x-=spd2}
        }

        if dir2=1 && drag=0
        {
            if y<room_height/2{
            if spd<6
            spd+=1
            y+=spd}
            else if y>room_height/2+7{
            if spd<6
            spd+=1
            y-=spd}
            else
            spd=0
        }
    }

    // if close to the ball, hit it
    if distance_to_object(objHockeyBall)<70 && objHockeyBall.hspeed<0
    {
        if dir=1||objHockeyBall.vspeed=0
        {
            if spd2<6
            spd2+=1

            if sign((objHockeyBall.x)-x)<0&&change3=false{
            change3=true
            change4=false
            spd2=0}
            else if sign((objHockeyBall.x)-x)>0&&change4=false{
            change4=true
            change3=false
            spd2=0}
            if objHockeyBall.x>x-10{
            move_towards_point(objHockeyBall.x+diff,objHockeyBall.y+diff,spd2)//x+=spd
            spd=0
            }
            else if difficulty=1{
            x-=spd2
            motion_set(0,0)}
        }
    }
    else
    {
        dir=choose(0,1,1,1)
        if dir2!=1 && tme!=1{
        spd2=0
        motion_set(0,0)}
    }

}
else
{
    spd=0
    motion_set(0,0)
    if dir2=1 || tme=1
    {
        if spd2<6
        spd2+=1
        if x<96
        x+=spd2
        else if x>96+7
        x-=spd2
    }
    else
    spd2=0
}

while place_meeting(x,y,objHockeyLimit) && instance_nearest(x,y,objHockeyLimit).x>=x
x-=1

while place_meeting(x,y,objHockeyLimit) && instance_nearest(x,y,objHockeyLimit).x<x
x+=1

while place_meeting(x,y,objHockeyCeiling) && instance_nearest(x,y,objHockeyCeiling).y>=y
y-=1

while place_meeting(x,y,objHockeyCeiling) && instance_nearest(x,y,objHockeyCeiling).y<y
y+=1
#define Collision_objHockeyCeiling
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=yprevious
#define Collision_objHockeyLimit
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=xprevious
