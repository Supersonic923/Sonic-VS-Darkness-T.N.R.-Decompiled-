#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    extime              = choose(50,45,35,40,55);
    vspeed=(random(5)+3)*-1//choose(-5,-4,-3,-6,-2)
    dont=choose(true,true,false)

   // if instance_exists(objPlayer) && instance_exists(objBoostPar){
    //objPlayer.boostcam=true objPlayer.hitcam=true}
    if instance_exists(objBoostPar){
    global.camshake=50
    global.camlength=10}
    offset=25

if global.no_boost_replish=false
{
    if global.boost>10
    global.boost-=10
    else
    global.boost=0
}
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.specialfx>1
repeat(choose(4,5,6))instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objENP)

if global.specialfx>2{
c=instance_create(x,y,objOvalFX)
b=instance_create(x,y,objOvalFX2)

c.image_angle=random(360)
b.image_angle=c.image_angle+90}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objExplode
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=611
relative=1
applies_to=self
var_name=global.Score
var_value=+300
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
extime-=1

if extime=0
instance_destroy()

if extime<25{
if hspeed>10
hspeed-=.5
if hspeed<-10
hspeed+=.5
}
image_angle+=hspeed*1.5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=0.2
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,floor(image_index),x+lengthdir_x(offset,image_angle),y+lengthdir_y(offset,image_angle),image_xscale,image_yscale,image_angle,c_white,image_alpha)
