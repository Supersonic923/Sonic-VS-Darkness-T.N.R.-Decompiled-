#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.sound_test=true

track_sel=0

title_mov=-500//250
title_alpha=0

bar_sel=0

master_op=0

select_op_T=0
select_op_B=0

right_sel=0
right_al=0

light1=0
light2=1

rec_fade=0

selection=2

play_mode=true

loop_mode=false
fade_music=false

destroy=false

counter=0

confirm=true
alarm[0]=60
delay=1

l_tap=0
r_tap=0

ml=0

back_delay=0 // double tap rewind to move the track back

music_list[ml,0]="Main Menu" // Title of the song
music_list[ml,1]="music/SvD_StartMenu.ogg" // File of the song
music_list[ml,2]=0 // Loop point of the song
music_list[ml,3]=0 // First time load
music_list[ml,4]=.6 // Volume

ml+=1
music_list[ml,0]="Tutorial Stage"
music_list[ml,1]="music/SvD_Train.ogg"
music_list[ml,2]=27173
music_list[ml,3]=0
music_list[ml,4]=.5

ml+=1
music_list[ml,0]="Resting Base A"
music_list[ml,1]="music/SvD_Base.ogg"
music_list[ml,2]=6569
music_list[ml,3]=0
music_list[ml,4]=.3

ml+=1
music_list[ml,0]="Item Shop"
music_list[ml,1]="music/SvD_ItemShop.ogg"
music_list[ml,2]=1154
music_list[ml,3]=0
music_list[ml,4]=.54

ml+=1
music_list[ml,0]="Nightlite Paradise [ Stage 1 ]"
music_list[ml,1]="music/SvD_Night.ogg"
music_list[ml,2]=8060
music_list[ml,3]=0
music_list[ml,4]=.68

ml+=1
music_list[ml,0]="Sunlight Paradise [ Stage 2 ]"
music_list[ml,1]="music/SvD_Sun.ogg"
music_list[ml,2]=12933
music_list[ml,3]=0
music_list[ml,4]=.52

ml+=1
music_list[ml,0]="Boss Phase [ Dr. Eggman ]"
music_list[ml,1]="music/SvD_Boss.ogg"
music_list[ml,2]=22450
music_list[ml,3]=0
music_list[ml,4]=.69

ml+=1
music_list[ml,0]="Boss Phase [ Nightmare ]"
music_list[ml,1]="music/SvD_Boss2.ogg"
music_list[ml,2]=56824
music_list[ml,3]=0
music_list[ml,4]=.54

ml+=1
music_list[ml,0]="Stage Complete"
music_list[ml,1]="music/SvD_Complete.ogg"
music_list[ml,2]=-1
music_list[ml,3]=0
music_list[ml,4]=.5

ml+=1
music_list[ml,0]="Boss Defeated"
music_list[ml,1]="music/SvD_Defeat.ogg"
music_list[ml,2]=-1
music_list[ml,3]=0
music_list[ml,4]=.55

ml+=1
music_list[ml,0]="Stage Results"
music_list[ml,1]="music/SvD_Results.ogg"
music_list[ml,2]=24477
music_list[ml,3]=0
music_list[ml,4]=.6

ml+=1
music_list[ml,0]="Boss Results"
music_list[ml,1]="music/SvD_Results2.ogg"
music_list[ml,2]=33965
music_list[ml,3]=0
music_list[ml,4]=.56

ml+=1
music_list[ml,0]="New Record A"
music_list[ml,1]="music/SvD_Result1.ogg"
music_list[ml,2]=3166
music_list[ml,3]=0
music_list[ml,4]=.54

ml+=1
music_list[ml,0]="New Record B"
music_list[ml,1]="music/SvD_Result2.ogg"
music_list[ml,2]=13334
music_list[ml,3]=0
music_list[ml,4]=.54

ml+=1
music_list[ml,0]="Invincibility [ Jingle ]"
music_list[ml,1]="music/SvD_Invincible.ogg"
music_list[ml,2]=-1
music_list[ml,3]=0
music_list[ml,4]=.55

