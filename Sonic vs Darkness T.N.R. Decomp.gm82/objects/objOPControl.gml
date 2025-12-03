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

colr=make_color_rgb(132,67,166)
colr2=make_color_rgb(172,104,176)

op=0
op2=0
op3=0
op4=0

for (i=0;i<8;i+=1)
opchoice[i]=-i/2

// Get stuff
getmv=global.musicvolume
getsv=global.soundvolume

geta=0
gets=0
getd=0
getdw2=0
getup=0
getdw=0
getleft=0
getright=0
getpause=0
getf=0
getvib=-1

getsfx=0
getref=-1
getres=-1

//move knob
movn=(global.musicvolume*80)*2
movn2=(global.soundvolume*80)*2

tmr=-1
tmr2=-1
mtmr=20
mtmr2=20

choice=50
advchoice=50
controls=false
advance=false
keyind=0
contchoice=0
contchoice2=0
contread=1
contread2=0

freeze=false // freezes player's input
music=false

flash=false
alarm[0]=20

//white fade for moving cursor
cfade=0

global.input=false
delay=0
alarm[1]=20
flash2=false

blinkspd=0

faderumb=0

if global.controllervib=true{
onfade=1
offfade=.45}
else
{
onfade=.45
offfade=1}

if global.xbox=true{
keyfade=.3
confade=1
xboxc=true}
else{
keyfade=1
confade=.3
xboxc=false}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if flash=true
flash=false
else
flash=true

if global.input=false
alarm[0]=20
else
alarm[0]=10
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if flash2=true
flash2=false
else
flash2=true
alarm[1]=20
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

if controls=false && advance=false{
if op=1 && op2<1 && op3=0 && op4=0
op2+=.1

for(i=0;i<8;i+=1)
if opchoice[i]<1 && op=1 && op3=0 && op4=0
opchoice[i]+=.1

if op3>0
op3-=.1

if op4>0
op4-=.1

if op4=0
advchoice=50

// RESET CURSOR
contchoice=0
contchoice2=0
contread=1}

if controls=true{
if op2>0
op2-=.1

for(i=0;i<8;i+=1)
if opchoice[i]>0
opchoice[i]-=.1

if op3<1 && op2=0
op3+=.1}

if advance=true{
if op2>0
op2-=.1

for(i=0;i<8;i+=1)
if opchoice[i]>0
opchoice[i]-=.1

if op4<1 && op2=0
op4+=.1}

//move knob
movn=(global.musicvolume*80)*2
movn2=(global.soundvolume*80)*2

if cfade=-1{
alarm[1]=20
flash2=false}

if cfade<0 && freeze=false
cfade+=.1

if cfade>-1 && freeze=true
cfade-=.1

if blinkspd<10
blinkspd+=.05
else
blinkspd=0

if faderumb>0
faderumb-=1

if faderumb=1 && global.xbox=true
joystick_rumble(0,0,0)

if global.controllervib=true && onfade<1
onfade+=.05
else if global.controllervib=false && offfade<1
offfade+=.05

if global.controllervib=true && offfade>.45
offfade-=.05
else if global.controllervib=false && onfade>.45
onfade-=.05


if xboxc=true && confade<1
confade+=.05
else if xboxc=false && keyfade<1
keyfade+=.05

