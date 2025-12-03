#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.5
image_alpha=.8
if instance_exists(objBoost)
image_index=objBoost.tunnel
alph=.8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objWindAir
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objWindAir1
arg1=x
arg2=y
*/
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBoost)
{
    image_xscale = objBoost.image_xscale
    image_angle = objBoost.image_angle
    visible=objBoost.visible
}
else
instance_destroy()

if (image_index>=0 && image_index<3) || (image_index>=4 && image_index<6)
depth=-2
else
depth=0

if instance_exists(objWindTrail)
image_alpha=objWindTrail.alph
/*
if instance_exists(objPlayer)
{
if abs(objPlayer.y_speed)<abs(objPlayer.x_speed){
if (objPlayer.x_speed/15)*objPlayer.animation_direction<.8
alph=(objPlayer.x_speed/15)*objPlayer.animation_direction
else
alph=.8}
else
{
if abs(objPlayer.y_speed/15)<.8
{
if objPlayer.y_speed>0
alph=(objPlayer.y_speed/15)
else if objPlayer.y_speed<0
alph=(objPlayer.y_speed/15)*-1
}
else
alph=.8
}
}

image_alpha=alph
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
