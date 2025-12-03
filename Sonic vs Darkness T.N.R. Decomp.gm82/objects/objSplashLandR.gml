#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.4
if instance_exists(objKnuckles)
sprite_index=sprSplashLandR
//sound_play(sndStomp)
image_alpha=.7
if instance_exists(objPlayer)
image_angle=objPlayer.angle
if global.specialfx=1
visible=false
#define Collision_objEnemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Collision_objMonitor
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=1
arg0=distance_to_object(objBoxWooden)<50
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=1
arg0=distance_to_object(objButtonBox)<50
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,floor(image_index),x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
