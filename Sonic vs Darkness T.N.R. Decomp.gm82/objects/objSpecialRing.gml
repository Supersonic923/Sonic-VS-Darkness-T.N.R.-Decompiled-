#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.specialfx=3
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objSpinGlowYellow
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.specialfx>1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=obj10RingDie
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.specialfx>1
instance_create(0,0,objRingEffect)
sound_play(choose(sndRingSparkle,sndRingSparkle2,sndRingSparkle3,sndRingSparkle4))
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index = (global.motion_time)*.02
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,(global.motion_time)*.02,x,y)
draw_sprite(spr10Ring,(global.motion_time)*.02,x,y)
draw_sprite(spr10RingSparkle,(global.motion_time)*.02,x,y)
