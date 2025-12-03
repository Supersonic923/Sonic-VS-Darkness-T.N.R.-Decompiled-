#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
back=false
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objChao)
{
x=objChao.x
y=objChao.y
}
if image_alpha<1 && back=false
image_alpha+=.1

if image_alpha>0 && back=true
image_alpha-=.1

if image_alpha<=0 && back=true
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,-1,x,y,1,1,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
