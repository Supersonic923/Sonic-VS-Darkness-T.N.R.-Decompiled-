#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=541
applies_to=self
invert=0
arg0=sprSpringingLeft
arg1=0
arg2=.3
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if dont=0{
stomp=true
if ground=false{
y=other.y
y_speed=0}
if place_meeting(x,y,objSpd5){
x_speed = 15;
soar_dir="none"
soartime=50
action=action_soaring
ground=false}
else if place_meeting(x,y,objSpd8){
x_speed = 20;
soar_dir="none"
soartime=50
action=action_soaring
ground=false}
else if place_meeting(x,y,objSpd10){
x_speed = 25;
soar_dir="none"
soartime=50
action=action_soaring
ground=false}
else{
if angle!=0{
angle=0
ground=false
y=other.y
action=action_spring_jump}
x_speed = 12;}
sound_play(sndSpring);
dont=10
rstrenght=.8
hitrumble=10
if global.specialfx>1{
repeat(choose(5,6,5,4)){e=instance_create(other.x,other.y,objSpringStar) e.vspeed=e.hspeed e.hspeed=0}
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_angle=-90
            b=instance_create(other.x,other.y,objSpringFX)
            b.image_angle=-90}}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=541
applies_to=self
invert=0
arg0=sprSpringLeft
arg1=0
arg2=1
*/
