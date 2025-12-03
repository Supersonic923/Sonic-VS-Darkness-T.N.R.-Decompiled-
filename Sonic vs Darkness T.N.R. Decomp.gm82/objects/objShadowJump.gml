#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.5
spd=0
angle=0
image_alpha=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
x=objPlayer.x-1
y=objPlayer.y-2
image_xscale=objPlayer.animation_direction
if objPlayer.animation!="jumping" && objPlayer.animation!="rolling" && objPlayer.animation!="homeroll"
instance_destroy()
if objPlayer.action=objPlayer.action_pipe || objPlayer.action=objPlayer.action_corkscrew_roll
instance_destroy()
}
else
instance_destroy()

angle-=15

if image_alpha<1
image_alpha+=.1

if instance_exists(objBoostPar)
visible=false
else
visible=true
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd+=.5
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,0,x,y,image_xscale,1,angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
