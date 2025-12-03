#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hit = 0;
touched = 0;
instance_create(x,y,objWaterSlideLoopT)
//instance_create(x+252,y+445,objTubeEnd)
//image_speed=.1
spd=0
//depth=-0.1

if !variable_local_exists("water")
water=false

if !variable_local_exists("water_type")
water_type=sprWaterSlideLoopWater
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
/*if action=action_pipe
{
if xprevious<x
animation_direction=1
else if xprevious>x
animation_direction=-1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,0,x,y)

if water=true{
spd+=.15
if spd>=2
spd=0
draw_sprite(water_type,floor(spd),x,y)}
