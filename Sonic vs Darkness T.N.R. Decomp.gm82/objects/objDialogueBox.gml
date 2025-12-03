#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hint=false
myPos=20 //Avoids any position functions turning up when writing the code
myPos2=1 //Avoids any position functions turning up when writing the code
tme=300
fl=60
keypress=false
alph=0
alph2=0
fade=false
delay=20

alarm[0]=300
blink=20
myStr="Press the A key To jump.
Try Jumping over the ledge."
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=room=rmFreeze
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if !FMODInstanceIsPlaying(global.BGMD) && !FMODInstanceIsPlaying(global.BGMINV) && !FMODInstanceIsPlaying(global.BGMS)
//FMODGroupSetPaused(3,0)

//FMODGroupSetPaused(4,0)
//FMODGroupSetPaused(2,0)

sound_unpause_all()

if FMODInstanceIsPlaying(global.BGMR)
FMODInstanceSetPaused(global.BGMR,0)

with objTut1
instance_destroy()
with objTut2
instance_destroy()
with objTut3
instance_destroy()

if global.backtoreverb=true{
global.backtoreverb=false
global.reverb=true}
room_goto(global.c_room)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fade=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if delay>0
delay-=.1

if room=rmFreeze
alarm[0]=-1

if fade=true{
alph-=.1
alph2-=.1}
else{
if alph<1
alph+=.1
else if alph2<1
alph2+=.1
}

blink-=1
if blink=0
blink=20

if alph=-2
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmFreeze
current=0
else
current=global.current_view

draw_sprite_ext(sprDialogueBox,0,view_xview+50,view_yview[current]+178,1,1,0,c_white, alph-.2)
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprDialogueBox,1,view_xview+50,view_yview[current]+178,1,1,0,c_white, alph)

draw_set_blend_mode(bm_normal)

draw_set_font(global.fntTutorial);
draw_set_halign(fa_left);

if global.xbox=true
cont=" button "
else
cont=" key "

if alph=1{
draw_set_color(c_white)
draw_set_alpha(alph2)
draw_text_special(view_xview+70,view_yview[current]+188,myStr,global.fntTutorial,c_white,12,280,0,2,0,0, 0)
draw_set_alpha(1)
if room=rmFreeze && fade=false{
draw_set_color(c_yellow)
draw_set_alpha((-delay)+1)
if blink>10
draw_text_ext(view_xview+185,view_yview[current]+222,"Press any"+cont+"to continue >",2,200)
else
draw_text_ext(view_xview+185,view_yview[current]+222,"Press any"+cont+"to continue",2,200)
draw_set_alpha(1)}
}
#define KeyPress_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmFreeze && delay=0{
fade=true}
