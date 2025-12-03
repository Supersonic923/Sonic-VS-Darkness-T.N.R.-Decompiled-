#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xm=220
ym=120
xm2=220
ym2=120

op=0 // main op

op2=0 // op for gd2

masterop=1 // op for box animation

colr=make_color_rgb(132,67,166)
colr2=make_color_rgb(172,104,176)
colr3=make_color_rgb(193,66,240)

key_alpha0=0
key_alpha1=0
button_alpha0=0
button_alpha1=0
arrowfd=0
arrowfd2=0
//**************************************

confirm=false

anispd=0
anispd2=0

arrow=0
alarm[0]=10

stage[0]=2
stage[1]=2
stage[2]=2
stage[3]=2
stage[4]=2
stage[5]=2
stage[6]=2
stage[7]=0

selection=0
stage_selection=0

unlock_selection=0

music=false

opc=-1

global.time_attack=true

unlocked_stages=global.unlock_stage

if global.player!="Sonic" && unlocked_stages>=21
unlocked_stages-=1

// Stage to highlight when pressing left (cover code)
if unlocked_stages<3
stage_total=0
else if unlocked_stages<6
stage_total=1
else if unlocked_stages<9
stage_total=2
else if unlocked_stages<12
stage_total=3
else if unlocked_stages<15
stage_total=4
else if unlocked_stages<18
stage_total=5
else if unlocked_stages<21
stage_total=6
else
stage_total=7
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Arrow Animation
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if arrow=0
arrow=1
else
arrow=0
alarm[0]=10
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha0=2
key_alpha0=0
#define Alarm_2
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
if xm>7
xm-=10
xm=max(xm,7)

if xm2<420-7
xm2+=10
xm2=min(xm2,420-7)

if xm=7
{
if ym>6
ym-=10
ym=max(ym,6)

if ym2<240-6
ym2+=10
ym2=min(ym2,240-6)

}

if op<1 && ym=6
op+=.1

if op2<1 && op>=1
op2+=.1

if music=true
FMODGroupFadeVolume(3,0,room_speed*.5)


if opc>-1
if opc.alph>=1
room_goto(rmLOADING)


if button_alpha0>0
button_alpha0-=.1
if button_alpha1>0
button_alpha1-=.1

if arrowfd>0
arrowfd-=.1
if arrowfd2>0
arrowfd2-=.1

if anispd>0
anispd-=max(min(point_distance(anispd,anispd,0,0)*.1,20),.2)
else if anispd<0
anispd+=max(min(point_distance(anispd,anispd,0,0)*.1,20),.5)

if anispd2>0
anispd2-=max(min(point_distance(anispd2,anispd2,0,0)*.1,20),.2)
else if anispd2<0
anispd2+=max(min(point_distance(anispd2,anispd2,0,0)*.1,20),.5)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Backdrop
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if op<1{
//first
draw_set_alpha(masterop)
draw_line_width_color(xm,ym,xm2,ym,2,colr,colr)

draw_line_width_color(xm,ym2,xm2,ym2,2,colr,colr)


draw_line_width_color(xm,ym,xm,ym2,2,colr,colr)

draw_line_width_color(xm2,ym,xm2,ym2,2,colr,colr)
draw_set_alpha(1)
}

// BG Fade
draw_background_ext(bg_options1,7,6,1,1,0,c_white,op)
draw_set_blend_mode(bm_add)
draw_background_ext(bg_gamedata2,9,8,1,1,0,c_white,op*.2)
draw_background_ext(bg_gamedata1,9,8,1,1,0,c_white,op)
draw_set_blend_mode(bm_normal)

//second
draw_set_alpha(op)
draw_rectangle_color(8,7,411,233,colr2,colr2,colr2,colr2,1)


//Time Attack Menu
draw_sprite_blend_ext(sprTATitle,1,9,16,1,1,0,c_white,op2,bm_add)
draw_sprite_ext(sprTATitle,0,9,16,1,1,0,c_white,op2)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Others
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Top Bar
draw_sprite_ext(sprTATopBar,0,9,66,1,1,0,c_white,op2)

// 1st 2nd 3rd
draw_sprite_ext(sprTAPlaces,0,44,112,1,1,0,c_white,op2)
draw_sprite_ext(sprTAPlaces,1,44,112+30,1,1,0,c_white,op2)
draw_sprite_ext(sprTAPlaces,2,44,112+60,1,1,0,c_white,op2)

//Arrow
draw_sprite_ext(sprTAArrow,0,37-arrow,77,1,1,0,c_white,op2)
draw_sprite_ext(sprTAArrow,1,376+arrow,77,1,1,0,c_white,op2)

draw_set_blend_mode(bm_add)
d3d_set_fog(true,c_white,0,0);
draw_sprite_ext(sprTAArrow,0,37-arrow,77,1,1,0,c_white,op2*arrowfd)
draw_sprite_ext(sprTAArrow,1,376+arrow,77,1,1,0,c_white,op2*arrowfd2)
d3d_set_fog(false,c_white,0,0);
draw_set_blend_mode(bm_normal)

//Levels and Acts
draw_sprite_ext(sprTALevels,stage_selection,210+anispd2,71,1,1,0,c_white,op2*((abs(anispd2)*-1)/100+1))
if stage_selection=7
draw_sprite_ext(sprTAActs,2,210+anispd,88,1,1,0,c_white,op2*((abs(anispd)*-1)/100+1))
else
draw_sprite_ext(sprTAActs,selection,210+anispd,88,1,1,0,c_white,op2*((abs(anispd)*-1)/100+1))


        draw_set_alpha(op2)
        draw_set_font(global.fntTimeAttack)
        draw_set_color(c_white)
        draw_set_halign(fa_center)

