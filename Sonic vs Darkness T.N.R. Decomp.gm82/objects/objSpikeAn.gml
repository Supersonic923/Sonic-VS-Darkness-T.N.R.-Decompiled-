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
image_speed=0
depth=objSolid.depth+1
#define Step_1
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
if global.spiketime=0&&global.spikepos=-1
{
y=ystart
}
if global.spiketime=0&&global.spikepos=1
{
y=ystart+30
}
if global.spiketime<10&&global.spiketime>0&&global.spikepos=-1&&y>ystart
y-=10
if global.spiketime<10&&global.spiketime>0&&global.spikepos=1&&y<ystart+30
y+=10
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,x,y)
//draw_sprite(sprSpikePlat,0,x,ystart)
