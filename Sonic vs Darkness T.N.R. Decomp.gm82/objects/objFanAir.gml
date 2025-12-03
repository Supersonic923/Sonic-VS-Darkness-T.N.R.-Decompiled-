#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.sound_air=0{
global.sound_air=1
if !instance_exists(objAirSound)
instance_create(x,y,objAirSound)}

sprite_index=sprFanAir
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=1.2
image_index=random(38)
image_alpha=.5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
depth=choose(0,-2)
if global.specialfx=1
visible=false
