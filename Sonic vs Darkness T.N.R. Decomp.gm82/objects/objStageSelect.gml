#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0

scroll=0

select=0 //Stage Select

cursor=0 // Cursor Position

cursor2=0

confirm=false // Pressing A/Enter

destroy=false

accepted=false

stageact=rmNIGHT

m=0 // Animated arrows

st=0
stage[st]="Nightlite Paradise"

if global.unlock_stage>=3
{
    st+=1
    stage[st]="Sunlight Paradise"
}
if global.unlock_stage>=6
{
    st+=1
    stage[st]="WinterPeak Valley"
}
if global.unlock_stage>=9
{
    st+=1
    stage[st]="Metallic Streets"
}
if global.unlock_stage>=12
{
    st+=1
    stage[st]="Melodic Forest"
}
if global.unlock_stage>=15
{
    st+=1
    stage[st]="Hilltop Ruins"
}
if global.unlock_stage>=18
{
    st+=1
    stage[st]="Lost Chambers"
}
if global.unlock_stage>=21
{
    st+=1
    stage[st]="True Genesis"
}

limit=st
small=0
em=0

key_alpha0=0
key_alpha1=0
button_alpha0=0
button_alpha1=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if accepted=false{
with objPlayer
x_speed=-4

with objHUBRoomtoLevel
alarm[1]=40}
else
{
view_object[0]=objCamera
with objPlayer{
goal=false
checknend=true
x_speed=5}

with objHUDBS1
instance_destroy()
with objHUDBS2
instance_destroy()
with objHUBRoomtoLevel
instance_destroy()


if !instance_exists(objWFadeOut){
instance_create(0,0,objWFadeOut)
global.loadscreen=240
if room=rmHUB{
global.loadlevel=2
global.room_lag=true
global.destination=stageact
global.room_change=TestIntro}}
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha0=2
key_alpha0=0
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha1=2
key_alpha1=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha<1 && destroy=false
alpha+=.1

else if alpha>0 && destroy=true
alpha-=.1

if alpha=0 && destroy=true
instance_destroy()

m+=.1

if m>=2
m=0

if instance_exists(objFadeOutFake){
if objFadeOutFake.alpha[10]>=1{
objFadeOutFake.back=true
instance_destroy()}}

if small<2
small+=.3

if em<5
em+=.2
if em=5
em=0

if button_alpha0>0
button_alpha0-=.1
if button_alpha1>0
button_alpha1-=.1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//**********************************************
// LEFT SIDE
//**********************************************

if select>6
a=1
else
a=0
draw_sprite_ext(sprStageSelectBG,a,view_xview[0]+50+160,view_yview[0]+38+95,min(1,alpha+.5),min(1,alpha+.5),0,c_white,alpha)

draw_sprite_ext(sprStageSelectCur,floor(small),view_xview[0]+56,view_yview[0]+69+8+17*cursor,1,1,0,c_white,1)

draw_set_font(global.fntMenu)
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_set_alpha(alpha)
for(i=scroll;i<min(limit+1,7+scroll);i+=1)
draw_text(view_xview[0]+73,view_yview[0]+73+17*max(i-scroll,0),stage[i])

if confirm=false{
// Arrow Bottom
if scroll<limit-6
draw_sprite(sprStageSelectAR,0,view_xview[0]+132,view_yview[0]+190-floor(m))

// Arrow Top
if scroll>0
draw_sprite(sprStageSelectAR,1,view_xview[0]+132,view_yview[0]+60+floor(m))}

//**********************************************
// RIGHT SIDE
//**********************************************

draw_set_font(global.fntMenu2)

draw_text(view_xview[0]+244,view_yview[0]+72,"Best Time")
draw_text(view_xview[0]+244,view_yview[0]+98,"Total Rings")
draw_text(view_xview[0]+244,view_yview[0]+124,"Total Score")

if global.stage[select*10+cursor2,2]>-1{
// Time
draw_number_zero(view_xview+294, view_yview+82, (global.stage[select*10+cursor2,0] div 10)    mod 100, 2); // mill
draw_number_zero(view_xview+278, view_yview+82, (global.stage[select*10+cursor2,0] div 1000)    mod 60, 2); // sec
draw_number_zero(view_xview+262, view_yview+82, (global.stage[select*10+cursor2,0] div 60000)    mod 60, 2); // min
draw_text(view_xview[0]+276,view_yview[0]+82,":")
draw_text(view_xview[0]+292,view_yview[0]+82,":")

// Rings
draw_number_zero(view_xview[0]+262,view_yview[0]+108,global.stage[select*10+cursor2,1],4)
// Score
draw_number_zero(view_xview[0]+262,view_yview[0]+133,global.stage[select*10+cursor2,2],7)}

else {
draw_text(view_xview[0]+262,view_yview[0]+82,"--------")
draw_text(view_xview[0]+262,view_yview[0]+108,"--------")
draw_text(view_xview[0]+262,view_yview[0]+133,"--------")}


if confirm=true
{
draw_sprite(sprStageSelectCur2,cursor2,view_xview[0]+239,view_yview[0]+174)
draw_text(view_xview[0]+240,view_yview[0]+160,"Choose Act:")

draw_text(view_xview[0]+240,view_yview[0]+174,"Act I")
if global.unlock_stage>=select*3+1//global.stage[0,3]!=-1 //Remove after release
draw_text(view_xview[0]+279,view_yview[0]+174,"Act II")
if global.unlock_stage>=select*3+2//global.stage[1,3]!=-1 //Remove after release
draw_text(view_xview[0]+323,view_yview[0]+174,"Boss")

draw_set_color(c_black)
if global.unlock_stage>=select*3+1//global.stage[0,3]!=-1 //Remove after release
draw_line(view_xview[0]+274,view_yview[0]+173,view_xview[0]+274,view_yview[0]+184)
if global.unlock_stage>=select*3+2//global.stage[1,3]!=-1 //Remove after release
draw_line(view_xview[0]+318,view_yview[0]+173,view_xview[0]+318,view_yview[0]+184)
}

//RANKS
if select<7
if (global.stage[select*10+cursor2,3]>-1)
draw_sprite_ext(sprStageSelectRA,global.stage[select*10+cursor2,3],view_xview[0]+323,view_yview[0]+73,1,1,0,c_white,alpha)

//EMERALDS
if select=0 && global.emeralds[0]=1
draw_sprite_ext(sprStageSelectEM,floor(select+em),view_xview[0]+328,view_yview[0]+43,1,1,0,c_white,alpha)
if select=1 && global.emeralds[1]=2
draw_sprite_ext(sprStageSelectEM,floor(select*5+em),view_xview[0]+328,view_yview[0]+43,1,1,0,c_white,alpha)
if select=2 && global.emeralds[2]=3
draw_sprite_ext(sprStageSelectEM,floor(select*5+em),view_xview[0]+328,view_yview[0]+43,1,1,0,c_white,alpha)
if select=3 && global.emeralds[3]=4
draw_sprite_ext(sprStageSelectEM,floor(select*5+em),view_xview[0]+328,view_yview[0]+43,1,1,0,c_white,alpha)
if select=4 && global.emeralds[4]=5
draw_sprite_ext(sprStageSelectEM,floor(select*5+em),view_xview[0]+328,view_yview[0]+43,1,1,0,c_white,alpha)
if select=5 && global.emeralds[5]=6
draw_sprite_ext(sprStageSelectEM,floor(select*5+em),view_xview[0]+328,view_yview[0]+43,1,1,0,c_white,alpha)
if select=6 && global.emeralds[6]=7
draw_sprite_ext(sprStageSelectEM,floor(select*5+em),view_xview[0]+328,view_yview[0]+43,1,1,0,c_white,alpha)

//**********************************************
// BOTTOM SIDE
//**********************************************

draw_set_font(global.fntMenu)
draw_set_color(c_white)

draw_text(view_xview[0]+208,view_yview[0]+210,"Confirm")
draw_text(view_xview[0]+317,view_yview[0]+210,"Back")

if global.xbox=false{
draw_sprite_ext(sprTrickJKeys,key_alpha0,view_xview+177,view_yview+204,1,1,0,c_white,alpha)
draw_sprite_ext(sprTrickJKeys,key_alpha1,view_xview+286,view_yview+204,1,1,0,c_white,alpha)

draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_confirm),view_xview+177,view_yview+204,1,1,0,c_white,alpha)
draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_back),view_xview+286,view_yview+204,1,1,0,c_white,alpha)}
else
{
draw_sprite_ext(sprPressScript360,0,view_xview+177,view_yview+204,1,1,0,c_white,alpha)
draw_sprite_ext(sprPressScript360,1,view_xview+286,view_yview+204,1,1,0,c_white,alpha)

draw_sprite_blend_ext(sprPressScript360,0,view_xview+177,view_yview+204,1,1,0,c_white,button_alpha0*alpha,bm_add)
draw_sprite_blend_ext(sprPressScript360,1,view_xview+286,view_yview+204,1,1,0,c_white,button_alpha1*alpha,bm_add)
}
draw_set_alpha(1)
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && destroy=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if select>0
{
if cursor=0 && select>0
scroll-=1

select-=1
sound_play(sndMenuCursor)

if cursor>0{
cursor-=1}
small=0
}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && destroy=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if select<limit
{
if cursor=6 && select<limit
scroll+=1

select+=1
sound_play(sndMenuCursor)

if cursor<min(6,limit){
cursor+=1}
small=0
}
#define Trigger_press Left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=true && accepted=false && destroy=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if cursor2>0
{
cursor2-=1
sound_play(sndMenuCursor)
}
#define Trigger_press Right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=true && accepted=false && destroy=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if cursor2<2
{
    if (global.unlock_stage>=select*3+1 && cursor2=0) || (global.unlock_stage>=select*3+2 && cursor2=1)//(global.stage[0,3]!=-1 && cursor2=0) || (global.stage[1,3]!=-1 && cursor2=1)
    { //Remove after release
        cursor2+=1
        sound_play(sndMenuCursor)
    }
}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha=1 && accepted=false{
button_alpha1=1
key_alpha1=2
alarm[1]=5
if confirm=false
destroy=true
else{
confirm=false
cursor2=0}
sound_play(sndMenuBack)}
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=destroy=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha=1
{
button_alpha0=1
key_alpha0=2
alarm[0]=5
if confirm=false && global.unlock_stage>=select*3+1//global.stage[0,3]!=-1
{
confirm=true
sound_play(sndMenuAccept)
}
else{
if accepted=false{
accepted=true
sound_stop(sndMenuAccept)
sound_play(sndMenuAccept2)
instance_create(0,0,objFadeOutFake)


if select=0 && cursor2=0
stageact=rmNIGHT
else if select=0 && cursor2=1
stageact=rmNIGHT2
else if select=0 && cursor2=2
stageact=rmBOSSRUN

else if select=1 && cursor2=0
stageact=rmSUNLIGHT
else if select=1 && cursor2=1
stageact=rmSUNLIGHT2
else if select=1 && cursor2=2
stageact=rmSUNLIGHTB

else if select=2
stageact=rmTEST

else if select=3
stageact=rmTEST2

else if select=4
stageact=rmGRIND

else
stageact=rmNIGHT}
}
}
