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

mrge=68
mrge2=x

rnd=0
rnd2=0
jig=0

go_anyway=false

xpos=x
ypos=y

if !variable_local_exists("hide")
hide=true

boss_go=false

scale=0

depth_change=-99
current_depth=depth
cycle=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if go=false
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
mrge=68
go_anyway=false
depth=current_depth
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Boss Function
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=hide=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objSUNWaterGun2
hide=true
//global.normal_y=false
//view_yview[1]=474
global.mask_on=true

var xene;
var xene2;

if x<640
{
xene=692
xene2=772
scale=3
}
else
{
xene=540
xene2=620
scale=-3
}
with instance_create(xene,560,objEnemyPhase)
{
    sprite_index=sprEggPirate
    scale=other.scale
    move=true
    if scale=3{
    dir=-1
    dist=xstart-225
    to_left=true}
}
with instance_create(xene2,560,objEnemyPhase)
{
    sprite_index=sprEggPirate
    scale=other.scale
    move=true
    if scale=3{
    dir=-1
    dist=xstart-225
    to_left=true}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    var xene;
    var xene2;

    if objPlayer.x<640
    {
    xene=692
    xene2=772-30
    scale=3
    }
    else
    {
    xene=540
    xene2=540+30
    scale=-3
    }
    if cycle=0
    {
        with instance_create(xene2,560,objEnemyPhase)
        {
            sprite_index=sprEggPirate
            scale=other.scale
            move=true
            if scale=3{
            dir=-1
            dist=xstart-225
            to_left=true}
        }
    }
    else
    {
        with instance_create(xene2,560,objEnemyPhase)
        {
            sprite_index=sprEggCannon
            scale=other.scale
            move=true
            if scale=3{
            dir=-1
            dist=xstart-225
            to_left=true}
        }
    }
    cycle+=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if hide=true
{
    y=ystart+sprite_height
    mask_index=nomask
}
else
{
    if y>ystart
    y-=2
    if y<ystart
    y=ystart

    if y=ystart{
    if mask_index=nomask
    instance_create(x,y-66,objArrowSpin)
    mask_index=sprite_index}
}
if active=true && mrge=0{
with objPlayer
animation="cannon"
image_index=0
alarm[0]=20
active=false}

if push>0
push-=1


if active=true
{
if mrge>0 && mrge2=x{
mrge-=3}

if mrge<0
mrge=0

if mrge2>x{
mrge2-=.5}
if mrge2<x{
mrge2+=.5}

if abs(mrge2)<x+.5
mrge2=x
}
else if instance_exists(objPlayer)
mrge2=x+(objPlayer.x-x)

if jig>0
{
rnd=random_range(0,1)*choose(1,-1)
rnd2=0//random_range(0,1)*choose(1,-1)
jig-=1
}

if hide=false && y=ystart
{
xpos=xstart+rnd
ypos=ystart+rnd2
}
else
{
xpos=x
ypos=y
}

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
        if other.go=false{
            other.push=22
            other.jig=22}
        other.go=true
        other.boss_go=true
    }

    if key_action_pressed && other.jig>0 && other.mrge=0
    other.go_anyway=true

    if other.go=true
    {
        if other.image_index=0
            y-=2
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
        y_speed=-13
        nofall=20
        notargt=40
            with instance_create(other.x,other.y-70,objSmokeRing)
            image_angle=90}
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
        nomovet=70
        other.chosen=false
        with other
        alarm[1]=10
    }

    if other.go=false
    {
        x=other.mrge2
        y=other.y-other.mrge
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Boss Functions
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBossCont) && hide=false && boss_go=true
{
    if instance_exists(objPlayer)
        if y-300>objPlayer.y
        {
            if global.normal_y=false{
            alarm[2]=50//70
            global.mask_on=false
            boss_go=false}
            global.normal_y=true
        }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,xpos,ypos)
