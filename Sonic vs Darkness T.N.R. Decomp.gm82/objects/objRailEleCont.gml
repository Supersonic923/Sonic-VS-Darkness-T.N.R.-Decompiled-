#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
switcher=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.eletime>50
{
if switcher=false{
image_index=0
switcher=true}
image_speed=.1
}
if global.eletime<=50 && global.eletime>0
{
switcher=false
if global.eletime=49{
if instance_exists(objPlayer){
with instance_nearest(objPlayer.x,objPlayer.y,objRailEle)
sound_play(sndThunderCharge)}
else if instance_exists(objController){
with instance_nearest(objController.x,objController.y,objRailEle)
sound_play(sndThunderCharge)}}
image_speed=.3
}
if global.eletime<=0 && global.eletime>-30
{
sound_stop(sndThunderCharge)
if global.eletime=0{
if instance_exists(objPlayer){
with instance_nearest(objPlayer.x,objPlayer.y,objEleShock)
sound_play(sndThunder)}
else if instance_exists(objController){
with instance_nearest(objController.x,objController.y,objEleShock)
sound_play(sndThunder)}}
image_speed=.3
electric=true
}
