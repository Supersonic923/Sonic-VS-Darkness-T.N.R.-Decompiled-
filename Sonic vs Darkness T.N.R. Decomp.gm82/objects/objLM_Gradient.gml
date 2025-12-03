#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists("width")
width=596
if !variable_local_exists("height")
height=170
if !variable_local_exists("dark")
dark=.27 //1 - black / 0 - white

colr=merge_color(c_white,c_black,dark)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode_ext(bm_dest_color,bm_zero)
//draw_sprite(sprite_index,0,x,y)
draw_rectangle_color(x,y,x+width/2,y+height,c_white,colr,colr,c_white,0)
draw_rectangle_color(x+1+width/2,y,x+width,y+height,colr,c_white,c_white,colr,0)
draw_set_blend_mode(bm_normal)
