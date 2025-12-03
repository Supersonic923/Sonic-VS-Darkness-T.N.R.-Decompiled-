#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.6
alpha=1
des=false
sound_play(sndBossBeam)

with objPlayer
{rstrenght=1
hitrumble=45}

global.camshake=50
global.camlength=20

sound_stop(sndBossCharge)

image_xscale=1.2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objBossCharge
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index>23 || instance_exists(objPlayerDie){
alpha-=.05
image_yscale-=.05}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
with objNight_Boss{
form=false
pinchmove2=false}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_blend_ext(sprite_index,floor(image_index),x,y,1,1,0,c_white,alpha,bm_add)
if image_index>=3
draw_sprite_blend_ext(sprite_index,floor(image_index),x-(sprite_width+(sprite_width/2)-(48-12)),y,-1,1,0,c_white,alpha,bm_add)
