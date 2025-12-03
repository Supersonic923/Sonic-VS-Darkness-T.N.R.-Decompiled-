#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
if x<objPlayer.x
if distance_to_object(objPlayer)<200
instance_destroy()
