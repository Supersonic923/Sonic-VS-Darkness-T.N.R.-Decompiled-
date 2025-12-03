#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=false
image_speed=0
image_index=0
img_spd=0
leave=false
sm_angle=0
spd=5
skip=true
frame_s=0

back=false
collide=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if collide=false
{
    if go=true && instance_exists(objPlayer)
    {
    if leave=false{
    image_angle=round(objPlayer.animation_angle/5)*5
    }

    if objPlayer.animation!="ride2"{
    leave=true
    hspeed=12
    image_angle=0}
    }

    if distance_to_object(objLayerSwitch)<130 || distance_to_object(objLayerToHigh)<100{
    skip=false
    spd=10}
    else{
    skip=true
    spd=5}

    var get_angle;

    if image_angle>180
    get_angle=image_angle-360
    else
    get_angle=image_angle

    if skip=true
    {
        if frame_s=0
        frame_s=1
        else
        frame_s=0
    }
    else
    frame_s=1

    if frame_s=1
    {
        if get_angle>-180 && sm_angle>120
        sm_angle-=360

        if (sm_angle<get_angle)
        sm_angle+=spd

        if (sm_angle>get_angle)
        sm_angle-=spd

        //if sm_angle>=360
        //sm_angle-=360
    }

    if go=true
    img_spd+=.2
    if img_spd>=2
    img_spd=0
}
else
{
    if back=false
    {
        if sm_angle>-50
        sm_angle-=10
        else
        back=true
    }
    else
    {
        if sm_angle<0
        sm_angle+=10
    }
    img_spd=0

}
#define Collision_objSUNCartS
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=collide=false
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
collide=true
sm_angle=-20

instance_create(x-29,y-22,objGoldCoins)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer
if action=action_ride && animation="ride2"{
ground=false
y-=21
action=action_normal
animation="flightdash"
x_speed=14
y_speed=-12
nomovet=40
sound_play(sndSmRamp)
no_boost=false}

sound_stop(sndRollerCoaster)
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=true
{
if instance_exists(objPlayer){
if objPlayer.animation!="ride2"
instance_destroy()}
else
instance_destroy()}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if collide=false
draw_sprite_ext(sprSUNCartG,0,x,y,1,1,sm_angle,c_white,1)

if instance_exists(objPlayer)
{
    if go=true && collide=false
    draw_sprite_ext(objPlayer.player_sprite,floor(objPlayer.animation_frame),x+lengthdir_x(21,sm_angle+90),y+lengthdir_y(21,sm_angle+90),1,1,sm_angle,c_white,1)
}

draw_sprite_ext(sprite_index,floor(img_spd),x,y,1,1,sm_angle,c_white,1)
