#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.08

if global.online_mode=true
visible=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objStageSelect)
{
if image_alpha>0
image_alpha-=.1
}
else
{
if image_alpha<1
image_alpha+=.1
}
