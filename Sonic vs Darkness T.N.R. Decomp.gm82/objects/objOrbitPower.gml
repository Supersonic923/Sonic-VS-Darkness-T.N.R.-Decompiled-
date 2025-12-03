#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
r=15;
r2=5;
d=360;
image_index=choose(0,1);
image_speed=0;
fade=false
image_alpha=0
image_xscale=-1
xfol=0
yfol=0

dep=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(r<25)r+=0.25;
if(r2<15)r2+=0.25;
d+=5;

if dep<25
dep+=.35 // .325 .375 .32542354346363242
else
dep=0

if dep>12.5
depth=0
else
depth=-2

if image_alpha<1
image_alpha+=.2
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer){
x=objPlayer.x+lengthdir_x(r,d)
y=objPlayer.y+lengthdir_y(r2,d)
if objPlayer.shield!=3
instance_destroy()
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
draw_sprite_ext(sprite_index,image_index,(x),(y),image_xscale,1,0,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
