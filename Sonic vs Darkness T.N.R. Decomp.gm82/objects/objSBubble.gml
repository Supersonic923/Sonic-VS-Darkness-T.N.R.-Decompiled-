#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
vspeed=(random(1)+1)

delay=40

if instance_exists(objBGSUNLIGHT)
sprite_index=sprSBubbleSUN
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=90
arg1=.1
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index=1
vspeed=max(vspeed,-3)
else
vspeed=max(vspeed,-2)

if delay>0
delay-=1
#define Collision_objSolid
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=delay=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Collision_objWaterLine
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if distance_to_object(objController)>1000
instance_destroy()
