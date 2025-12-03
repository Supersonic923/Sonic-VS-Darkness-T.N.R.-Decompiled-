#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    xDifference = 0;        // X and Y differences between current and last
    yDifference = 0;        // position.
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // Calculate difference
    xDifference = x - xprevious;
    yDifference = y - yprevious;
#define Collision_objPlatRight
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed+=0.04;
vspeed = 0;
#define Collision_objPlatLeft
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed-=0.04;
vspeed = 0;
#define Collision_objPlatUp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed-=0.04;
hspeed = 0;
#define Collision_objPlatDown
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed+=0.04;
hspeed = 0;
