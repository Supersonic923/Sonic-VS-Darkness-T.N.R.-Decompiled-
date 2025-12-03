#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer){
image_angle=point_direction(x,y,objPlayer.x,objPlayer.y)
}
image_speed=.5
image_alpha=.6
tor=5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tor-=1
if tor>0
if instance_exists(objPlayer)
image_angle=point_direction(x,y,objPlayer.x,objPlayer.y)
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
