#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
start=false
rot=0
spd=0
carry=0
instance_create(x,y,objRocketEx)
delay=10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=x
arg2=y-20
arg3=1
arg4=16777215
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=3
arg1=x
arg2=y-20
arg3=1
arg4=8388736
arg5=1
*/
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objRocketEx
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objExplode
arg1=x
arg2=y-20
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndRocketLp)
sound_play(sndRocketStp)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objRocketRide
arg1=xstart
arg2=ystart
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if delay>0
delay-=1
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle=rot
if start=true
{
with instance_nearest(x,y,objRocketEx)
image_speed=.5
if sprite_index!=sprRocketRide2
sprite_index=sprRocketRide2

if carry=0
{
y-=spd
}
else
{
y+=carry
carry-=.1
if carry<0
carry=0
}

with objPlayer
{
    if action=action_rocket
    {
        if key_left
        {
            if other.rot<45
            other.rot+=5
            other.x-=1.5
        }
        else if key_right
        {
            if other.rot>-45
            other.rot-=5
            other.x+=1.5
        }
        else
        {
            if other.rot>0
            other.rot-=5
            if other.rot<0
            other.rot+=5
        }
        if key_up
        {
            if other.spd<4 && other.carry=0
            other.spd+=.1
        }
        else if key_down
        {
            if other.spd>2 && other.carry=0
            other.spd-=.1
            else if other.carry=0
            other.spd+=.1
        }
        else
        {
            if other.spd<3 && other.carry=0
            other.spd+=.1
            if other.spd>3 && other.carry=0
            other.spd-=.1
        }
    }
    else
    {
        if other.rot>0
        other.rot-=5
        if other.rot<0
        other.rot+=5
        if other.spd<3 && other.carry=0
        other.spd+=.1
        if other.spd>3 && other.carry=0
        other.spd-=.1

    }
}
}
#define Collision_objSolid
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_exists(objPlayer)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=distance_to_object(objPlayer)<30
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
if action=action_rocket
action=action_normal
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Collision_objSpikeBall
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_exists(objPlayer)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=distance_to_object(objPlayer)<30
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
if action=action_rocket
action=action_normal
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Collision_objSpikeBomb
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_exists(objPlayer)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=distance_to_object(objPlayer)<30
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
if action=action_rocket
action=action_normal
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=start=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
