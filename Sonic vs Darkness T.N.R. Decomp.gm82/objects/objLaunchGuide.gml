#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=0
if global.xbox=true && global.ps3=true
sprite_index=sprLaunchGuidePS3
else if global.xbox=true
sprite_index=sprLaunchGuide360
else
sprite_index=sprLaunchGuide
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.launchguide  =   1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.xbox=true && global.ps3=true
sprite_index=sprLaunchGuidePS3
else if global.xbox=true
sprite_index=sprLaunchGuide360
else
sprite_index=sprLaunchGuide

spd+=.3

if !instance_exists(objSalomLauncher) && !instance_exists(objVerminLauncher) && !instance_exists(objSonicLauncher) && !instance_exists(objShadowLauncher)
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,spd,x,y)
