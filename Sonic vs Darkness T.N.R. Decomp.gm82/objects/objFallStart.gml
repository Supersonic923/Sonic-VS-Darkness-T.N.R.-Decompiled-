#define Collision_objSonic
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if action!=action_dive{
sound_loop(sndDiveAmb)
action=action_dive
if x_speed>=0
image_xscale=1
else
image_xscale=-1
y_speed=1}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objBoostPar
invert=0
*/