ml+=1
music_list[ml,0]="Drowning [ Jingle ]"
music_list[ml,1]="music/SvD_Drown.ogg"
music_list[ml,2]=-1
music_list[ml,3]=0
music_list[ml,4]=.55

ml+=1
music_list[ml,0]="Game Over"
music_list[ml,1]="music/SvD_GameOver.ogg"
music_list[ml,2]=-1
music_list[ml,3]=0
music_list[ml,4]=.5



track_max=ml
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
confirm=false
delay=0
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Arrows
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
l_tap=0
r_tap=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if right_al<1 && bar_sel=-1
right_al+=.1

if loop_mode=true
{
    if light1<1
    light1+=.1
    if light2>0
    light2-=.1
}
else
{
    if light2<1
    light2+=.1
    if light1>0
    light1-=.1
}

if back_delay>0
back_delay-=1

if master_op<1
master_op+=.1

if select_op_T<1
select_op_T+=.1
if select_op_B<1
select_op_B+=.1

if title_mov<0 && destroy=false
title_mov+=max(point_distance(title_mov,title_mov,0,0)*.1,.5)

if title_mov>-150 && destroy=true
title_mov-=10

title_mov=max(min(title_mov,0),-250)

if title_alpha<1
title_alpha+=.1

if play_mode=false && loop_mode=false
counter+=1000/60

if loop_mode=false
{

    if FMODInstanceSoundGetLength(global.BGM)<60000
    fade_time=180
    else
    fade_time=480


    if counter>=FMODInstanceSoundGetLength(global.BGM)-(fade_time+25)*(1000/60) && FMODGroupGetPaused(3)=0 && fade_music=true
    FMODGroupFadeVolume(3,0,fade_time)

    if counter>=FMODInstanceSoundGetLength(global.BGM) && FMODGroupGetPaused(3)=0
    {
        FMODInstanceSetPosition(global.BGM,0)
        FMODGroupSetPaused(3,1)
        play_mode=true
        counter=0
        FMODGroupFadeVolume(3,global.musicvolume,1)
    }
}
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
if delay=0{
if instance_exists(objFadeOutFake){
if objFadeOutFake.alpha[10]>=1{
objFadeOutFake.back=true
room_goto(rmStartMenu)}}}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Reset music volume
FMODGroupSetMuted(3,false)
FMODGroupSetPaused(3,false)
FMODInstanceStop(global.BGM)
FMODGroupFadeVolume(3,global.musicvolume,1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprSTButtonBar,0,39,44,1,1,0,c_white,master_op)

draw_sprite_ext(sprSTTitleBar,0,0,93,420,1,0,c_white,master_op)

if bar_sel=1
draw_sprite_blend_ext(sprSTSelectionT,0,0,96,420,1,0,c_white,master_op*select_op_T,bm_add)


if selection=0 && bar_sel=0
draw_sprite_blend_ext(sprSTSelectionB,0,82,62,1,1,0,c_white,master_op*select_op_B,bm_add)
if selection>0 && selection<4 && bar_sel=0
draw_sprite_blend_ext(sprSTSelectionB,1,84+(51*selection),62,1,1,0,c_white,master_op*select_op_B,bm_add)
if selection=4 && bar_sel=0
draw_sprite_blend_ext(sprSTSelectionB,2,290,62,1,1,0,c_white,master_op*select_op_B,bm_add)

draw_sprite_ext(sprSTArrows,0,18-l_tap,98,1,1,0,c_white,master_op)
draw_sprite_ext(sprSTArrows,1,388+r_tap,98,1,1,0,c_white,master_op)

draw_sprite_blend_ext(sprSTArrows,0,18-l_tap,98,1,1,0,c_white,master_op*l_tap,bm_add)
draw_sprite_blend_ext(sprSTArrows,1,388+r_tap,98,1,1,0,c_white,master_op*r_tap,bm_add)

