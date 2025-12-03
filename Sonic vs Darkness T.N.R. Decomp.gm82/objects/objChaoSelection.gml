#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
dir=0
#define KeyPress_38
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if dir=0{
dir=1
image_index=dir}
#define KeyPress_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if dir=1{
dir=0
image_index=dir}
