#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
r=5+random(15);
d=random(360);
image_index=0
image_speed=0;
alarm[0]=60;
fade=false
image_alpha=0
image_xscale=choose(1,-1);
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fade=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(r<20)r+=0.25;
d+=5;

if r>10
depth=0

if fade=true
image_alpha-=.1
else if image_alpha<1
image_alpha+=.2

if image_alpha=0 && fade=true
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x+lengthdir_x(r,d),y+lengthdir_y(r,d),image_xscale,1,0,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