for(i=0;i<5;i+=1)
{
    sprz=i
    if i=2
    {
        if play_mode=false
        sprz=5
    }
    if i=4
    {
        if FMODGroupGetMuted(3)=true
        sprz=6
    }
    draw_sprite_ext(sprSTButtons,sprz,86+(51*i),63,1,1,0,c_white,master_op)
}

draw_set_color(c_white)
draw_set_font(global.fntSoundTest)
draw_set_halign(fa_center)

draw_text(210,99,string_upper(string(music_list[track_sel,0])))


if loop_mode=false{
draw_set_halign(fa_left)

// LINES
draw_rectangle(80,130,80+259,130+1,0)
draw_set_color(make_color_rgb(204,0,255))
draw_rectangle(80,130,80+(FMODInstanceGetPosition(global.BGM)*259),130+1,0)
draw_set_color(c_black)

draw_set_alpha(.5)
draw_rectangle(80,130,81,131,0)
draw_rectangle(338,130,339,131,0)
draw_set_alpha(1)
draw_set_color(c_white)
draw_rectangle(78,128,78+1,128+5,0)
draw_rectangle(340,128,340+1,128+5,0)

draw_sprite_ext(sprSTNode,0,80+(FMODInstanceGetPosition(global.BGM)*250),126,1,1,0,c_white,master_op)

// TIME STAMPS
draw_set_font(global.fntSTTimeFont)
draw_text(88,139,string(sound_time(counter)))
draw_text(303,139,string(sound_time(FMODInstanceSoundGetLength(global.BGM))))
}

// RIGHT BAR
draw_sprite_ext(sprSTRightBar,0,294,0,1,1,0,c_white,master_op)

// Black out Loop
if (play_mode=true && FMODInstanceIsPlaying(global.ADD)=false && FMODInstanceGetPosition(global.BGM)=0)
{
    if rec_fade>0
    rec_fade-=.1
}
else
{
    if rec_fade<.6
    rec_fade+=.1
}
draw_set_alpha(rec_fade)
draw_set_color(c_black)
draw_rectangle(294,0,360,21,0)
draw_set_alpha(1)

draw_sprite_blend_ext(sprSTRightBarL,0,294,0,1,1,0,c_white,master_op*light1,bm_add)
draw_sprite_blend_ext(sprSTRightBarL,1,294,0,1,1,0,c_white,master_op*light2,bm_add)


if right_sel=0 && bar_sel=-1
draw_sprite_blend_ext(sprSTRightBar,1,294,0,1,1,0,c_white,master_op*right_al,bm_add)
if right_sel=1 && bar_sel=-1
draw_sprite_blend_ext(sprSTRightBar,2,294,0,1,1,0,c_white,master_op*right_al,bm_add)

