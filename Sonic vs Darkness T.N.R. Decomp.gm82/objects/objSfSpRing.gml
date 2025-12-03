#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=.3
hspeed=-2
image_speed = 0.2;
collected=false
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=collected = true 
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale+=.008
depth=-10
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=x>=other.x
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
v=instance_create(x,y,objSpecialRingDie)
v.depth=depth

b=instance_create(x,y,obj20RingDie)
b.depth=depth
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=611
relative=1
applies_to=self
var_name=global.Rings
var_value=+20
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=611
relative=1
applies_to=self
var_name=global.Score
var_value=+200
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndSuperRing)
if global.boost>39
global.boost-=40
else
global.boost=0

global.Vboost += 40;
#define Other_40
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
draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,0,c_white,1)
