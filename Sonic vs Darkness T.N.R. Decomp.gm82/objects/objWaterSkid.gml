#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.3

if instance_exists(objPlayer)
{
    image_xscale=objPlayer.animation_direction
    image_angle=objPlayer.angle
    /*x=objPlayer.x
    y=objPlayer.y+18*/
}

if instance_exists(objBGSUNLIGHT)
sprite_index=sprWaterSkidSUN
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
