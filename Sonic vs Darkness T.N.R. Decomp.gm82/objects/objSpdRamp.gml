#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer){
if place_meeting(x,y,objPlayer)
if objPlayer.ground=true && abs(objPlayer.x_speed)>=10{
objPlayer.ground=false
objPlayer.y_speed=-4
objPlayer.animation="flightdash"}}
