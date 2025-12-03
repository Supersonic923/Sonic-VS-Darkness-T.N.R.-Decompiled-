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
