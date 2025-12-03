#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.3
XLen=1
YLen=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objRocketRide)
{
x=instance_nearest(x,y,objRocketRide).x
y=instance_nearest(x,y,objRocketRide).y
image_angle=instance_nearest(x,y,objRocketRide).rot
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    if instance_exists(objWaterLine)
    {
    if objWaterLine.under=true
    {
        visible=false
        repeat(2)instance_create(x+YLen*4,y-XLen*4,objBoostWater);
    }
    else
    {
    visible=true
    exit;
    }
    }
    else
    exit;
