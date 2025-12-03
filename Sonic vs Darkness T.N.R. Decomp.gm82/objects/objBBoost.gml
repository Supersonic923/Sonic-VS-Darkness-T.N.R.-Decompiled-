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
sound_play(sndGBoost)
sound_loop(sndWindLp)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = .3
image_alpha=.8
//if instance_exists(objPlayer)
//objPlayer.boostcam=true
if !instance_exists(objBossLooper){
global.camshake=50
global.camlength=10}
fade=false

cul=c_white
hue=0

exception=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.specialfx>1
*/
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
action_id=408
applies_to=objPlayer
invert=0
arg0=ground=true && slide=0 && global.specialfx>1
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
applies_to=objBBoostTrail
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objBBoostTrail) && global.specialfx=3
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objBBoostTrail
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objRBoostTrail) && global.specialfx=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objRBoostTrail
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objBBoostEf
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
arg0=!instance_exists(objBBoostTrail) && global.specialfx=3
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objBBoostTrail
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objRBoostTrail) && global.specialfx=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objRBoostTrail
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
    if abs(objPlayer.x_speed)<2 && abs(objPlayer.y_speed)<2 && exception=false{
    if fade=false
    objPlayer.boostdelay=10
    fade=true}
    exception=false

    if objPlayer.action=objPlayer.action_hurt{
    if fade=false
    objPlayer.boostdelay=10
    fade=true}

    if objPlayer.path_index!=pathtrick1 && objPlayer.path_index!=pathbutton1 && objPlayer.path_index!=pathramp1
        && objPlayer.path_index!=pathpush1{
    x=objPlayer.x - hspeed
    y=objPlayer.y - vspeed}
    else
    {
    instance_destroy()
    }
}
if global.boost=127{
if fade=false
objPlayer.boostdelay=10
fade=true}

with objPlayer
if !key_s_direct{
if other.fade=false
boostdelay=10
other.fade=true}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=fade away
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fade=true
image_alpha-=.1

if image_alpha<=0
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Hyper Style
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.hyperboost>0 || global.player="Supersonic"{
if sprite_index!=sprHPBoost
sprite_index=sprHPBoost
if hue<255
hue +=20
if hue>255
hue=0
cul=make_color_hsv(hue,90,255);
if instance_exists(objBBoostTrail){
objBBoostTrail.c1 = cul
objBBoostTrail.c2 = cul}
if instance_exists(objRBoostTrail){
objRBoostTrail.c1 = cul
objRBoostTrail.c2 = cul}
}
else if sprite_index!=sprBBoost{
sprite_index=sprBBoost
cul=c_white
if instance_exists(objBBoostTrail){
objBBoostTrail.c1 = c_aqua
objBBoostTrail.c2 = c_blue}
if instance_exists(objRBoostTrail){
objBBoostTrail.c1 = c_aqua
objBBoostTrail.c2 = c_blue}
}
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
    if objPlayer.action=objPlayer.action_corkscrew_roll && objPlayer.cork="swirl"{
    image_angle = point_direction(xprevious,yprevious,x,y)
    }
    else{
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
    image_angle = direction}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,image_angle,cul,image_alpha)
draw_set_blend_mode(bm_normal)
