#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.xbox=true && global.ps3=true
sprite_index=sprLauncherLPS3
else if global.xbox=true
sprite_index=sprLauncherL360
else
sprite_index=sprLauncherL
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_nearest(x,y,objLauncher).letter!=3
draw_sprite(sprite_index,instance_nearest(x,y,objLauncher).letter,x,y)
