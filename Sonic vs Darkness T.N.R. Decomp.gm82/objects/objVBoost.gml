#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
 objPlayer.rstrenght=1
 objPlayer.hitrumble=30
 if global.Vboost<19
 global.Vboost-=9
 else
 global.Vboost-=10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndVBoost)
image_speed = .3
image_alpha=.6
if instance_exists(objPlayer)
objPlayer.boostcam=true
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
    if objPlayer.screwon=false
    instance_create(x,y,objHomeGlow2)
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
