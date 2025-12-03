#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph=-.6
back=false
next=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alph<1 && back=false
alph+=.01

if back=true
alph-=.05

if back=true && alph<=0
instance_destroy()

if alph>=1 && next=false{
FMODInstanceStop(global.BGM)
FMODGroupFadeVolume(3,1,1)
next=true
global.loadlevel=0
global.room_change=rmQuickLoad
global.destination=rmTRAIN
if room=rmTRAIN || room=rmNIGHT{
sound_stop_all()
room_goto(rmTutIntro2)}
else{
room_goto(rmPlayer)}
visible=false}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_black)
draw_set_alpha(alph)
if global.nds=true
draw_rectangle(view_xview[7],view_yview[7],view_xview[7]+view_wview[7],view_yview[7]+view_hview[7],0)
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],0)
draw_set_alpha(1)
