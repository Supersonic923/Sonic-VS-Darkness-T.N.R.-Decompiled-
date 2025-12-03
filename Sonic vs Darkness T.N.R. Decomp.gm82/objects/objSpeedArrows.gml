#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
endit=30
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if endit>0{
if image_index>0 && image_index<5
image_alpha+=.2
else
image_alpha-=.2

if image_index=5
image_alpha=1
if image_index=0
image_alpha=0
}
else
image_alpha-=.1

endit-=1
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
if endit<=0
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,view_xview+x,view_yview+y,1,1,0,c_white,image_alpha)
