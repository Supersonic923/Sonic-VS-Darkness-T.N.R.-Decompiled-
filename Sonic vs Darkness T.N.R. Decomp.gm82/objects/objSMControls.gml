#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
if global.xbox=true && global.ps3=false
image_index=1
else if global.ps3=true
image_index=2
else
image_index=0

image_alpha=0
alarm[0]=120
fade=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fade=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fade=true && image_alpha<1
image_alpha+=.1
