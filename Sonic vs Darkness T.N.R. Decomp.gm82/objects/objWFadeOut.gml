#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph=-2
back=false
next=false

new_loadscreen=240
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alph<1 && back=false
alph+=.015

if back=true
alph-=.05

if back=true && alph<=0
instance_destroy()

if global.room_change=TestIntro
depth=-1000002

if alph=-.5
MusicSystem.fademusic=true
if alph=-.95{
with objController
sound_play(sndLevelFade)}

if instance_exists(objCamera) && alph>-.5 && alph<1 && back=false
objCamera.look_shift_x-=2

if alph>=1
objCamera.look_shift_x=0


if global.online_mode=true
{
    if new_loadscreen>0
        new_loadscreen-=1

    if new_loadscreen=0
    {
        room_goto(rmLOADING)
        new_loadscreen=-1
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_white)
draw_set_alpha(alph)
draw_rectangle(view_xview,view_yview,view_xview+view_wview,view_yview+view_hview,0)
draw_set_alpha(1)
