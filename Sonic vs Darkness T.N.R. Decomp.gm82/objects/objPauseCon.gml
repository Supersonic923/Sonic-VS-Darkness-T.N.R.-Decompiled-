#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
image_speed=0
index=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if index<4.5
index+=.5
else if !instance_exists(objPauseMC)
instance_create(x,y+26,objPauseMC)
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
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*sound_play(sndMenuBack)
if !FMODInstanceIsPlaying(global.BGMD) && !FMODInstanceIsPlaying(global.BGMINV) && !FMODInstanceIsPlaying(global.BGMS)
FMODGroupSetPaused(3,0)

FMODGroupSetPaused(4,0)
FMODGroupSetPaused(2,0)
room_goto(global.c_room)
