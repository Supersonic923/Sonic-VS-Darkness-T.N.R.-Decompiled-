#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    global.EFF2=FMODGroupAddEffect(3,7)
    objPlayer.rstrenght=1
    objPlayer.hitrumble=30
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndJet)
sound_play(sndWHOOSH)
sound_play(sndGBoost)
sound_play(sndGBoost2)
sound_play(sndJet)
sound_loop(sndWindLp)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = .3
image_alpha=.6
if instance_exists(objPlayer)
objPlayer.boostcam=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objFishEye
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objGBoostEf2
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=objPlayer
invert=0
arg0=ground=true && slide=0
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objGBoostTrail
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objGBoostTrail)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objGBoostTrail
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objGBoostEf
arg1=x
arg2=y
*/
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndWindLp)
FMODEffectFree(global.EFF2)
global.EFF2=0
if global.EFF!=0 && global.filter=2
{
        FMODEffectFree(global.EFF)
        global.EFF=0
        global.filter=0
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objGBoostTrail)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objGBoostTrail
arg1=x
arg2=y
*/
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
if global.boost=92
instance_destroy()

with objPlayer
if !key_s_direct
with objGBoost
instance_destroy()
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
#define KeyRelease_83
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
