#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.HUB=true
sprite_index=sprPauseMH
else if global.TUT=true
sprite_index=sprPauseMQ
else
sprite_index=sprPauseM

image_index=0
image_speed=.2
if !instance_exists(objPauseNav)
instance_create(x,y,objPauseNav)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_index=sprPauseM || sprite_index=sprPauseMH{
if image_index=3{
image_speed=0}
}
else{
if image_index=2.2{
image_speed=0}}
