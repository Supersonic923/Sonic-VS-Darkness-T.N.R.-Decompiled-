#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fr=0
if global.combocounter=1
fr=1
if global.combocounter=2
fr=2
if global.combocounter=3
fr=3
if global.combocounter=4
fr=4
if global.combocounter=5
fr=5

image_xscale=0
image_yscale=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fr=1
move_towards_point(view_xview+237,view_yview+120,14)
if fr=2
move_towards_point(view_xview+277,view_yview+120,14)
if fr=3
move_towards_point(view_xview+317,view_yview+120,14)
if fr=4
move_towards_point(view_xview+357,view_yview+120,14)
if fr=5
move_towards_point(view_xview+397,view_yview+120,14)

image_xscale+=.1
image_yscale+=.1
if image_xscale=1
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_white,1)
draw_set_blend_mode(bm_normal)
