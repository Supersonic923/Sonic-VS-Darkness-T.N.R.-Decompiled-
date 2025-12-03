#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndGBoost)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = .3
image_alpha=.9
fade=false
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
applies_to=objPlayerAI
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
applies_to=objBBoostTrail
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=1
arg0=!instance_exists(objBBoostTrail)
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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objBBoostTrail)
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
action_id=603
applies_to=self
*/
if instance_exists(objEnemy)
objEnemy.harmful=false
if !instance_exists(objPlayerAI)
instance_destroy()
else
{
    if objPlayerAI.x_speed=0 && objPlayerAI.y_speed=0
    fade=true

    if objPlayerAI.action=objPlayerAI.action_hurt
    fade=true

    if objPlayerAI.path_index!=pathtrick1 && objPlayerAI.path_index!=pathbutton1 && objPlayerAI.path_index!=pathramp1
        && objPlayerAI.path_index!=pathtrick2 && objPlayerAI.path_index!=pathbutton2 && objPlayerAI.path_index!=pathramp2{
    x=objPlayerAI.x - hspeed
    y=objPlayerAI.y - vspeed}
    else
    {
    instance_destroy()
    }
}

with objPlayerAI
if !key_s_direct
with objBBoostAI
fade=true
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
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayerAI)
{
    x=objPlayerAI.x
    y=objPlayerAI.y
    hspeed=objPlayerAI.x_speed
    vspeed=objPlayerAI.y_speed
    if objPlayerAI.animation_direction=1 && hspeed=0 && vspeed=0
    image_angle=objPlayerAI.angle
    else if objPlayerAI.animation_direction=-1 && hspeed=0 && vspeed=0
    image_angle=objPlayerAI.angle+180
    else if vspeed=0 && hspeed!=0{
    if objPlayerAI.animation_direction=-1
    image_angle = objPlayerAI.angle-180
    else
    image_angle = objPlayerAI.angle
    }
    else
    image_angle = direction
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
//draw_set_blend_mode_ext(bm_one, bm_one)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
