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
image_speed=.15
if room=rmTRAIN{
sprite_index=sprPushBlockGlass
image_speed=.08}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity_direction=270

if place_meeting(x,y+vspeed+1,objSolid) || place_meeting(x,y+vspeed+1,objPlatform) || place_meeting(x,y+vspeed+1,objMonitor)
{
gravity=0
vspeed=0
}
else
gravity=.4

while place_meeting(x,y,objSolid) || place_meeting(x,y,objPlatform) || place_meeting(x,y,objMonitor){
x+=1
with objPlayer
pushing=false}
while place_meeting(x,y,objSolid) || place_meeting(x,y,objPlatform) || place_meeting(x,y,objMonitor){
x-=1
with objPlayer
pushing=false}

if place_meeting(x,y+vspeed+1,objDoorSwitch) && button=false
{
with instance_nearest(x,y,objDoorSwitch)
event_perform(ev_collision,objPlayer)
button=true
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,x,y)
/*if global.reflection=true{
var i;

i=collision_point(x+24,y+60,objReflectSolid,0,0)//instance_position(x,y+60,objReflectSolid)
if i!=noone{
draw_set_blend_mode(bm_add);

sz=i.sprite_width

t=i.x-x
m=x-i.x
if sign(t)=-1{
t=0
l=sz-m}
else
l=sz-t

with i{
    if place_meeting(x-1,y,objReflectSolid) && place_meeting(x+1,y,objReflectSolid){
        with other
        draw_sprite_general(sprite_index,image_index,0,0,sprite_width,sprite_height,floor(x),floor(i.y)+sprite_height,1,
        -1,0,c_black,c_black,c_black,c_white,1)}
    else{
        with other
        draw_sprite_general(sprite_index,image_index,t,0,l+max(t,0),sprite_height,floor(x),floor(i.y)+sprite_height,1,
        -1,0,c_black,c_black,c_black,c_white,1)//-(i.y-(y+20))/20)
        }
}
draw_set_blend_mode(bm_normal);}}
