#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists("x_speed")
x_speed=12
if !variable_local_exists("y_speed")
y_speed=12
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=541
applies_to=self
invert=0
arg0=sprSpringingDiagonalRight
arg1=0
arg2=.3
*/
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=541
applies_to=self
invert=0
arg0=sprSpringDiagonalLeft
arg1=0
arg2=1
*/
