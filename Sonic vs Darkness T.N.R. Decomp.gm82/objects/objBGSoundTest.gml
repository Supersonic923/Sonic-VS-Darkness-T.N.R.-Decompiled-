#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xspd=0
bg_alpha=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xspd-=.5

if bg_alpha<1
bg_alpha+=.1

for(i=0;i<=800;i+=800){
draw_background_ext(bg_menu2,xspd+i,40,1,1,0,c_white,bg_alpha)
draw_background_ext(bg_menu2,xspd+i+800,45,-1,1,0,c_white,bg_alpha)}

draw_background(bg_menu1,0,0)


draw_set_blend_mode(bm_add)
draw_background_part_ext(bg_menu5,0,0,200,120,0,0,1,1,c_white,bg_alpha*.25)
draw_set_blend_mode(bm_normal)


if xspd=-800
xspd=0
