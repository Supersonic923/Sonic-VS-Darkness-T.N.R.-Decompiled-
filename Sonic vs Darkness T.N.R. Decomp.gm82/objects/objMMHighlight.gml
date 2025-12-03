#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=1
//global.mainmenu=0
cc=1
if global.mainmenu=0
mm=0
if global.mainmenu=1
mm=1
if global.mainmenu=2
mm=2
av=false
goto=0
pressed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_alpha<1
image_alpha+=.05

if mm=0{ y=ystart x=xstart}

if mm=1{ y=156 x=536}

if mm=2{ y=216 x=530}

if mm=3{ y=276 x=xstart}


//-----Loading------------------

if instance_exists(objFadeOut)
if objFadeOut.alph=1{
FMODInstanceStop(global.BGM)
room_goto(rmLOADING)}
#define KeyPress_13
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
if mm=0&&pressed=0{
/*global.player = "Salom";
global.room_change=rmHUB
sound_play(sndResultA)
instance_create(0,0,objFadeOut)
objFadeOut.alpha=-1
global.loadlevel=1
global.ADD=1
pressed=1*/
global.mainmenu=0
instance_create(0,0,objWipeTransition)
sound_play(sndMenuAccept)}

if mm=1{
global.mainmenu=1
instance_create(0,0,objWipeTransition)
sound_play(sndMenuAccept)}

if mm=2{
global.mainmenu=2
instance_create(0,0,objWipeTransition)
sound_play(sndMenuAccept)}

if mm=3
game_end()
#define KeyPress_38
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=pressed=0
*/
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


if mm=1{ mm=0 image_alpha=0 sound_play(sndMenuCursor)}

if mm=2{ mm=1 image_alpha=0 sound_play(sndMenuCursor)}

if mm=3{ mm=2 image_alpha=0 sound_play(sndMenuCursor)}
#define KeyPress_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=pressed=0
*/
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

if mm=2{ mm=3 image_alpha=0 sound_play(sndMenuCursor)}

if mm=1{ mm=2 image_alpha=0 sound_play(sndMenuCursor)}

if mm=0{ mm=1 image_alpha=0 sound_play(sndMenuCursor)}
#define KeyPress_65
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
if mm=0&&pressed=0{
/*global.player = "Salom";
global.room_change=rmHUB
sound_play(sndResultA)
instance_create(0,0,objFadeOut)
objFadeOut.alpha=-1
global.loadlevel=1
global.ADD=1
pressed=1*/
global.mainmenu=0
instance_create(0,0,objWipeTransition)
sound_play(sndMenuAccept)}

if mm=1{
global.mainmenu=1
instance_create(0,0,objWipeTransition)
sound_play(sndMenuAccept)}

if mm=2{
global.mainmenu=2
instance_create(0,0,objWipeTransition)
sound_play(sndMenuAccept)}

if mm=3
game_end()
