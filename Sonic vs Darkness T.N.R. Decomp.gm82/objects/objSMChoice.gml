#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Main Menu
for (i=0;i<5;i+=1)
{
choicex[i]=-80-(i*110)
calpha[i]=0-(i)
}

//Single Player
for (i=0;i<2;i+=1)
{
choicex2[i]=-80-(i*110)
calpha2[i]=0-(i)
}

//Multiplayer
for (i=0;i<2;i+=1)
{
choicex3[i]=-80-(i*110)
calpha3[i]=0-(i)
}

select=0
menu_selection=0 // Get selection when returning to the main menu
salpha=0

selectm=0

sub_menu=0 // Titles for menus

show=true
permit=false

next=false
hint=""

main_menu=true
single_player=false
multiplayer=false

show_cur=true

subcurs=0

music=false

options=false
online=false
timeA=false
cred=false
des=false

bg_alpha=0
hint_alpha=0
hint_alpha2=0

top_panelx=-300

multi_block=true

/*x1=600
x2=700
x3=800
y1=164
alph=0

music=false

pressed=false

choice=0

alpha=1
scale=1


if file_exists("game_data.sav")
skip=3
else
skip=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Online Logoff
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if global.online_mode=true{
if gms_info_isloggedin() && gms_info_isconnected(){
//gms_debug_hide_errors()
gms_logout();
//gms_debug_enable()
}
global.online_mode=false
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Sub-Menus Return
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.sound_test=true
{
    global.sound_test=false
    options=true
    alarm[0]=45
}

if global.time_attack>0
{
show_cur=false
main_menu=false
single_player=false
show=false
timeA=true
alarm[0]=45
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Sub Menus
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if menu_selection=2 || options=true
instance_create(0,0,objOPControl)
else if cred=true
instance_create(0,0,objCREDMenu)
else
instance_create(0,0,objCharMenu)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Choice Slide Animation
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if top_panelx=0 || top_panelx=-300
{
    if main_menu=true && show=true && top_panelx>=-10
    {
        for (i=0;i<5;i+=1)
        {
            if choicex[i]<0
            choicex[i]+=max(min(point_distance(choicex[i],choicex[i],0,0)*.07,20),.2)
            if calpha[i]<1
            calpha[i]+=.1
        }

        //Single Player & Multiplayer Reset
        for (i=0;i<2;i+=1)
        {
        choicex2[i]=-80-(i*110)
        calpha2[i]=0-(i)

        choicex3[i]=-80-(i*110)
        calpha3[i]=0-(i)
        }
    }
    else if top_panelx<=-100
    {
        for (i=0;i<5;i+=1)
        {
            if choicex[i]>-80-(i*110) && choicex[max(i-1,0)]<=-80 && i!=0
            choicex[i]-=max(min(point_distance(choicex[i],choicex[i],-80-(i*110),-80-(i*110))*.07,20),.2)

            if choicex[0]>-80
            choicex[0]-=max(min(point_distance(choicex[i],choicex[i],-80,-80)*.07,20),.2)

            if calpha[i]>0-i && calpha[max(i-1,0)]<=.5 && i!=0
            calpha[i]-=.1
            if calpha[0]>0
            calpha[0]-=.1
        }
    }

    if single_player=true && show=true && top_panelx>=-10
    {

        for (i=0;i<2;i+=1)
        {
            if choicex2[i]<0
            choicex2[i]+=max(min(point_distance(choicex2[i],choicex2[i],0,0)*.07,20),.2)
            if calpha2[i]<1
            calpha2[i]+=.1
        }

        //Main Menu Reset
        for (i=0;i<5;i+=1)
        {
        choicex[i]=-80-(i*110)
        calpha[i]=0-(i)
        }
    }
    else if top_panelx<=-100
    {
        for (i=0;i<2;i+=1)
        {
            if choicex2[i]>-80-(i*110) && choicex2[max(i-1,0)]<=-80 && i!=0
            choicex2[i]-=max(min(point_distance(choicex2[i],choicex2[i],-80-(i*110),-80-(i*110))*.07,20),.2)

            if choicex2[0]>-80
            choicex2[0]-=max(min(point_distance(choicex2[i],choicex2[i],-80,-80)*.07,20),.2)

            if calpha2[i]>0-i && calpha2[max(i-1,0)]<=.5 && i!=0
            calpha2[i]-=.1
            if calpha2[0]>0
            calpha2[0]-=.1
        }
    }

    if multiplayer=true && show=true && top_panelx>=-10
    {

        for (i=0;i<2;i+=1)
        {
            if choicex3[i]<0
            choicex3[i]+=max(min(point_distance(choicex3[i],choicex3[i],0,0)*.07,20),.2)
            if calpha3[i]<1
            calpha3[i]+=.1
        }

        //Main Menu Reset
        for (i=0;i<5;i+=1)
        {
        choicex[i]=-80-(i*110)
        calpha[i]=0-(i)
        }
    }
    else if top_panelx<=-100
    {
        for (i=0;i<2;i+=1)
        {
            if choicex3[i]>-80-(i*110) && choicex3[max(i-1,0)]<=-80 && i!=0
            choicex3[i]-=max(min(point_distance(choicex3[i],choicex3[i],-80-(i*110),-80-(i*110))*.07,20),.2)

            if choicex3[0]>-80
            choicex3[0]-=max(min(point_distance(choicex3[i],choicex3[i],-80,-80)*.07,20),.2)

            if calpha3[i]>0-i && calpha3[max(i-1,0)]<=.5 && i!=0
            calpha3[i]-=.1
            if calpha3[0]>0
            calpha3[0]-=.1
        }
    }

    if instance_exists(objOPControl)
    {
        //Main Menu Reset
        for (i=0;i<5;i+=1)
        {
        choicex[i]=-80-(i*110)
        calpha[i]=0-(i)
        }
    }

    if instance_exists(objOnlineMenu) || instance_exists(objSUBMenu)
    {
        //Single Player & Multiplayer Reset
        for (i=0;i<2;i+=1)
        {
        choicex2[i]=-80-(i*110)
        calpha2[i]=0-(i)

        choicex3[i]=-80-(i*110)
        calpha3[i]=0-(i)
        }
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
// Top Panel X Position
if top_panelx<0 && show=true && options=false && online=false && timeA=false && cred=false
top_panelx+=max(point_distance(top_panelx,top_panelx,0,0)*.1,.5)

if top_panelx>-150 && show=false
top_panelx-=10

top_panelx=max(min(top_panelx,0),-300)

if music=true
FMODGroupFadeVolume(3,0,room_speed*1.4)

// When to show next set of menu choices
if calpha[4]<=0 && calpha2[1]<=0 && calpha3[1]<=0 && top_panelx<=-150{
show=true
show_cur=true

if main_menu=true
sub_menu=0
if single_player=true
sub_menu=1
if multiplayer=true
sub_menu=2}

// Cursor Appearance
if show_cur=true
{
    if (calpha[4]>=1||calpha2[1]>=1||calpha3[1]>=1)
    {
        if salpha<1
        salpha+=.1

        if hint_alpha<1
        hint_alpha+=.1
    }
}
else
{
    if salpha>0
    salpha-=.1

    if hint_alpha>0
    hint_alpha-=.1
}

if salpha<=0
{
if main_menu=true{
subcurs=0
select=menu_selection}
else{
subcurs=30
select=0}
}

selectm+=max(min((30*select-selectm)*.3,3),-3)

// Allow Cursor Movement
if salpha>=1
permit=true
else
permit=false


// BG Alpha
if !instance_exists(objOnlineMenu){
if bg_alpha<.25 && !instance_exists(objOPControl) && !instance_exists(objSUBMenu)
bg_alpha+=.05
else if bg_alpha>0 && (instance_exists(objOPControl) || instance_exists(objSUBMenu))
bg_alpha-=.01}
else{
if bg_alpha<.25 && objOnlineMenu.list_rooms=false
bg_alpha+=.05
else if bg_alpha>0 && objOnlineMenu.list_rooms=true
bg_alpha-=.01}

// Bottom Panel Alpha
if hint_alpha2<1 && options=false && bg_alpha>=.25 && online=false && timeA=false && cred=false
hint_alpha2+=.05
else if hint_alpha2>0 && (options=true || online=true || timeA=true || cred=true)
hint_alpha2-=.1

/*if x1>210
x1-=10
if x2>210
x2-=10
if x3>210
x3-=10

if alph<1 && x3=210
alph+=.1


if pressed=true{
scale+=.01
alpha-=.05}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Hints
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if main_menu=true && show=true
{
if select=0
hint="Single Player: Play solo in Story Mode or Time Attack."
if select=1
{
if multi_block=true
hint="Multiplayer: Not available in this demo."
else
hint="Multiplayer: Play against others online. Requires internet connection."
}
if select=2
hint="Options: Adjust various game settings."
if select=3
hint="Credits: View a credit list of people who developed the game."
if select=4
hint="Quit Game: End the program."
}

if single_player=true && show=true
{
if select=0
hint="Story Mode: Play through the storyline."
if select=1
hint="Time Attack: Rank your best stage clear times."
}

if multiplayer=true && show=true
{
if select=0
hint="Create Room: Create a room for others to join."
if select=1
hint="Join Room: Search for created rooms to join."
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_background_ext(bg_menu5,0,0,1,1,0,c_white,bg_alpha)
draw_set_blend_mode(bm_normal)

//Cursor
draw_sprite_blend_ext(sprSMSelect,0,0,45+(selectm)+subcurs,1,1,0,c_white,salpha,bm_add)

//Top Panel
draw_sprite_ext(sprSMBar,sub_menu,top_panelx,17,1,1,0,c_white,(top_panelx/100)+1)
draw_sprite_ext(sprSMBar2,sub_menu,22+top_panelx,20,1,1,0,c_white,(top_panelx/100)+1)

var ml;
//Main Menu
for(i=0;i<5;i+=1){
if i=1 && multi_block=true
ml=5
else
ml=i
draw_sprite_ext(sprSMChoice,ml,31+choicex[i],58+(30*i),1,1,0,c_white,calpha[i])}

//Single Player
for(i=0;i<2;i+=1)
draw_sprite_ext(sprSMChoice2,i,31+choicex2[i],88+(30*i),1,1,0,c_white,calpha2[i])

//Multiplayer
for(i=0;i<2;i+=1)
draw_sprite_ext(sprSMChoice2,i+2,31+choicex3[i],88+(30*i),1,1,0,c_white,calpha3[i])

//Hint Bar
draw_sprite_ext(sprSMHintBar,0,0,210,420,1,0,c_white,hint_alpha2)

draw_set_halign(fa_left)
draw_set_color(c_white)
draw_set_font(global.fntMenu)
draw_set_alpha(hint_alpha)

draw_text(32,218,hint)

/*if options=false{
if x3=210{
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprSMChoice2,0,95,y1,1,1,0,c_white,alph)
draw_set_blend_mode(bm_normal)}

draw_sprite(sprSMChoice,skip,x1,162)
draw_sprite(sprSMChoice,1,x2,184)
draw_sprite(sprSMChoice,2,x3,207)

if pressed=true{
if skip=3 && choice=0
draw_sprite_ext(sprSMChoice,3,x1,y1-scale*2,scale,scale,0,c_white,alpha)
else
draw_sprite_ext(sprSMChoice,choice,x1,y1-scale*2,scale,scale,0,c_white,alpha)}
}
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=options=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if select>0 && permit=true{
select-=1
salpha=0
sound_play(sndMenuCursor)
}
/*if choice=1 && pressed=false{
alph=0
choice=0
y1=164
sound_play(sndMenuCursor)}

if choice=2 && pressed=false{
alph=0
choice=1
y1=186
sound_play(sndMenuCursor)}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=options=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (select<4 && main_menu=true) || (select<1 && main_menu=false)
if permit=true
{
    select+=1
    salpha=0
    sound_play(sndMenuCursor)
}
/*if choice=1 && pressed=false{
alph=0
choice=2
y1=209
sound_play(sndMenuCursor)}

if choice=0 && pressed=false{
alph=0
choice=1
y1=186
sound_play(sndMenuCursor)}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=options=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if permit=true
{
    if main_menu=false
    {
        if single_player=true
        single_player=false

        if multiplayer=true
        multiplayer=false

        show=false

        show_cur=false

        main_menu=true

        sound_play(sndMenuBack)
    }
}
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=options=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if permit=true
{
    if single_player=true
    {
        if select=0{
        show_cur=false
        main_menu=false
        sound_play(sndMenuAccept2)
        music=true
        cred=true
        single_player=false
        show=false
        instance_create(0,0,objRFadeOut)
        }
        if select=1{
        show_cur=false
        main_menu=false
        sound_play(sndMenuAccept2)
        single_player=false
        show=false
        timeA=true
        alarm[0]=45
        }
    }
    if multiplayer=true
    {
        if select=0{
        show_cur=false
        sound_play(sndMenuAccept2)
        multiplayer=false
        show=false
        main_menu=false
        with instance_create(0,0,objOnlineMenu)
        create=true
        online=true
        }
        if select=1{
        show_cur=false
        sound_play(sndMenuAccept2)
        multiplayer=false
        show=false
        main_menu=false
        with instance_create(0,0,objOnlineMenu)
        join=true
        online=true
        }
    }
    if main_menu=true
    {
        if select=0{
        if single_player=false
        single_player=true}

        else if select=1{
        if multi_block=true
        sound_play(sndMenuBack)
        else{
        if multiplayer=false
        multiplayer=true}
        }

        else if select=2{
        options=true
        alarm[0]=45
        }

        else if select=3{
        alarm[0]=45
        cred=true
        show=false
        show_cur=false
        }

        else if select=4{
        alarm[0]=45
        cred=true
        des=true
        show=false
        show_cur=false
        sound_play(sndMenuAccept2)
        /*
        if show_question("Exit Sonic vs Darkness Demo?")
        game_end()
        else
        exit;*/
        }

        if select!=1||multi_block=false// REMOVE AFTER DEMO
        {
        show=false

        show_cur=false
        main_menu=false
        menu_selection=select
        if select!=4
        sound_play(sndMenuAccept)}
    }
}
