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
button=false
direction=270
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y+vspeed+1,objSolid)
{
gravity=0
vspeed=0
}
else
gravity=.4

while place_meeting(x,y,objSolid){
x+=1
with objPlayer
pushing=false}
while place_meeting(x,y,objSolid){
x-=1
with objPlayer
pushing=false}

if place_meeting(x,y+vspeed+1,objDoorSwitch) && button=false
{
with instance_nearest(x,y,objDoorSwitch)
event_perform(ev_collision,objPlayer)
button=true
}
