#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
on=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer){
if place_meeting(x,y-3,objPlayer) && objPlayer.y<other.y{
if on=false
instance_create(x+32,y+132,objWaterSteamL)
on=true}}
