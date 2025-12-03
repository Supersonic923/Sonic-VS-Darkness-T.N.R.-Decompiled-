#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
image_speed=0
index=0
alarm[0]=120
save_scr("game_data.sav")
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,objPauseSavCon)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if index<4.5
index+=.5
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(.3)
draw_rectangle_color(view_xview,view_yview,view_wview,view_hview,c_black,c_black,c_black,c_black,0)
draw_set_alpha(1)
draw_sprite_ext(sprite_index,index,x,y,1,1,0,c_white,1)
