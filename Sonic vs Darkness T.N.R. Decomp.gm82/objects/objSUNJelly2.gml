#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.2

main=sprSUNJelly
bounce=sprSUNJellyB

sprite_index=main

if !variable_local_exists("y_speed")
y_speed=-7
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if y_speed>=0 && other.sprite_index=other.main && angle=0{
sound_play(sndBounce)
ground=false
y_speed=other.y_speed
x_speed=min(abs(x_speed),7)*animation_direction

action=action_normal
animation="airjump"

with other{
sprite_index=bounce
image_index=0
image_speed=.4
}}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=main
image_index=0
image_speed=.2
