#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
charge=0
image_speed=.25
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if place_meeting(x,y-1,objPlayer) && objPlayer.x_speed=0 && objPlayer.ground=true{
if objPlayer.key_down=true{
if sprite_index=sprNIGHTPush3
sprite_index=sprNIGHTPush
if sprite_index=sprNIGHTPush
sound_play(sndLaunchMove)
sprite_index=sprNIGHTPush2}
if sprite_index=sprNIGHTPush2 && objPlayer.key_down=false{
sound_stop(sndLaunchMove)
sound_play(sndLaunch)
if charge>10
instance_create(x+15,y,objSpringFX)
objPlayer.ground=false
objPlayer.y_speed=-charge/2
objPlayer.action=objPlayer.action_normal
objPlayer.animation="ramp"
if charge>20
objPlayer.rainspark=35
sprite_index=sprNIGHTPush3}}

else if sprite_index=sprNIGHTPush2
{
sound_stop(sndLaunchMove)
sound_play(sndLaunch)
sprite_index=sprNIGHTPush3
}

}

if sprite_index=sprNIGHTPush2{
if charge<35
charge+=.5}
else
charge=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_index=sprNIGHTPush2 && image_index+image_speed>=26
image_index=18

if sprite_index=sprNIGHTPush3 && image_index+image_speed>=5
sprite_index=sprNIGHTPush
