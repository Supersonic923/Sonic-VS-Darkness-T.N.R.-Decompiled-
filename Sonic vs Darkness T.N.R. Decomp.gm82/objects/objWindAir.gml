#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objWindTrail)
image_angle=objWindTrail.image_angle
image_alpha=objWindTrail.image_alpha
image_speed=1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBoost)
{
    image_xscale = objBoost.image_xscale
    visible=objBoost.visible
    x=objBoost.x
    y=objBoost.y
}
else
instance_destroy()
if instance_exists(objWindTrail){
image_alpha=objWindTrail.image_alpha
image_angle=objWindTrail.image_angle}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
