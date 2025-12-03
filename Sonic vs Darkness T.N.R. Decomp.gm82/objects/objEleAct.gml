#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lift=false
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objElevator)
{
x=instance_nearest(x,y,objElevator).x
y=instance_nearest(x,y,objElevator).y
image_xscale=instance_nearest(x,y,objElevator).image_xscale
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.action!=other.action_elevator && lift=false
{
other.x_speed=0
other.y_speed=0
sound_play(sndElevatorS)
other.action=other.action_elevator
other.animation_direction=image_xscale*-1
other.x=x+1
other.y=y+58
if !instance_exists(objEleGlass)
instance_create(x,y,objEleGlass)
lift=true
}
