#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.02

start=180
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if start>0
start-=1

if start=0
if sprite_index!=sprSnakeAttack
sprite_index=sprSnakeAttack
