#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=.6
xbig=0
ybig=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer){
x=objPlayer.x
y=objPlayer.y}

xbig+=.1
ybig+=.1

if xbig>1.5
image_alpha-=.1

if image_alpha<=0
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,0,x,y,xbig,ybig,0,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
