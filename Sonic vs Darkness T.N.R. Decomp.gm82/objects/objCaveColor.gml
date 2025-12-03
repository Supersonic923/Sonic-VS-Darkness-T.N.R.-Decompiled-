#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
bg=true
//if !instance_number(objCaveColor)<1
sound_reverb()
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_fxfree()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bg=true
if alpha<.7
alpha+=.05

if bg=false
if alpha>0
alpha-=.05

if alpha=0 && bg=false
instance_destroy()

if room=rmGREEN
{
if instance_exists(objBGGREENC)
bg=true
else
bg=false
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_blue)
draw_set_alpha(alpha)
draw_set_blend_mode(bm_add)
draw_rectangle(view_xview,view_yview,view_xview+view_wview,view_yview+view_hview,false)
draw_set_blend_mode(bm_normal)
draw_sprite_ext(sprDarkCave,0,view_xview,view_yview,1,1,0,c_white,alpha)
draw_set_alpha(1)
