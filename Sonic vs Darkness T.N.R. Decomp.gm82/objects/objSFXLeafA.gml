#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_yscale=.2
if instance_exists(objPlayer){
hspeed=10*objPlayer.animation_direction
vspeed=choose(0,1,2,3,4,-1,-2,-3,-4)
image_angle=vspeed*-10*objPlayer.animation_direction}
else
instance_destroy()
#define Collision_objEnemyParent
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
