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

des=0

with objPlayer
goal=true
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer
goal=false
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

if des>0
des-=1
if des=1
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if limit<7
draw_sprite_ext(sprGSCon2Fade,limit,view_xview+320,180,1,1,0,c_white,alpha)
else
draw_sprite_ext(sprACConfirm2,choice,view_xview+320,180,1,1,0,c_white,alpha)
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
if global.money>=20{
global.money-=20
sound_play(sndTotal)
with objWallBlocker
instance_destroy()
with objGSPopUp
instance_destroy()
instance_destroy()}
else{
instance_create(0,0,objACConfirm)
instance_destroy()}
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
des=2//instance_destroy()
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
if global.money>=20{
global.money-=20
sound_play(sndTotal)
with objWallBlocker
instance_destroy()
with objGSPopUp
instance_destroy()
des=2}//instance_destroy()}
else{
instance_create(0,0,objACConfirm)
des=2}//instance_destroy()}
