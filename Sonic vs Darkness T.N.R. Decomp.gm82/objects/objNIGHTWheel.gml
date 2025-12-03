#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=0
go=false
angle=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
angle+=spd
image_angle=angle
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if go=true && instance_exists(objPlayer){
objPlayer.x=x+lengthdir_x(54,angle-39)
objPlayer.y=y+lengthdir_y(54,angle-39)
objPlayer.x_speed=0
objPlayer.y_speed=0

//UP
if position_meeting(x,y,objSpdS){
    if angle>=(360*2)-100{
    with objPlayer{
    ground=false
    action=action_jumping
    animation="airjump"
    y_speed=other.spd/1.5
    x_speed=0}
    spd=10
    go=-5}
}
else if position_meeting(x,y,objSpd5){
    if angle>=(360*2){
    with objPlayer{
    ground=false
    action=action_jumping
    animation="airjump"
    with other{
    if position_meeting(x,y,objNoFallScript)
    with objPlayer
    nofall=30}
    y_speed=0
    x_speed=other.spd/1.5}
    spd=10
    go=-5}
}
else{
    if angle>=(360*2)+50{
    with objPlayer{
    ground=false
    action=action_jumping
    animation="airjump"
    y_speed=-other.spd/1.5
    x_speed=0}
    spd=10
    go=-5}
}
}
if angle>=(360*2)+90 && angle<360*3{
if spd>.2
spd-=.18}
if angle>=360*3{
angle=0
spd=0}

if go<0
go+=1
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=false && spd=0 && angle=0{
sound_play(sndSpinDashCharge2)
sound_play(sndLazerCharge)
with objBoostPar
instance_destroy()
go=true
if other.action!=other.action_pipe
other.action=other.action_pipe
spd=max(abs(other.x_speed),abs(other.y_speed),9)
other.x_speed=0
other.y_speed=0}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,0,x,y)

draw_sprite(sprNIGHTWheelP,0,x+lengthdir_x(54,image_angle-20),y+lengthdir_y(54,image_angle-20))

draw_sprite(sprite_index,0,x,y)

//Center
draw_sprite(sprNIGHTWheelP,4,x+lengthdir_x(18,image_angle-45),y+lengthdir_y(18,image_angle-45))
draw_sprite(sprNIGHTWheelP,5,x+lengthdir_x(18,image_angle+45),y+lengthdir_y(20,image_angle+45))

draw_sprite(sprNIGHTWheelP,4,x+lengthdir_x(20,image_angle+135),y+lengthdir_y(20,image_angle+135))
draw_sprite(sprNIGHTWheelP,5,x+lengthdir_x(20,image_angle+225),y+lengthdir_y(18,image_angle+225))

//Hole
draw_sprite(sprNIGHTWheelP,0,x+lengthdir_x(53,image_angle-40),y+lengthdir_y(52,image_angle-40))

//Moon
draw_sprite(sprNIGHTWheelP,1,x+lengthdir_x(52,image_angle+90),y+lengthdir_y(52,image_angle+90))

//Sun
draw_sprite(sprNIGHTWheelP,2,x+lengthdir_x(53,image_angle+220),y+lengthdir_y(52,image_angle+220))



draw_sprite(sprNIGHTWheelP,3,x+lengthdir_x(58,image_angle),y+lengthdir_y(58,image_angle))
draw_sprite(sprNIGHTWheelP,3,x+lengthdir_x(58,image_angle+30),y+lengthdir_y(58,image_angle+30))
draw_sprite(sprNIGHTWheelP,3,x+lengthdir_x(58,image_angle+60),y+lengthdir_y(58,image_angle+60))

draw_sprite(sprNIGHTWheelP,3,x+lengthdir_x(58,image_angle+120),y+lengthdir_y(58,image_angle+120))
draw_sprite(sprNIGHTWheelP,3,x+lengthdir_x(58,image_angle+150),y+lengthdir_y(58,image_angle+150))
draw_sprite(sprNIGHTWheelP,3,x+lengthdir_x(58,image_angle+180),y+lengthdir_y(58,image_angle+180))

draw_sprite(sprNIGHTWheelP,3,x+lengthdir_x(58,image_angle+255),y+lengthdir_y(58,image_angle+255))
draw_sprite(sprNIGHTWheelP,3,x+lengthdir_x(58,image_angle+285),y+lengthdir_y(58,image_angle+285))
