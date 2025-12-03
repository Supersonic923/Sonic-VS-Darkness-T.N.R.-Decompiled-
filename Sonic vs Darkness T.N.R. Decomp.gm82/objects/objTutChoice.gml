#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmTutIntro
mm=0
else
mm=1

bgal=0
bgal2=-1
bgal3=-2
/*
background_alpha[0]=0
background_alpha[1]=-1
background_alpha[2]=-2*/

image_alpha=-2
flash=0
go=0
pressed=false

global.loadscreen=-1

colr=make_color_rgb(26,0,46)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bgal<1
bgal+=.1
if bgal2<1
bgal2+=.1
if bgal3<1
bgal3+=.1

/*if background_alpha[0]<1
background_alpha[0]+=.1
if background_alpha[1]<1
background_alpha[1]+=.1
if background_alpha[2]<1
background_alpha[2]+=.1*/

if image_alpha<1
image_alpha+=.1

if global.loadscreen>0
global.loadscreen-=1
if global.loadscreen=0{
global.loadscreen=-1
room_goto(rmLOADING)}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(bgal)
draw_rectangle_color(0,0,420,240,c_black,c_black,colr,colr,0)
draw_set_alpha(1)
if room=rmTutIntro{
draw_background_ext(bg_TutCon2,81,93,1,1,0,c_white,bgal2)
draw_background_ext(bg_TutCon3,124,131,1,1,0,c_white,bgal3)}
if room=rmTutIntro2{
draw_background_ext(bg_TutCon4,162,93,1,1,0,c_white,bgal2)
draw_background_ext(bg_TutCon3,124,131,1,1,0,c_white,bgal3)}

if mm=0
draw_sprite_ext(sprTutChoice,0,117,120,1,1,0,c_white,image_alpha)
else
draw_sprite_ext(sprTutChoice,1,255,120,1,1,0,c_white,image_alpha)

if mm=0 && flash >5
draw_sprite_ext(sprTutChoice2,0,117,120,1,1,0,c_white,image_alpha)
else if mm=1 && flash >5
draw_sprite_ext(sprTutChoice2,1,255,120,1,1,0,c_white,image_alpha)

if flash>0{
flash-=1
go-=1}

if go>0 && flash=0
flash=10
#define Trigger_press Left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if mm=1&&image_alpha=1&& pressed=false{
image_alpha=0
mm=0
sound_play(sndMenuCursor)}
#define Trigger_press Right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if mm=0&&image_alpha=1&& pressed=false{
image_alpha=0
mm=1
sound_play(sndMenuCursor)}
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_alpha=1&& pressed=false{
pressed=true
sound_play(sndMenuAccept)
flash=10
go=5

if !instance_exists(objFadeOut){
global.loadscreen=40
if mm=0{
global.loadlevel=2
global.room_lag=true
if global.TUTPASS=true{
global.destination=rmNIGHT
global.room_change=TestIntro}
else{
global.destination=rmTRAIN
global.room_change=rmQuickLoad}
instance_create(0,0,objFadeOut)}
else{
global.loadlevel=2
global.room_lag=true
global.room_change=rmHUB
instance_create(0,0,objFadeOut)}}
}
