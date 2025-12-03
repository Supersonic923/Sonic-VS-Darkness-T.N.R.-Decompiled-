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
image_speed=0
jump=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    if distance_to_object(objPlayer)<120 && objPlayer.x<x && objPlayer.y<y+15 && jump=false
    {
        instance_create(x,global.waterend,objSplash)
        hspeed=-2
        vspeed=-5
        image_speed=.2
        jump=true
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=y<ystart
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=y>ystart
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=90
arg1=.2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=y=ystart
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=0
*/
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if y<=ystart && hspeed=2
{
    y=ystart
    x=xstart
    image_speed=0
    image_index=0
    hspeed=0
    vspeed=0
    jump=false
    instance_create(x,global.waterend,objSplash)
}

if y>ystart && hspeed=-2
{
    hspeed=2
    instance_create(x,global.waterend,objSplash)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,floor(image_index),x,y)
