#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ds_list_find_index(global.destroyedtoken,room*1000000 + id)!=-1{
instance_create(x,y,objLeafTokenD)
instance_destroy()}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index = global.motion_time div 120;
