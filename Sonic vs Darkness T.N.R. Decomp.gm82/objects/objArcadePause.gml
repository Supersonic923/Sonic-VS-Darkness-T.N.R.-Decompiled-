#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
image_speed=0
index=0
joystick_rumble(0,0,0)
global.pausereturn=true
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(.3)
draw_rectangle_color(view_xview,view_yview,view_wview,view_hview,c_black,c_black,c_black,c_black,0)
draw_set_alpha(1)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,1)
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index=0{
if !FMODInstanceIsPlaying(global.BGMD) && !FMODInstanceIsPlaying(global.BGMINV) && !FMODInstanceIsPlaying(global.BGMS)
FMODGroupSetPaused(3,0)

FMODGroupSetPaused(4,0)
FMODGroupSetPaused(2,0)

sound_unpause_all()

if FMODInstanceIsPlaying(global.BGMR)
FMODInstanceSetPaused(global.BGMR,0)
global.pausereturn=false
room_goto(global.backroom)}

if image_index=1{
if !FMODInstanceIsPlaying(global.BGMD) && !FMODInstanceIsPlaying(global.BGMINV) && !FMODInstanceIsPlaying(global.BGMS)
FMODGroupSetPaused(3,0)

FMODGroupSetPaused(4,0)
FMODGroupSetPaused(2,0)

sound_stop_all()

sound_play(sndLaunchDown)

if FMODInstanceIsPlaying(global.BGMR)
FMODInstanceSetPaused(global.BGMR,0)

room_goto(global.backroom)}
#define KeyPress_38
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index=1
image_index=0
#define KeyPress_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index=0
image_index=1
#define KeyPress_65
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index=0{
if !FMODInstanceIsPlaying(global.BGMD) && !FMODInstanceIsPlaying(global.BGMINV) && !FMODInstanceIsPlaying(global.BGMS)
FMODGroupSetPaused(3,0)

FMODGroupSetPaused(4,0)
FMODGroupSetPaused(2,0)

sound_unpause_all()

if FMODInstanceIsPlaying(global.BGMR)
FMODInstanceSetPaused(global.BGMR,0)
global.pausereturn=false
room_goto(global.backroom)}

if image_index=1{
if !FMODInstanceIsPlaying(global.BGMD) && !FMODInstanceIsPlaying(global.BGMINV) && !FMODInstanceIsPlaying(global.BGMS)
FMODGroupSetPaused(3,0)

FMODGroupSetPaused(4,0)
FMODGroupSetPaused(2,0)

sound_stop_all()

sound_play(sndLaunchDown)

if FMODInstanceIsPlaying(global.BGMR)
FMODInstanceSetPaused(global.BGMR,0)

room_goto(global.backroom)}
