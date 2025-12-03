#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
image_xscale=objPlayer.animation_direction
image_speed=.45
image_alpha=.5
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objGBoost){
x=objGBoost.x
y=objGBoost.y
hspeed=objGBoost.hspeed
vspeed=objGBoost.vspeed
image_angle=objGBoost.image_angle
image_xscale=objGBoost.image_xscale
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
