#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha1=0
alpha2=-1
alpha3=-2
alpha4=0
op=-1

confirm=false
xspd=0

ymove=148

ta_sel=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//sound_fxfree()
FMODEffectFree(global.EFF2)
global.EFF2=0
if global.EFF!=0 && global.filter=2
{
        FMODEffectFree(global.EFF)
        global.EFF=0
        global.filter=0
}
if global.EFF!=0 && global.filter=1
    {
        FMODEffectFree(global.EFF)
        global.EFF=0
        FMODEffectFree(global.EFFS)
        global.EFFS=0
        FMODEffectFree(global.EFFD)
        global.EFFD=0
        global.filter=0
    }

//stops other music
if FMODInstanceIsPlaying(global.BGMS)
FMODInstanceStop(global.BGMS)
if FMODInstanceIsPlaying(global.BGMINV)
FMODInstanceStop(global.BGMINV)
if FMODInstanceIsPlaying(global.BGMD)
FMODInstanceStop(global.BGMD)
if FMODInstanceIsPlaying(global.BGMR)
FMODInstanceStop(global.BGMR)
FMODGroupSetPaused(3,0)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha1<1
alpha1+=.1
if alpha2<1
alpha2+=.1
if alpha3<1
alpha3+=.1
if alpha4>0
alpha4-=.1


if op>-1
if op.alph>=1
room_goto(rmLOADING)

xspd-=1
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ta_sel=3
global.time_attack=false
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_ext(bg_go1,0,0,1,1,0,c_white,1)

for(i=0;i<=800;i+=800){
draw_background_ext(bg_menu2,xspd+i,40,1,1,0,c_white,.7)
draw_background_ext(bg_menu2,xspd+i+800,45,-1,1,0,c_white,.7)}

draw_background_ext(bg_go3,0,0,1,1,0,c_white,1)

if global.time_attack=false
{
    draw_background_ext(bg_go4,87,91,1,1,0,c_white,alpha1)
    draw_background_ext(bg_go5,146,130,1,1,0,c_white,alpha2)
    draw_background_ext(bg_go6,181,ymove,1,1,0,c_white,alpha3)
    draw_set_blend_mode(bm_add)
    draw_background_ext(bg_go6,181,ymove,1,1,0,c_white,alpha4)
    draw_set_blend_mode(bm_normal)
}
else
{
    for(l=0;l<4;l+=1)
    draw_sprite_ext(sprTAGameOver,l,99,101+(20*l),1,1,0,c_white,alpha1)

    draw_sprite_ext(sprTAGameOverS,0,90,98+(20*ta_sel),1,1,0,c_white,alpha2)

    draw_sprite_blend_ext(sprTAGameOverS,0,90,98+(20*ta_sel),1,1,0,c_white,alpha4,bm_add)
}






if xspd=-800
xspd=0
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if confirm=false
{
    if global.time_attack=false
    {
        if alpha3>=1
        if ymove!=148
        {
            alpha3=0
            ymove=148
            sound_play(sndMenuCursor)
        }
    }
    else
    {
        if alpha2>=1
        if ta_sel>0
        {
            alpha2=0
            ta_sel-=1
            sound_play(sndMenuCursor)
        }
    }
}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if confirm=false
{
    if global.time_attack=false
    {
        if alpha3>=1
        if ymove!=168
        {
            alpha3=0
            ymove=168
            sound_play(sndMenuCursor)
        }
    }
    else
    {
        if alpha2>=1
        if ta_sel<3
        {
            alpha2=0
            ta_sel+=1
            sound_play(sndMenuCursor)
        }
    }
}
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha3>=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if confirm=false
{
    if global.time_attack=false
    {
        if ymove=148
        {
            global.room_change=TestIntro
            sound_play(sndMenuAccept)
            op=instance_create(0,0,objFadeOut)
            op.alph=-.1
            global.loadlevel=0
            global.room_lag=true
        }
        else
        {
            global.room_change=rmStartMenu
            sound_play(sndMenuAccept)
            op=instance_create(0,0,objFadeOut)
            op.alph=-.1
            op.commandfade=true
            global.loadlevel=1
        }
    }
    else
    {
        if ta_sel=0
        {
            global.room_change=TestIntro
            sound_play(sndMenuAccept)
            op=instance_create(0,0,objFadeOut)
            op.alph=-.1
            global.loadlevel=0
            global.room_lag=true
        }
        if ta_sel=1
        {
            global.room_change=rmStartMenu
            sound_play(sndMenuAccept)
            op=instance_create(0,0,objFadeOut)
            op.alph=-.1
            op.commandfade=true
            global.loadlevel=1
        }
        if ta_sel=2
        {
            global.room_change=rmStartMenu
            sound_play(sndMenuAccept)
            op=instance_create(0,0,objFadeOut)
            op.alph=-.1
            op.commandfade=true
            global.loadlevel=1
            global.time_attack=2
        }
        if ta_sel=3
        {
            global.room_change=rmStartMenu
            sound_play(sndMenuAccept)
            op=instance_create(0,0,objFadeOut)
            op.alph=-.1
            op.commandfade=true
            global.loadlevel=1
            global.time_attack=2
        }
    }
        confirm=true
        alpha4=1
}
