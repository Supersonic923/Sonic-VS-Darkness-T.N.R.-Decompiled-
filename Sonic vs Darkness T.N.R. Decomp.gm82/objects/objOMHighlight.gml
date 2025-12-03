#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=1
cc=1
mm=0 // selection cursor
if global.optres=0
um=0 // res cursor
else
um=1
av=false
goto=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_angle>0
image_angle-=20
if image_alpha<1
image_alpha+=.05

if mm=0{ y=ystart}

if mm=1{ y=155}

if mm=2{ y=208}

if mm=3{ y=262}

// lights cursor
with objOML0 {if ind=0{x=xstart global.optres=false} if ind=1{x=500 global.optres=true}}
with objOML1 {if ind=0{x=xstart global.optauto=true} if ind=1{x=500 global.optauto=false}}
with objOML2 {if ind=0{x=xstart global.optcam=false} if ind=1{x=500 global.optcam=true}}
with objOML3 {if ind=0{x=xstart global.optcont=0} if ind=1{x=500 global.optcont=1}}

//ALT Buttons
if global.b_button=true{
keyboard_key_press(vk_backspace)
keyboard_key_release(vk_backspace)
global.b_button=false
}
#define KeyPress_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objWipeTransition)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objWipeTransition){
sound_play(sndMenuBack2)
instance_create(0,0,objWipeTransition)}
#define KeyPress_37
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objWipeTransition)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if mm=0
{
with objOML0
if ind=1{
ind=0
image_alpha=0
sound_play(sndMenuCursor3)}
}

if mm=1
{
with objOML1
if ind=1{
ind=0
image_alpha=0
sound_play(sndMenuCursor3)}
}

if mm=2
{
with objOML2
if ind=1{
ind=0
image_alpha=0
sound_play(sndMenuCursor3)}
}

if mm=3
{
with objOML3
if ind=1{
ind=0
image_alpha=0
sound_play(sndMenuCursor3)}
}
#define KeyPress_38
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objWipeTransition)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


if mm=1{ mm=0 sound_play(sndMenuCursor2) image_angle=340}

if mm=2{ mm=1 sound_play(sndMenuCursor2) image_angle=340}

if mm=3{ mm=2 sound_play(sndMenuCursor2) image_angle=340}
#define KeyPress_39
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objWipeTransition)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if mm=0
{
with objOML0
if ind=0{
ind=1
image_alpha=0
sound_play(sndMenuCursor3)}
}

if mm=1
{
with objOML1
if ind=0{
ind=1
image_alpha=0
sound_play(sndMenuCursor3)}
}

if mm=2
{
with objOML2
if ind=0{
ind=1
image_alpha=0
sound_play(sndMenuCursor3)}
}

if mm=3
{
with objOML3
if ind=0{
ind=1
image_alpha=0
sound_play(sndMenuCursor3)}
}
#define KeyPress_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objWipeTransition)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if mm=2{ mm=3 sound_play(sndMenuCursor2) image_angle=340}

if mm=1{ mm=2 sound_play(sndMenuCursor2) image_angle=340}

if mm=0{ mm=1 sound_play(sndMenuCursor2) image_angle=340}
