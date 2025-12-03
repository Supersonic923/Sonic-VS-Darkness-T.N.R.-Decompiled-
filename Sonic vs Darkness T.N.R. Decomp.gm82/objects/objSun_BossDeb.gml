#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=choose(0,1,2)

flip=choose(1,-1)

randomize()

flip_spd=random_range(5,20)

depth=choose(0,-1)

//sound_play(choose(sndBoatDamage,sndBoatDamage2))
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=flip_spd*flip

if y>1500
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.3
*/
