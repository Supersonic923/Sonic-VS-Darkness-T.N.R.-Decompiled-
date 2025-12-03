#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
go=false

push=0

chosen=false

active=false

mrge=40

rnd=0
rnd2=0
jig=0

go_anyway=false

xpos=x
ypos=y
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=false
{
    if image_index=0
    image_index=1
    else
    image_index=0
    alarm[0]=45
    jig=7
    sound_play(sndCannonMove)
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=false
push=0
active=false

alarm[0]=-1
image_index=0
mrge=40
go_anyway=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if active=true && mrge=0{
with objPlayer
animation="cannon"
image_index=0
alarm[0]=20
active=false}

if push>0
push-=1


if active=true
if mrge>0{
mrge-=1}

if jig>0
{
rnd=random_range(0,1)*choose(1,-1)
rnd2=random_range(0,1)*choose(1,-1)
jig-=1
}


xpos=xstart+rnd
ypos=ystart+rnd2

if jig=0
{
rnd=0
rnd2=0
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
if action=action_cannon && other.chosen=true
{
    if (key_action_pressed || other.go_anyway=true) && other.jig=0 && other.mrge=0
    {
        if other.go=false
            other.push=22
        other.go=true
    }

    if key_action_pressed && other.jig>0 && other.mrge=0
    other.go_anyway=true

    if other.go=true
    {
        if other.image_index=0
            x+=2
        else
        {
            x+=2
            y-=1.8
        }
    }

    if other.push=1
    {
        action=action_jumping
        animation="airjump"
        if other.image_index=0{
        x_speed=12
        nofall=60
        notargt=60
        instance_create(other.x+70,other.y-3,objSmokeRing)}
        else
        {
            x_speed=10
            y_speed=-8
            nofall=20
            notargt=20
            with instance_create(other.x+60,other.y-50,objSmokeRing)
            image_angle=45
        }
        sound_play(sndSteam)
        sound_play(sndCannonShot)
        nomovet=50
        other.chosen=false
        with other
        alarm[1]=10
    }

    if other.go=false
    {
        x=other.x-other.mrge
        y=other.y
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,xpos,ypos)
