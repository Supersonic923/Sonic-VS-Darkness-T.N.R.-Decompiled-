#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
image_speed=.3
spd=0
des=false
alarm[0]=2

if global.player="Shadow"
sprite_index=sprSlideGlow2
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.specialfx>2
instance_create(x+lengthdir_x(-7,image_angle+90),y+lengthdir_y(-7,image_angle+90),objSlideSparks)
alarm[0]=2
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    if objPlayer.ground=true{
    x=objPlayer.x
    y=objPlayer.y
    image_angle=objPlayer.angle
    image_xscale=objPlayer.animation_direction}
    if objPlayer.animation!="crouch_slide"
    des=true
}
else
instance_destroy()

if des=true{
image_alpha-=.1
if image_alpha<=0 && des=true
instance_destroy()}
else if image_alpha<1
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
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
