#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.5
spd=0

if global.player="Shadow"
sprite_index=sprSpinGlow2
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
}
else
instance_destroy()
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd+=.5
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
