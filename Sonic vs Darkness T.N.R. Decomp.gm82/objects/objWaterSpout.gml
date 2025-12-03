#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBGSUNLIGHT){
sprite_index=sprSUNWaterSpout
edge=sprSUNWaterSpoutE}
else
edge=sprWaterSpoutE

image_speed=.3
mvm=10

y+=mvm
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if objPlayer.y_speed<0
mask_index=nomask
else
mask_index=-1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,x,y-mvm)
draw_sprite(edge,image_index,x+328,y-mvm+35)
