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
negate=choose(-1,1)

if negate=-1
image_xscale=1
else
image_xscale=-1

image_index=random(2)

image_speed=.15
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
enemy_move(125,1.5)
// enemy_move(dist,speed) in create event put negate = -1(start left) or 1(start right)
