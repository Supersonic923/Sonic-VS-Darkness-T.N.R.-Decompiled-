#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndBoost)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = .9
image_alpha=.7
alph=0
if objPlayer.screwon=true
visible=false
windtrail=5
tunnel=-1
with WindTrail
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=visible=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_loop(sndWindLp)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objBoostRing
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=objPlayer
invert=0
arg0=slide=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objBoostDust
arg1=x
arg2=y+16
*/
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndWindLp)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objPlayer)
instance_destroy()
else
{
    if objPlayer.x_speed=0 && objPlayer.y_speed=0
    instance_destroy()

    if objPlayer.action=objPlayer.action_hurt
    instance_destroy()

    if objPlayer.path_index!=pathtrick1 && objPlayer.path_index!=pathbutton1 && objPlayer.path_index!=pathramp1
    && objPlayer.path_index!=pathpush1{
    x=objPlayer.x - hspeed
    y=objPlayer.y - vspeed}
    else
    {
    instance_destroy()
    }
}

with objPlayer
if !key_s_direct
with objBoost
instance_destroy()


if instance_exists(objPlayer)
{
if abs(objPlayer.y_speed)<abs(objPlayer.x_speed){
if (objPlayer.x_speed/15)*objPlayer.animation_direction<.7
alph=(objPlayer.x_speed/15)*objPlayer.animation_direction
else
alph=.7}
else
{
if abs(objPlayer.y_speed/15)<.7
{
if objPlayer.y_speed>0
alph=(objPlayer.y_speed/15)
else if objPlayer.y_speed<0
alph=(objPlayer.y_speed/15)*-1
}
else
alph=.7
}
}

image_alpha=alph
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if windtrail=0{
tunnel+=1
instance_create(x,y,objWindTrail)
instance_create(objWindTrail.x,objWindTrail.y,objWindTrail1)
if tunnel=3
tunnel=-1
windtrail=10}
windtrail-=1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    x=objPlayer.x
    y=objPlayer.y
    hspeed=objPlayer.x_speed
    vspeed=objPlayer.y_speed
    if objPlayer.animation_direction=1 && hspeed=0 && vspeed=0
    image_angle=objPlayer.angle
    else if objPlayer.animation_direction=-1 && hspeed=0 && vspeed=0
    image_angle=objPlayer.angle+180
    else if vspeed=0 && hspeed!=0{
    if objPlayer.animation_direction=-1
    image_angle = objPlayer.angle-180
    else
    image_angle = objPlayer.angle
    }
    else
    image_angle = direction
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objWindGlow
arg1=x
arg2=y
*/
#define KeyRelease_83
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
