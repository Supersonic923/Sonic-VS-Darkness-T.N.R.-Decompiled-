#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bgalpha=.6
alpha=.5
choice=0
limit=0
lag=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if lag>0
lag-=1
if alpha<1
alpha+=.1

if limit<7
limit+=1

//ALT Buttons
if global.b_button=true{
keyboard_key_press(vk_backspace)
keyboard_key_release(vk_backspace)
global.b_button=false
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(bgalpha)
draw_rectangle_color(view_xview,view_yview,view_wview,view_hview,c_black,c_black,c_black,c_black,0)
draw_set_alpha(1)
if limit<7
draw_sprite_ext(sprGSCon2Fade,limit,320,180,1,1,0,c_white,alpha)
else
draw_sprite_ext(sprGSConfirm2,choice,320,180,1,1,0,c_white,alpha)
#define KeyPress_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=lag=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndMenuBack)
instance_destroy()
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=lag=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=choice=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndMenuBack)
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=choice=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.money-=global.price
if global.gshover=1
global.buy1=1
if global.gshover=2
global.buy2=1
if global.gshover=3
global.buy3=1
if global.gshover=4
global.buy4=1
if global.gshover=5
global.buy5=1
if global.gshover=6
global.buy6=1
if global.gshover=7
global.buy7=1
if global.gshover=8
global.buy8=1
if global.gshover=9
global.buy9=1
if global.gshover=10
global.buy10=1
if global.gshover=11
global.buy11=1
if global.gshover=12
global.buy12=1

if global.gshover=13
global.buy13=1
if global.gshover=14
global.buy14=1
if global.gshover=15
global.buy15=1
if global.gshover=16
global.buy16=1
if global.gshover=17
global.buy17=1
if global.gshover=18
global.buy18=1

global.bought=true

sound_play(sndTotal)
instance_destroy()
#define KeyPress_38
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if choice=0
{
sound_play(sndMenuCursor)
choice=1
}
#define KeyPress_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if choice=1
{
sound_play(sndMenuCursor)
choice=0
}
#define KeyPress_65
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=lag=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=choice=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndMenuBack)
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=choice=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.money-=global.price
if global.gshover=1
global.buy1=1
if global.gshover=2
global.buy2=1
if global.gshover=3
global.buy3=1
if global.gshover=4
global.buy4=1
if global.gshover=5
global.buy5=1
if global.gshover=6
global.buy6=1
if global.gshover=7
global.buy7=1
if global.gshover=8
global.buy8=1
if global.gshover=9
global.buy9=1
if global.gshover=10
global.buy10=1
if global.gshover=11
global.buy11=1
if global.gshover=12
global.buy12=1

if global.gshover=13
global.buy13=1
if global.gshover=14
global.buy14=1
if global.gshover=15
global.buy15=1
if global.gshover=16
global.buy16=1
if global.gshover=17
global.buy17=1
if global.gshover=18
global.buy18=1

global.bought=true

sound_play(sndTotal)
instance_destroy()
