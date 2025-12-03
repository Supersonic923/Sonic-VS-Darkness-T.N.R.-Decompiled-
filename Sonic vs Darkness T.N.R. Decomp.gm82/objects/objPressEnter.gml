#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

delay=380
pressed=false
show=false

scale=1
alpha=1
alpha2=.7

if global.xbox=true
image_index=1

fade=180


if global.no_start_menu=true
{
instance_create(0,0,objSMChoice)
with objBGMENU
{
scale=1
intro=1
credits=1
black=.5
wipe=500
skip=true
}
instance_destroy()
}
else
global.no_start_menu=true
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//instance_create(0,0,objSMChoice)
instance_create(0,0,objGameData)
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
if delay>0
delay-=1

if delay=0
show=true

if pressed=true{
if scale<20
scale+=.025
if alpha2>0
alpha2-=.09}

if show=true && pressed=false{
fade+=3
if fade>=360
fade=0}

if pressed=true{
fade=0
if alpha>0
alpha-=.1}
else
alpha=min(lengthdir_x(1,fade)/2+.5,1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if show=true{
//symbol
draw_sprite_blend_ext(sprPressEnterB,0,x,y,1,1,0,c_white,alpha*.35,bm_add)
//press enter
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,alpha)
//press enter Fx
if pressed=true
draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,0,c_white,alpha2)}
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if show=false
{
show=true
delay=0
image_index=0
}
else
{
if pressed=false
{
image_speed=0
image_index=0
sound_play(sndMenuAccept)
pressed=true
alarm[0]=30
alpha=1
}
}
