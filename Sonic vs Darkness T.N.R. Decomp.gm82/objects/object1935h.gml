#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists("top")
top=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if top=true
if instance_exists(objPlayer){
if objPlayer.layer=0
depth=-11
else
depth=0}
