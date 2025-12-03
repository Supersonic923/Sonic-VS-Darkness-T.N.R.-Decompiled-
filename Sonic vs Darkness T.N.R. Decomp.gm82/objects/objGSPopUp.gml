#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer){
if distance_to_point(objPlayer.x,objPlayer.y)>30 && objPlayer.x>x
i=true
if objPlayer.x<x
i=false}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmHUBGift
if other.x_speed<0 && other.x_speed>-12 && i=true && other.ground=true && !instance_exists(objGiftShopMenu)
{
other.x_speed=0
i=false
instance_create(0,0,objGiftShopMenu)
}

if room=rmHUBArcade
if other.x_speed<0 && other.x_speed>-12 && i=true && other.ground=true && !instance_exists(objACConfirm2)
{
other.x_speed=0
i=false
instance_create(0,0,objACConfirm2)
}
