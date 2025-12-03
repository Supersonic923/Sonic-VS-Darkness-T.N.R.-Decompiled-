#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
r=5+random(15);
d=random(360);
alarm[0]=15;
sm=1
image_index=choose(0,1)
image_speed=0

depth=choose(1,-.6,1)

alpha=.7
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(r<20)r+=0.25;
d+=5;
sm-=.05
alpha-=.05

if sm=0
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x+lengthdir_x(r,d),y+lengthdir_y(r,d),sm,sm,0,c_white,alpha)
draw_set_blend_mode(bm_normal)
