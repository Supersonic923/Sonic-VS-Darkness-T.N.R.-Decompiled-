#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.8
if global.specialfx=1
visible=false
movex=0

gs=2
angle=0
ax=x
ay=y
xd=ax
yd=ay
sound_play(sndFireworkFuse)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndFireworkFuse)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
movex+=.2


if gs>0
gs-=1
if gs=0
{
if global.specialfx>2{
l=instance_create(x,y,objGrindSparks)
l.depth=depth}
gs=2
}

xd=ax-xstart
yd=ay-ystart
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,floor(image_index),ax-lengthdir_x(xd-movex,angle),ay-lengthdir_y(xd-movex,angle),image_xscale,1,0,c_white,.7)
draw_set_blend_mode(bm_normal)

x=ax-lengthdir_x(xd-movex,angle)
y=ay-lengthdir_y(xd-movex,angle)
