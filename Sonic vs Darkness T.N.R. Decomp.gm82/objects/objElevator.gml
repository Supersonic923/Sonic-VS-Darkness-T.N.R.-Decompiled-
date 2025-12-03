#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,objEleAct)
instance_create(x,y,objEleDoor)
instance_create(x,y,objEleTop)
instance_create(x,y,objEleBottom)
image_speed=0
eleactivate=false
stopglass=false
spd=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if eleactivate=true && stopglass=false{
if distance_to_object(objElevatorStop)<100{
if spd>0
spd-=.2
}
else
{
if spd<10
spd+=1
}
y-=spd}
#define Collision_objElevatorStop
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=other.y
if stopglass=false{
image_index=0
image_xscale=image_xscale*-1
sound_play(sndElevatorE)
with objPlayer
animation_direction=animation_direction*-1
with instance_nearest(x,y,objEleGlass)
back=true
stopglass=true}
