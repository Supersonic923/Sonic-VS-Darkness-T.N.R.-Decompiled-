#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=instance_nearest(x,y,objGUNImp).image_xscale
if image_xscale=1
hspeed=7
else
hspeed=-7
image_speed=.3
sound_play(sndGUNShot)
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