for (l=0;l<3;l+=1)
{
    if global.time_places[stage_selection*3+selection,l]>-1
    {
        draw_text(307, 117+(30*l), scr_time_format(global.time_places[stage_selection*3+selection,l]))


        if global.time_char[stage_selection*3+selection,l]="Sonic"
        charicon=0
        else if global.time_char[stage_selection*3+selection,l]="Shadow"
        charicon=1
        else if global.time_char[stage_selection*3+selection,l]="Blaze"
        charicon=2
        else if global.time_char[stage_selection*3+selection,l]="Silver"
        charicon=3
        else
        charicon=0
        //Char Icon
        draw_sprite_ext(sprTAChars,charicon,119,112+(30*l),1,1,0,c_white,op2)
    }
    else
    draw_sprite_ext(sprTANoTime,stage_selection,256,118+(30*l),1,1,0,c_white,op2)
}

//**********************************************
// BOTTOM SIDE
//**********************************************

draw_set_font(global.fntItem)
draw_set_color(c_white)
draw_set_halign(fa_left)

draw_text(view_xview[0]+208+28,view_yview[0]+212,"SELECT")
draw_text(view_xview[0]+317+28,view_yview[0]+212,"BACK")

if global.xbox=false{
draw_sprite_ext(sprTrickJKeys,key_alpha0,view_xview+177+28,view_yview+206,1,1,0,c_white,op2)
draw_sprite_ext(sprTrickJKeys,key_alpha1,view_xview+286+28,view_yview+206,1,1,0,c_white,op2)

draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_confirm),view_xview+177+28,view_yview+206,1,1,0,c_white,op2)
draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_back),view_xview+286+28,view_yview+206,1,1,0,c_white,op2)}
else
{
draw_sprite_ext(sprPressScript360,0,view_xview+177+28,view_yview+206,1,1,0,c_white,op2)
draw_sprite_ext(sprPressScript360,1,view_xview+286+28,view_yview+206,1,1,0,c_white,op2)

draw_sprite_blend_ext(sprPressScript360,0,view_xview+177+28,view_yview+206,1,1,0,c_white,button_alpha0*op2,bm_add)
draw_sprite_blend_ext(sprPressScript360,1,view_xview+286+28,view_yview+206,1,1,0,c_white,button_alpha1*op2,bm_add)
}
draw_set_alpha(1)
#define Trigger_press Left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && op2=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if unlocked_stages>0
{
    if unlock_selection>0
    {
        unlock_selection-=1

        if selection>0
        selection-=1
        else
        {
            if stage_selection>0
            {
                stage_selection-=1
                selection=2
            }
            else
            {
                stage_selection=stage_total
                selection=0
                unlock_selection=unlocked_stages
            }
            anispd2=-200
        }
    }
    else
    {
        unlock_selection=unlocked_stages
        stage_selection=stage_total
        selection=unlocked_stages-(3*stage_selection)
        anispd2=-200
    }

    anispd=-200

    arrowfd=1

    sound_play(sndMenuCursor)
}
#define Trigger_press Right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && op2=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if unlocked_stages>0
{
    if unlock_selection<unlocked_stages
    {
        unlock_selection+=1

        if selection<stage[stage_selection]
        selection+=1
        else{
        if stage_selection<stage_total
        stage_selection+=1
        else{
        stage_selection=0
        unlock_selection=0}
        selection=0
        anispd2=200}
    }

    else
    {
        stage_selection=0
        unlock_selection=0
        selection=0
        anispd2=200
    }

    anispd=200

    arrowfd2=1

    sound_play(sndMenuCursor)
}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && op2=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if instance_exists(objSMChoice)
{
    objSMChoice.single_player=true
    objSMChoice.main_menu=false
    objSMChoice.timeA=false
}*/

global.time_attack=false

w=instance_create(0,0,objCharMenu)

// CHARACTER MEMORY
if global.player="Shadow"
{
    w.port=1

    for(i=0;i<w.orbs;i+=1){
    if w.orbs=2
    w.key_rot[i]-=180
    else if w.orbs=3
    w.key_rot[i]-=120
    else if w.orbs=4
    w.key_rot[i]-=90}
}
if global.player="Blaze"
{
    w.port=2

    for(i=0;i<w.orbs;i+=1){
    if w.orbs=3
    w.key_rot[i]-=120*2
    else if w.orbs=4
    w.key_rot[i]-=90*2}
}
if global.player="Silver"
{
    w.port=3

    for(i=0;i<w.orbs;i+=1){
    w.key_rot[i]+=90}
}

sound_play(sndMenuBack)

instance_destroy()

confirm=true

button_alpha1=1
key_alpha1=2
alarm[2]=5
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && op2=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
confirm=true
sound_play(sndMenuConfirm)
music=true

button_alpha0=1
key_alpha0=2
alarm[1]=5

/****************************
    STAGE SELECTION
****************************/
if stage_selection=0
{
    if selection=0
    global.destination=rmNIGHT
    if selection=1
    global.destination=rmNIGHT2
    if selection=2
    global.destination=rmBOSSRUN
}
else if stage_selection=1
{
    if selection=0
    global.destination=rmSUNLIGHT
    if selection=1
    global.destination=rmSUNLIGHT2
    if selection=2
    global.destination=rmSUNLIGHTB
}

global.room_change=TestIntro
sound_play(sndMenuAccept)
opc=instance_create(0,0,objFadeOut)
opc.alph=-.1
global.loadlevel=0
