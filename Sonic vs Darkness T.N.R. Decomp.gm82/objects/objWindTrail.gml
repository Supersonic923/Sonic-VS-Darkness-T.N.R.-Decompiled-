#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.5
image_alpha=.8
alph=.8
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
    x=objBoost.x
    y=objBoost.y
}
else
instance_destroy()

if (image_index>=0 && image_index<3) || (image_index>=4 && image_index<6)
depth=-2
else
depth=0

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
