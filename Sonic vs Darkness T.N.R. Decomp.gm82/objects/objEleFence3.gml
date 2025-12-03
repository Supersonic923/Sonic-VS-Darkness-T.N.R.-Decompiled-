#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.4
if !instance_exists(objEleFenceSound)
instance_create(x,y,objEleFenceSound)

if variable_local_exists("deactivate"){
x=-1000
y=-1000}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
