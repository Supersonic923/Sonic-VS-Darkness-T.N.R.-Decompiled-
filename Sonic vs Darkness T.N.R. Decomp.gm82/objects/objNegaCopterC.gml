#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.3
flo=instance_create(x,y-10,objNegaCopter)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.sound_spinner=0
{
if !instance_exists(objSpinner)
instance_create(x,y,objSpinner)
global.sound_spinner=1
}

if place_meeting(x,y,objSpd5){
spd=5
with instance_nearest(x,y,objSpd5)
instance_destroy()}

else if place_meeting(x,y,objSpd8){
spd=8
with instance_nearest(x,y,objSpd8)
instance_destroy()}

else if place_meeting(x,y,objSpd10){
spd=10
with instance_nearest(x,y,objSpd10)
instance_destroy()}
else
spd=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(flo)
{
    x=flo.x
}
if instance_exists(objSpringUp)
{
    if distance_to_object(instance_nearest(x,y,objSpringUp))<10{
    x=instance_nearest(x,y,objSpringUp).x}
}