// MENU TITLE
draw_sprite_blend_ext(sprSTMenuTitle,1,title_mov,0,1,1,0,c_white,title_alpha,bm_add)
draw_sprite_ext(sprSTMenuTitle,0,title_mov,0,1,1,0,c_white,title_alpha)
#define Trigger_press Menu A
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=bar_sel=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if selection=0
{
    if FMODGroupGetPaused(3)=1 || FMODInstanceIsPlaying(global.BGM){
    FMODInstanceSetPosition(global.BGM,0)
    FMODGroupSetPaused(3,1)
    play_mode=true
    sound_play(sndMenuCursor2)
    counter=0
    FMODGroupFadeVolume(3,global.musicvolume,1)}
}
if selection=1
{
    if back_delay=0
    {
        if FMODGroupGetPaused(3)=1 || FMODInstanceIsPlaying(global.BGM){
        FMODInstanceSetPosition(global.BGM,0)
        counter=0
        FMODGroupFadeVolume(3,global.musicvolume,1)}

        back_delay=90
    }
    else
    {
        if track_sel>0
        {
            track_sel-=1
        }
        else
        {
            track_sel=track_max
        }

        if music_list[track_sel,3] = 0
            music_list[track_sel,3] = FMODSoundAdd(music_list[track_sel,1],false,true);
        if global.ADD != music_list[track_sel,3] || (FMODInstanceIsPlaying(global.ADD)=false && FMODInstanceGetPosition(global.BGM)=0)
        {
            change=true
            global.ADD = music_list[track_sel,3]
            sizeinms = FMODSoundGetLength(global.ADD)
            FMODSoundSetLoopPoints(global.ADD,safe_division(music_list[track_sel,2],sizeinms),1);
            maxv=music_list[track_sel,4]
        }

        FMODGroupSetPaused(3,0)

        if change=true
        {
            FMODInstanceStop(global.BGM)
            FMODGroupFadeVolume(3,global.musicvolume,1)
            FMODSoundSetGroup(global.ADD,3);
            FMODSoundSetMaxVolume(global.ADD,maxv);
            if loop_mode=false //music_list[track_sel,2]=-1 &&
            {
                global.BGM = FMODSoundPlay(global.ADD);
                if music_list[track_sel,2]!=-1
                fade_music=true
                else
                fade_music=false
            }
            else if loop_mode=true{
                global.BGM = FMODSoundLoop(global.ADD);
                fade_music=false}
            change=false
        }
        play_mode=false
        counter=0
        back_delay=90
    }
}
if selection=2
{
    if play_mode=true
    {
        if music_list[track_sel,3] = 0
            music_list[track_sel,3] = FMODSoundAdd(music_list[track_sel,1],false,true);
        if global.ADD != music_list[track_sel,3] || (FMODInstanceIsPlaying(global.ADD)=false && FMODInstanceGetPosition(global.BGM)=0)
        {
            change=true
            global.ADD = music_list[track_sel,3]
            sizeinms = FMODSoundGetLength(global.ADD)
            FMODSoundSetLoopPoints(global.ADD,safe_division(music_list[track_sel,2],sizeinms),1);
            maxv=music_list[track_sel,4]
        }

        FMODGroupSetPaused(3,0)

        if change=true
        {
            FMODInstanceStop(global.BGM)
            FMODGroupFadeVolume(3,global.musicvolume,1)
            FMODSoundSetGroup(global.ADD,3);
            FMODSoundSetMaxVolume(global.ADD,maxv);
            if loop_mode=false //music_list[track_sel,2]=-1 &&
            {
                global.BGM = FMODSoundPlay(global.ADD);
                if music_list[track_sel,2]!=-1
                fade_music=true
                else
                fade_music=false
            }
            else if loop_mode=true{
                global.BGM = FMODSoundLoop(global.ADD);
                fade_music=false}
            change=false
        counter=0
        }
        play_mode=false

    }
    else
    {
        FMODGroupSetPaused(3,1)
        play_mode=true
    }
}

if selection=3
{
    if track_sel<track_max
    {
        track_sel+=1
    }
    else
    {
        track_sel=0
    }

        if music_list[track_sel,3] = 0
            music_list[track_sel,3] = FMODSoundAdd(music_list[track_sel,1],false,true);
        if global.ADD != music_list[track_sel,3] || (FMODInstanceIsPlaying(global.ADD)=false && FMODInstanceGetPosition(global.BGM)=0)
        {
            change=true
            global.ADD = music_list[track_sel,3]
            sizeinms = FMODSoundGetLength(global.ADD)
            FMODSoundSetLoopPoints(global.ADD,safe_division(music_list[track_sel,2],sizeinms),1);
            maxv=music_list[track_sel,4]
        }

        FMODGroupSetPaused(3,0)

        if change=true
        {
            FMODInstanceStop(global.BGM)
            FMODGroupFadeVolume(3,global.musicvolume,1)
            FMODSoundSetGroup(global.ADD,3);
            FMODSoundSetMaxVolume(global.ADD,maxv);
            if loop_mode=false //music_list[track_sel,2]=-1 &&
            {
                global.BGM = FMODSoundPlay(global.ADD);
                if music_list[track_sel,2]!=-1
                fade_music=true
                else
                fade_music=false
            }
            else if loop_mode=true{
                global.BGM = FMODSoundLoop(global.ADD);
                fade_music=false}
            change=false
        }
        play_mode=false
        counter=0
}

