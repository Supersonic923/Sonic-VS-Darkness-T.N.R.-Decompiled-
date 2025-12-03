#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
enter=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if enter=true
{
with objPlayer{
if distance_to_object(objGiftDoor)<50{
objGiftDoor.done=true
objGiftDoor.fade=true}
else if distance_to_object(objArcadeDoor)<50{
objArcadeDoor.done=true
objArcadeDoor.fade=true}
else if distance_to_object(objSecretDoor)<50{
objSecretDoor.done=true
objSecretDoor.fade=true}
}
enter=false
}
}
