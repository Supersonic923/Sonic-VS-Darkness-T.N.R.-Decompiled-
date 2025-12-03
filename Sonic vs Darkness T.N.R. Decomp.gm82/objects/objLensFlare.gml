#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bak=false
ap=.6

if global.specialfx<3
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ap=.3
bak=true
if ap=.6
bak=false

if bak=false
ap-=.005
else
ap+=.005
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprLensFlare,0,view_xview,view_yview,1,1,0,c_white,ap)
draw_set_blend_mode(bm_normal)
