#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=15
instance_create(x-sprite_width,y,objTubeWind2)
if global.sound_tair=0{
global.sound_tair=1
if !instance_exists(objTAirSound)
instance_create(x,y,objTAirSound)}
sprite_index=sprWindAir
image_xscale=-1
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
x+=(x_speed*animation_direction)+1
