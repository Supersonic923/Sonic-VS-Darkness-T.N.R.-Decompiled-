#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 1/5;
y_start = y;
#define Collision_objPlatRight
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed+=0.02;
vspeed = 0;
#define Collision_objPlatLeft
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed-=0.02;
vspeed = 0;
#define Collision_objPlatUp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed-=0.02;
hspeed = 0;
#define Collision_objPlatDown
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed+=0.02;
hspeed = 0;
