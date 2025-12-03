#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=320
y=60
index=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y-=.5
image_alpha-=.03
    index+=.5
    if image_alpha<=0
    instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,index,view_xview+x,view_yview+y,1,1,0,c_white,image_alpha)
