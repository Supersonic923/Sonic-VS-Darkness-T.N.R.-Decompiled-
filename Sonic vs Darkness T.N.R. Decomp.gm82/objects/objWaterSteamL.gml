#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y-30,objWFCreate)
image_speed=.3
rise=false
ymove=0
neg=true
back=false
sound_play(sndSteam)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if rise=false{
if y>ystart-128
y-=12
else
rise=true}
/*
if rise=true
{

    if neg=false{
    if back=true
    {
        ymove-=.5
        if ymove=0{
        neg=true
        back=false}
    }
    if back=false
    {
        ymove+=.5
        if ymove=5
        back=false
    }
    }
    else{
    if back=true
    {
        ymove-=.5
        if ymove=-5
        back=false
    }
    if back=false
    {
        ymove+=.5
        if ymove=0{
        neg=false
        back=false}
    }
    }

    y+=ymove


}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if dont=0{
ground=false
y_speed=-5
action=action_normal
dont=10}
