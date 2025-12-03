#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=.7
image_speed=.5
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
x=objPlayer.x
y=objPlayer.y
if objPlayer.action!=objPlayer.action_stomping
instance_destroy()

if instance_exists(objBoostPar)
visible=false
else
visible=true
}
else
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
