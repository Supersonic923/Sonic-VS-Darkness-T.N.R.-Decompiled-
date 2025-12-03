#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=.7

if global.specialfx=3
repeat(10)instance_create(x,y,objSpinFlareW)
instance_create(x,y,objEnergySprite)

alph=1
scale=0

with objController
{
tczoom=2
tcalpha=0
tcbgzoom=1
tcbgalpha2=1
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.specialfx=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale+=.08
alph-=.05
if alph=0
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,0,x,y,scale,scale,0,c_white,alph)
draw_set_blend_mode(bm_normal)