if xboxc=true && keyfade>.45
keyfade-=.05
else if xboxc=false && confade>.45
confade-=.05
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Keys
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if op2=1{
if choice=50{
    if keyboard_check_pressed(global.k_left) || tmr=0{
    if global.musicvolume>0{
    global.musicvolume-=.05
    FMODGroupSetVolume(2,global.musicvolume)
    FMODGroupSetVolume(3,global.musicvolume)
    FMODGroupSetVolume(4,global.musicvolume)
    FMODGroupSetVolume(1,global.musicvolume)
    sound_play(sndMenuCursor2)}}

    if keyboard_check_pressed(global.k_right) || tmr2=0{
    if global.musicvolume<1{
    global.musicvolume+=.05
    FMODGroupSetVolume(2,global.musicvolume)
    FMODGroupSetVolume(3,global.musicvolume)
    FMODGroupSetVolume(4,global.musicvolume)
    FMODGroupSetVolume(1,global.musicvolume)
    sound_play(sndMenuCursor2)}}
}

if choice=76{
    if keyboard_check_pressed(global.k_left) || tmr=0{
    if global.soundvolume>0{
    global.soundvolume-=.05
    sound_play(sndMenuCursor2)}}

    if keyboard_check_pressed(global.k_right) || tmr2=0{
    if global.soundvolume<1{
    global.soundvolume+=.05
    sound_play(sndMenuCursor2)}}
}

if tmr>-1 && mtmr=0
tmr-=1

if tmr2>-1 && mtmr2=0
tmr2-=1

if tmr=-1 && mtmr=0
tmr=7

if tmr2=-1 && mtmr2=0
tmr2=7

if choice=50 || choice=76
if (keyboard_check(global.k_left) && !keyboard_check(global.k_right) && !keyboard_check(global.k_down) && !keyboard_check(global.k_up)){
if mtmr>0
mtmr-=1}
else{
mtmr=20
tmr=-1}

if choice=50 || choice=76
if (keyboard_check(global.k_right) && !keyboard_check(global.k_left) && !keyboard_check(global.k_down) && !keyboard_check(global.k_up)){
if mtmr2>0
mtmr2-=1}
else{
mtmr2=20
tmr2=-1}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Advance Options
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if op4=1
{
    if keyboard_check_pressed(global.k_left)
    {
        if advchoice=50
        {
            if global.specialfx>1{
            global.specialfx-=1
            sound_play(sndMenuCursor)}
        }
        if advchoice=85
        {
            if global.reflection>0{
            global.reflection-=1
            sound_play(sndMenuCursor)}
        }
        if advchoice=121
        {
            if global.resolution>0{
            global.resolution-=1
            sound_play(sndMenuCursor)}
        }
    }
    if keyboard_check_pressed(global.k_right)
    {
        if advchoice=50
        {
            if global.specialfx<3{
            global.specialfx+=1
            sound_play(sndMenuCursor)}
        }
        if advchoice=85
        {
            if global.reflection<1{
            global.reflection+=1
            sound_play(sndMenuCursor)}
        }
        if advchoice=121
        {
            if global.resolution<4{
            global.resolution+=1
            sound_play(sndMenuCursor)}
        }
    }

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Read Highlighted
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if contchoice2<100 && (contchoice2!=78 || contchoice!=245)&&contchoice2>-100{
if contchoice=0 && contchoice2=0{
contread=1
contread2=global.k_a}

if contchoice=0 && contchoice2=26{
contread=2
contread2=global.k_s}

if contchoice=0 && contchoice2=52{
contread=3
contread2=global.k_d}

if contchoice=0 && contchoice2=78{
contread=4
contread2=global.k_down2}



if contchoice=130 && contchoice2=0{
contread=5
contread2=global.k_up}

if contchoice=130 && contchoice2=26{
contread=6
contread2=global.k_down}

if contchoice=130 && contchoice2=52{
contread=7
contread2=global.k_left}

if contchoice=130 && contchoice2=78{
contread=8
contread2=global.k_right}



if contchoice=245 && contchoice2=0{
contread=9
contread2=global.k_pause}

if contchoice=245 && contchoice2=26{
contread=10
contread2=global.k_f}}
else{
contread=0
contread2=0}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Wait for Input
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if delay>0{
delay-=1
keyboard_lastkey=0}
if op3=1 && global.input=true && delay=0
scrWaitForInput()
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
if music=true
FMODGroupFadeVolume(3,0,room_speed*.5)


if instance_exists(objFadeOutFake){
if objFadeOutFake.alpha[10]>=1{
objFadeOutFake.back=true
room_goto(rmSoundTest)}}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if op<1{
draw_line_width_color(xm,ym,xm2,ym,2,colr,colr)

draw_line_width_color(xm,ym2,xm2,ym2,2,colr,colr)


draw_line_width_color(xm,ym,xm,ym2,2,colr,colr)

draw_line_width_color(xm2,ym,xm2,ym2,2,colr,colr)}

// BG Fade
draw_background_ext(bg_options1,7,6,1,1,0,c_white,op)
draw_set_blend_mode(bm_add)
draw_background_ext(bg_gamedata2,9,8,1,1,0,c_white,op*.2)
draw_background_ext(bg_gamedata1,9,8,1,1,0,c_white,op)
draw_set_blend_mode(bm_normal)

//second
draw_set_alpha(op)
draw_rectangle_color(8,7,411,233,colr2,colr2,colr2,colr2,1)

//Behind Highlight
draw_set_blend_mode(bm_add)
//Options
if (choice=200 || choice=217) && op2=1
draw_sprite_ext(sprSMChoice3,0,66,198+(choice-200),1,1,0,c_white,op2+cfade)
//Advanced Options
if (advchoice=200 || advchoice=217) && op4=1
draw_sprite_ext(sprSMChoice3,0,66,198+(advchoice-200),1,1,0,c_white,op4+cfade)
//Options
if choice!=200 && choice!=217
draw_sprite_ext(sprSMSelect,0,9,choice-6,1,1,0,c_white,op2+cfade) // sprOPChoiceH
//Advanced Options
if advchoice!=200 && advchoice!=217
draw_sprite_ext(sprSMSelect,0,9,advchoice-6,1,1,0,c_white,op4+cfade) // sprOPChoiceH
draw_set_blend_mode(bm_normal)

// BG Text
//draw_background_ext(bg_options2,0,0,1,1,0,c_white,op2)
// PUT EVERYTHING HERE

//Options Menu
draw_sprite_blend_ext(sprOPTitle,1,9,16,1,1,0,c_white,op2,bm_add)
draw_sprite_ext(sprOPTitle,0,9,16,1,1,0,c_white,op2)

for (i=0;i<5;i+=1)
draw_sprite_ext(sprOPText,i,24,58+(i*26),1,1,0,c_white,opchoice[i])

draw_sprite_ext(sprOPText2,0,119,199,1,1,0,c_white,opchoice[6])
draw_sprite_ext(sprOPText2,1,119,216,1,1,0,c_white,opchoice[7])

draw_sprite_ext(sprOPVBars,0,204,60,1,1,0,c_white,op2)

draw_sprite_ext(sprOPTextLine,0,0,189,1,1,0,c_white,op2)

// Volume Bars
draw_sprite_part_ext(sprOPVNode2,0,0,0,movn+3,3,218,62,1,1,c_white,op2)
draw_sprite_part_ext(sprOPVNode2,0,0,0,movn2+3,3,218,88,1,1,c_white,op2)
draw_sprite_ext(sprOPVNode,0,217+movn,60,1,1,0,c_white,op2)
draw_sprite_ext(sprOPVNode,0,217+movn2,86,1,1,0,c_white,op2)

/*
// Options
if choice!=200 && choice!=217{
draw_sprite_ext(sprSMSelect,0,9,choice,1,1,0,c_white,op2)}

// Advanced Options
if advchoice!=200 && advchoice!=217{
draw_sprite_ext(sprSMSelect,0,9,advchoice,1,1,0,c_white,op4)}*/

//Behind Highlight
draw_set_blend_mode(bm_add)
if (contchoice2=100 || contchoice2=118) && op3=1
draw_sprite_ext(sprSMChoice3,0,66,198+(contchoice2-100),1,1,0,c_white,op3+cfade)
draw_set_blend_mode(bm_normal)

// BG Text
if xboxc=false
draw_background_ext(bg_options3,0,0,1,1,0,c_white,op3)
else
draw_background_ext(bg_options3_2,0,0,1,1,0,c_white,op3)

draw_sprite_blend_ext(sprOPCTitle,1,9,16,1,1,0,c_white,op3,bm_add)
draw_sprite_ext(sprOPCTitle,0,9,16,1,1,0,c_white,op3)

// BG Text
draw_background_ext(bg_options6,0,0,1,1,0,c_white,op4)

draw_sprite_blend_ext(sprOPATitle,1,9,16,1,1,0,c_white,op4,bm_add)
draw_sprite_ext(sprOPATitle,0,9,16,1,1,0,c_white,op4)

// Default key boxes
if xboxc=false
draw_background_ext(bg_options4,0,0,1,1,0,c_white,op3)
else
draw_background_ext(bg_options5,0,0,1,1,0,c_white,op3)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Key Maps
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if controls=true{

var m; m=0
var d; d=0


if xboxc=false
for (i=0;i<10;i+=1)
{
/***********************************
******************************************/
if i=0
keyind=scrCheckASCII(global.k_a)
if i=1
keyind=scrCheckASCII(global.k_s)
if i=2
keyind=scrCheckASCII(global.k_d)
if i=3
keyind=scrCheckASCII(global.k_down2)
if i=4
keyind=scrCheckASCII(global.k_up)
if i=5
keyind=scrCheckASCII(global.k_down)
if i=6
keyind=scrCheckASCII(global.k_left)
if i=7
keyind=scrCheckASCII(global.k_right)
if i=8
keyind=scrCheckASCII(global.k_pause)
if i=9
keyind=scrCheckASCII(global.k_f)
/***********************************
******************************************/

if i=4 || i=8
d=0

if i>3 && i<8
m=130
else if i>7
m=245
draw_sprite_ext(sprPressScriptL,keyind,27+m,80+d,1,1,0,c_white,op3)
d+=26
}
draw_set_blend_mode(bm_add)
if (contchoice2!=100 && contchoice2!=118 && contchoice2!=-100)
if (contchoice2!=78 || contchoice!=245){
if global.input=true
r=sprOPChoice3
else
r=sprOPChoice2
d3d_set_fog(flash,c_white,0,0);
draw_sprite_ext(r,xboxc,25+contchoice,78+contchoice2,1,1,0,c_white,op3)
d3d_set_fog(false,c_white,0,0);
}
if contchoice2=78 && contchoice=245{
draw_set_blend_mode(bm_normal)
draw_sprite_ext(sprOPVChoice,floor(blinkspd),280,135,1,1,0,c_white,op3)}
draw_set_blend_mode(bm_normal)

// Vibration On/Off
draw_sprite_ext(sprOPVChoice2,0,305,161,1,1,0,c_white,onfade-(1-op3))
draw_sprite_ext(sprOPVChoice2,1,344,162,1,1,0,c_white,offfade-(1-op3))
// Controller Choice
draw_sprite_ext(sprOPContChoice,0,307,14,1,1,0,c_white,keyfade-(1-op3))
draw_sprite_ext(sprOPContChoice,1,350,14,1,1,0,c_white,confade-(1-op3))
if contchoice2=-100{
if xboxc=false
draw_sprite_ext(sprOPContChoice2,0,307,14,1,1,0,c_white,op3)
else
draw_sprite_ext(sprOPContChoice2,1,350,14,1,1,0,c_white,op3)}



} // dont touch
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Advance
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if advance=true
{
//Special Effects
draw_sprite_ext(sprOPSFXChoice,global.specialfx-1,297,57,1,1,0,c_white,op4)
if global.specialfx<3
draw_sprite_ext(sprOPChoice4,1,368,58,1,1,0,c_white,op4)
if global.specialfx>1
draw_sprite_ext(sprOPChoice4,0,261,58,1,1,0,c_white,op4)

//Reflection
draw_sprite_ext(sprOPRFChoice,global.reflection,299,94,1,1,0,c_white,op4)
if global.reflection=false
draw_sprite_ext(sprOPChoice4,1,368,94,1,1,0,c_white,op4)
else
draw_sprite_ext(sprOPChoice4,0,261,94,1,1,0,c_white,op4)

//Resolution
draw_sprite_ext(sprOPRChoice,global.resolution,256,130,1,1,0,c_white,op4)
if global.resolution<4
draw_sprite_ext(sprOPChoice4,1,388,130,1,1,0,c_white,op4)
if global.resolution>0
draw_sprite_ext(sprOPChoice4,0,241,130,1,1,0,c_white,op4)
}
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.input=false && freeze=false
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
arg0=op2=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if choice=76{
choice=50
sound_play(sndMenuCursor)
cfade=-1}

if choice=102{
choice=76
sound_play(sndMenuCursor)
cfade=-1}

if choice=128{
choice=102
sound_play(sndMenuCursor)
cfade=-1}

if choice=154{
choice=128
sound_play(sndMenuCursor)
cfade=-1}

if choice=200{
choice=154
sound_play(sndMenuCursor)
cfade=-1}

if choice=217{
choice=200
sound_play(sndMenuCursor)
cfade=-1}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=op3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if contchoice2=0{
contchoice2=-100
sound_play(sndMenuCursor)}

if contchoice2=26{
contchoice2=0
sound_play(sndMenuCursor)}

if contchoice2=52{
contchoice2=26
sound_play(sndMenuCursor)}

if contchoice2=78{
if contchoice!=245
contchoice2=52
else{
if xboxc=true
contchoice2=-100
else
contchoice2=26}
sound_play(sndMenuCursor)}

// FOR BELOW
if contchoice2=100{
if xboxc=true{
contchoice2=78
contchoice=245}
else
contchoice2=78
sound_play(sndMenuCursor)}

if contchoice2=118{
contchoice2=100
sound_play(sndMenuCursor)
cfade=-1}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=op4=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if advchoice=85{
advchoice=50
sound_play(sndMenuCursor)
cfade=-1}

if advchoice=121{
advchoice=85
sound_play(sndMenuCursor)
cfade=-1}

if advchoice=157{
advchoice=121
sound_play(sndMenuCursor)
cfade=-1}

if advchoice=200{
advchoice=157
sound_play(sndMenuCursor)
cfade=-1}

if advchoice=217{
advchoice=200
sound_play(sndMenuCursor)
cfade=-1}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.input=false && freeze=false
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
arg0=op2=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if choice=200{
choice=217
sound_play(sndMenuCursor)
cfade=-1}

if choice=154{
choice=200
sound_play(sndMenuCursor)
cfade=-1}

if choice=128{
choice=154
sound_play(sndMenuCursor)
cfade=-1}

if choice=102{
choice=128
sound_play(sndMenuCursor)
cfade=-1}

if choice=76{
choice=102
sound_play(sndMenuCursor)
cfade=-1}

if choice=50{
choice=76
sound_play(sndMenuCursor)
cfade=-1}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=op3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// FOR BELOW
if contchoice2=100{
contchoice2=118
sound_play(sndMenuCursor)
cfade=-1}

if contchoice2=78{
contchoice2=100
sound_play(sndMenuCursor)
cfade=-1}

if contchoice2=52{
contchoice2=78
sound_play(sndMenuCursor)}

if contchoice2=26{
if contchoice!=245
contchoice2=52
else
contchoice2=78
sound_play(sndMenuCursor)}


if contchoice2=0{
contchoice2=26
sound_play(sndMenuCursor)}

if contchoice2=-100{
if xboxc=true{
contchoice2=78
contchoice=245}
else
contchoice2=0
sound_play(sndMenuCursor)}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=op4=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if advchoice=200{
advchoice=217
sound_play(sndMenuCursor)
cfade=-1}

if advchoice=157{
advchoice=200
sound_play(sndMenuCursor)
cfade=-1}

if advchoice=121{
advchoice=157
sound_play(sndMenuCursor)
cfade=-1}

if advchoice=85{
advchoice=121
sound_play(sndMenuCursor)
cfade=-1}

if advchoice=50{
advchoice=85
sound_play(sndMenuCursor)
cfade=-1}
#define Trigger_press Left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.input=false && freeze=false
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
arg0=op3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=contchoice2!=100 && contchoice2!=118
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if contchoice2!=-100{
if contchoice=130{
contchoice=0
sound_play(sndMenuCursor)}

if contchoice=245 && xboxc=false{
contchoice=130
sound_play(sndMenuCursor)}}
else
{
if xboxc=true{
xboxc=false
sound_play(sndMenuCursor2)
}
}
#define Trigger_press Right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.input=false && freeze=false
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
arg0=op3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=contchoice2!=100 && contchoice2!=118
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if contchoice2!=-100{
if contchoice=130{
contchoice=245
if contchoice2 = 52
contchoice2=78
sound_play(sndMenuCursor)}

if contchoice=0{
contchoice=130
sound_play(sndMenuCursor)}
}
else
{
if xboxc=false{
xboxc=true
sound_play(sndMenuCursor2)
}
}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.input=false && freeze=false
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
arg0=op2=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.musicvolume=getmv
global.soundvolume=getsv
    FMODGroupSetVolume(2,global.musicvolume)
    FMODGroupSetVolume(3,global.musicvolume)
    FMODGroupSetVolume(4,global.musicvolume)
    FMODGroupSetVolume(1,global.musicvolume)
if instance_exists(objSMChoice){
objSMChoice.options=false
objSMChoice.main_menu=true
sound_play(sndMenuBack)}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=op3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.k_a=geta
global.k_s=gets
global.k_d=getd
global.k_down2=getdw2
global.k_up=getup
global.k_down=getdw
global.k_left=getleft
global.k_right=getright
global.k_pause=getpause
global.k_f=getf
global.controllervib=getvib
controls=false
sound_play(sndMenuBack)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=op4=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.specialfx=getsfx
global.reflection=getref
global.resolution=getres
advance=false
sound_play(sndMenuBack)
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=op2=1 && global.input=false && freeze=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if choice=102{
geta=global.k_a
gets=global.k_s
getd=global.k_d
getdw2=global.k_down2
getup=global.k_up
getdw=global.k_down
getleft=global.k_left
getright=global.k_right
getvib=global.controllervib
getpause=global.k_pause
getf=global.k_f
controls=true
sound_play(sndMenuAccept)

if global.xbox=true{
keyfade=.3
confade=1
xboxc=true
contchoice=245
contchoice2=78}
else{
keyfade=1
confade=.3
xboxc=false}}

//SOUND TEST
if choice=128
{
    save_scr("game_save.ini")
    sound_play(sndMenuAccept)
    instance_create(0,0,objFadeOutFake)
    freeze=true
    music=true
}

//ADVANCED OPTIONS
if choice=154
{
getsfx=global.specialfx
getref=global.reflection
getres=global.resolution
advance=true
sound_play(sndMenuAccept)
//sound_play(sndMenuBack)//show_notification("WARNING: You are about to erase your GAME DATA. All of your progress will be lost. Do you wish to continue?",true)
}


// RESTORE DEFAULTS
if choice=200{
global.musicvolume=1
global.soundvolume=1
    FMODGroupSetVolume(2,global.musicvolume)
    FMODGroupSetVolume(3,global.musicvolume)
    FMODGroupSetVolume(4,global.musicvolume)
    FMODGroupSetVolume(1,global.musicvolume)
    sound_play(sndMenuAccept)}

// CONFIRM
if choice=217{
if instance_exists(objSMChoice){
save_scr("game_save.ini")
objSMChoice.options=false
objSMChoice.main_menu=true
sound_play(sndMenuAccept2)
instance_destroy()}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=op3=1 && freeze=false
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
// RESTORE DEFAULTS
if contchoice2=100{
global.k_a=global.defk_a
global.k_s=global.defk_s
global.k_d=global.defk_d
global.k_down2=global.defk_down2
global.k_left=global.defk_left
global.k_right=global.defk_right
global.k_up=global.defk_up
global.k_down=global.defk_down
global.k_pause=global.defk_pause
global.k_confirm=global.defk_confirm
global.k_back=global.defk_back
global.k_f=global.defk_f
global.controllervib=true
sound_play(sndMenuAccept)}

// CONFIRM
if contchoice2=118{
controls=false
if xboxc=false{
global.xbox=false
with objXB360
instance_destroy()}
else{
if !instance_exists(objXB360)
instance_create(0,0,objXB360)
else
global.xbox=true}
sound_play(sndMenuAccept)
save_scr("game_data.sav")}

//Vibrations
if contchoice2=78 && contchoice=245{
if global.controllervib=true && offfade=.45 && onfade=1{
global.controllervib=false
sound_play(sndMenuCursor2)}
else if offfade=1 && onfade=.45{
global.controllervib=true
if global.xbox=true{
joystick_rumble(0,1,1)
faderumb=20}
sound_play(sndMenuCursor2)}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Key Switching
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if contread!=0 && global.input=false && xboxc=false{
global.input=true
delay=10}
else if contread!=0 && global.input=false
sound_play(sndMenuBack)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=op4=1 && global.input=false && freeze=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//CONFIG GAME DATA
if advchoice=157
{
if getres!=global.resolution && global.nds=false{
if global.resolution=0
window_set_size(420,240)
if global.resolution=1
window_set_size(630,360)
if global.resolution=2
window_set_size(840,480)
if global.resolution=3
window_set_size(1260,720)
if global.resolution=4
window_set_size(1680,960)
window_center()}
sound_play(sndMenuAccept)
save_scr("game_save.ini")
with instance_create(0,0,objGameData)
from_opt=true

with objSMChoice
instance_destroy()
instance_destroy()//sound_play(sndMenuBack)//show_notification("WARNING: You are about to erase your GAME DATA. All of your progress will be lost. Do you wish to continue?",true)
}


// RESTORE DEFAULTS
if advchoice=200{
global.specialfx=3
global.resolution=0
global.reflection=true
sound_play(sndMenuAccept)}

// CONFIRM
if advchoice=217{
if getres!=global.resolution && global.nds=false{
if global.resolution=0
window_set_size(420,240)
if global.resolution=1
window_set_size(630,360)
if global.resolution=2
window_set_size(840,480)
if global.resolution=3
window_set_size(1260,720)
if global.resolution=4
window_set_size(1680,960)
window_center()
}
advance=false
sound_play(sndMenuAccept)
save_scr("game_save.ini")}
