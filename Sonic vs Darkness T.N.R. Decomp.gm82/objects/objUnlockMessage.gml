#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
myPos=1 //Avoids any position functions turning up when writing the code
myPos2=1 //Avoids any position functions turning up when writing the code
tme=300
fl=60
keypress=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if tme>0
tme-=1

if tme=0{
if fl>0
fl-=1
else
fl=50}

if instance_exists(objFadeOut)
if objFadeOut.alph=1{
global.unlocknew=0
room_goto(rmLOADING)}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var myStr,copyStr;
myStr="You've Just unlocked "+string(global.unlocknew)+" Item(s)!                                      
Go to the Gift Shop And see
what you can buy!"
copyStr=string_copy(myStr,1,myPos)
draw_set_font(fntMicroMd)
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_text_ext_transformed(125,234,copyStr,-1,-1,1,1, 0)
myPos+=0.5 //Number of characters revealed per step (0.5 for one every two steps)

if tme=0{
var myStr2,copyStr2;
if fl<25
myStr2="Next  "
else
myStr2="Next >"
copyStr2=string_copy(myStr2,1,myPos2)
draw_set_font(fntMicro15)
draw_set_halign(fa_left)
draw_set_color(make_color_rgb(172,249,145))
draw_text_ext_transformed(450,305,copyStr2,-1,-1,1,1, 0)
myPos2+=0.5 //Number of characters revealed per step (0.5 for one every two steps)
}
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keypress=false{
var op;
if tme=0
{
global.room_change=rmHUB
op=instance_create(0,0,objFadeOut)
op.alph=-.5
global.loadlevel=2
global.savegame=true
keypress=true
}
}
#define KeyPress_65
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keypress=false{
var op;
if tme=0
{
global.room_change=rmHUB
op=instance_create(0,0,objFadeOut)
op.alph=-.5
global.loadlevel=2
global.savegame=true
keypress=true
}}