if selection=4
{
    if FMODGroupGetMuted(3)=false
    FMODGroupSetMuted(3,true)
    else
    FMODGroupSetMuted(3,false)
    sound_play(sndMenuCursor2)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=bar_sel=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if play_mode=false
{
        if music_list[track_sel,3] = 0
            music_list[track_sel,3] = FMODSoundAdd(music_list[track_sel,1],false,true);
        if global.ADD != music_list[track_sel,3]
        {
            change=true
            global.ADD = music_list[track_sel,3]
            sizeinms = FMODSoundGetLength(global.ADD)
            FMODSoundSetLoopPoints(global.ADD,safe_division(music_list[track_sel,2],sizeinms),1);
            maxv=music_list[track_sel,4]
        }

        FMODGroupSetPaused(3,0)

        if change=true
        {
            FMODInstanceStop(global.BGM)
            FMODGroupFadeVolume(3,global.musicvolume,1)
            FMODSoundSetGroup(global.ADD,3);
            FMODSoundSetMaxVolume(global.ADD,maxv);
            if loop_mode=false //music_list[track_sel,2]=-1 &&
            {
                global.BGM = FMODSoundPlay(global.ADD);
                if music_list[track_sel,2]!=-1
                fade_music=true
                else
                fade_music=false
            }
            else if loop_mode=true{
                global.BGM = FMODSoundLoop(global.ADD);
                fade_music=false}
            change=false
        counter=0
        }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=bar_sel=-1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if right_sel=0
{
    if play_mode=true && (FMODInstanceIsPlaying(global.ADD)=false && FMODInstanceGetPosition(global.BGM)=0)
    {
        if loop_mode=false
        loop_mode=true
        else
        loop_mode=false

        sound_play(sndMenuCursor2)
    }
}
else
{
    sound_play(sndMenuAccept)
    instance_create(0,0,objFadeOutFake)
    confirm=true
}
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bar_sel=0
{
    bar_sel=-1
    sound_play(sndMenuCursor)
    right_al=0

    if !(play_mode=true && FMODInstanceIsPlaying(global.ADD)=false && FMODInstanceGetPosition(global.BGM)=0)
    right_sel=1
    else
    right_sel=0
}

if bar_sel=1
{
    bar_sel=0
    sound_play(sndMenuCursor)
    select_op_B=0
}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bar_sel=0
{
    bar_sel=1
    sound_play(sndMenuCursor)
    select_op_T=0
}
if bar_sel=-1
{
    bar_sel=0
    sound_play(sndMenuCursor)
    select_op_B=0
    right_al=0
}
#define Trigger_press Left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bar_sel=1
{
    if track_sel>0
    {
        track_sel-=1
        sound_play(sndMenuCursor)
    }
    else
    {
        track_sel=track_max
        sound_play(sndMenuCursor)
    }
    l_tap=2
    alarm[1]=5
    //play_mode=true
}
else if bar_sel=0
{
    if selection>0
    {
        selection-=1
        select_op_B=0
        sound_play(sndMenuCursor)
    }
}
else if bar_sel=-1
{
    if right_sel=1 && play_mode=true && FMODInstanceIsPlaying(global.ADD)=false && FMODInstanceGetPosition(global.BGM)=0
    {
        right_sel-=1
        right_al=0
        sound_play(sndMenuCursor)
    }
}
#define Trigger_press Right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bar_sel=1
{
    if track_sel<track_max
    {
        track_sel+=1
        sound_play(sndMenuCursor)
    }
    else
    {
        track_sel=0
        sound_play(sndMenuCursor)
    }

    r_tap=2
    alarm[1]=5
    //play_mode=true
}
else if bar_sel=0
{
    if selection<4
    {
        selection+=1
        select_op_B=0
        sound_play(sndMenuCursor)
    }
}
else if bar_sel=-1
{
    if right_sel=0
    {
        right_sel+=1
        right_al=0
        sound_play(sndMenuCursor)
    }
}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndMenuAccept)
    instance_create(0,0,objFadeOutFake)
    confirm=true
