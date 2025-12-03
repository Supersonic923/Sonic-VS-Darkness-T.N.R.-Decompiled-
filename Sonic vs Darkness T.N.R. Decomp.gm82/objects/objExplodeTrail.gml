#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.5
image_index=0
if instance_exists(objRailLong)
y=instance_nearest(x,y,objRailLong).y
sound_play(sndExplosion)
des=200
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
des-=1
if des<=0
instance_destroy()
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
