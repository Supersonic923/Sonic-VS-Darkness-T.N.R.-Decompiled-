#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mpanelalpha=-1
bgalpha=-2

paneltmove1=150
paneltmove2=150
paneltmove3=150
paneltalpha1=0
paneltalpha2=0
paneltalpha3=0

panelmove1=210
panelmove2=210
panelmove3=210
panelmove4=210

titlemove=-500
titlemove2=500
titleslow=22
titlealpha=-1

for (i=0;i<5;i+=1)
panelmove[i]=205

textmove[i]=10

rankalpha=0
rankalpha2=0
ranksize=10
ranksize2=0
ranksize3=1
rankrot=0

rankalpha3=1
ranksize4=1
rankrot2=0

rank=2
alarm[0]=400

crankrot=0
cranky=0
crankdelay=40

resultscrop=0

arspd=20
arrowsweep=210
starf[0]=0
starf[1]=.5
starf[2]=1
arrowfade=0
emalpha=0
emmove=30
emdelay=25
emf=0

nrmove=60
nrmove2=80
nrmove3=100
nralpha=0
nralpha2=0
nralpha3=0

nextmove=-700

ty=0

level_id=0 // Level ID for time attack and anything additional - see Results code in create event
new_record=false // Set new record tune

key_alpha0=0
key_alpha1=0
key_alpha2=0

button_alpha0=0
button_alpha1=0
button_alpha2=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
actualtime=global.resulttime
gettime=round((600000-global.resulttime)/100)
getscore=global.Score/10
getrings=global.Rings*10

if global.time_attack=false && global.online_mode=false{
global.money+=global.Rings
if global.money>999999
global.money=999999}

gettotal=global.Score/10
totalpoints=false

if global.time_attack>0 || global.online_mode=true
calculate=10000
else
calculate=getrings+gettime+getscore

rankdelay=0

pressedz=false
presseda=false
pressedd=false

keypress=false

add_del=0
if global.BOSS=true && global.time_attack=false{
musicdelay=140
add_del=40}
else
musicdelay=100
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Results
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
charttime=0
chartrings=0
chartscore=0

i=0
if room=rmNIGHT
{
    level_id=0

    if global.time_attack=false
    {
        charttime=global.stage[i,0]
        chartrings=global.stage[i,1]
        chartscore=global.stage[i,2]

        //Stage Unlocking

        if global.unlock_stage=level_id
        global.unlock_stage+=1
    }
}

i=1
if room=rmNIGHT2
{
    level_id=1

    if global.time_attack=false
    {
        charttime=global.stage[i,0]
        chartrings=global.stage[i,1]
        chartscore=global.stage[i,2]

        //Stage Unlocking

        if global.unlock_stage=level_id
        global.unlock_stage+=1
    }
}

i=2
if room=rmBOSSRUN
{
    level_id=2

    if global.time_attack=false
    {
        charttime=global.stage[i,0]
        chartrings=global.stage[i,1]
        chartscore=global.stage[i,2]

        //Stage Unlocking

        if global.unlock_stage=level_id
        global.unlock_stage+=1
    }
}

i=10
if room=rmSUNLIGHT
{
    level_id=3

    if global.time_attack=false
    {
        charttime=global.stage[i,0]
        chartrings=global.stage[i,1]
        chartscore=global.stage[i,2]

        //Stage Unlocking

        if global.unlock_stage=level_id
        global.unlock_stage+=1
    }
}
i=11
if room=rmSUNLIGHT2
{
    level_id=4

    if global.time_attack=false
    {
        charttime=global.stage[i,0]
        chartrings=global.stage[i,1]
        chartscore=global.stage[i,2]

        //Stage Unlocking

        if global.unlock_stage=level_id
        global.unlock_stage+=1
    }
}
i=12
if room=rmSUNLIGHTB
{
    level_id=5

    if global.time_attack=false
    {
        charttime=global.stage[i,0]
        chartrings=global.stage[i,1]
        chartscore=global.stage[i,2]

        //Stage Unlocking
        //not yet...
        //if global.unlock_stage=level_id
        //global.unlock_stage+=1
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Time Attack
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.time_attack=true
{
    /*if global.player="Shadow"
    char_id=.0001
    else*/

    char_id=0

    if global.time_places[level_id,0]=-1
    {
        global.time_places[level_id,0]=global.resulttime + char_id
        new_record=true
        rank=0
        global.time_char[level_id,0]=global.player
    }
    else
    {
        if global.resulttime<global.time_places[level_id,0]
        {
            global.time_places[level_id,2]=global.time_places[level_id,1]
            global.time_places[level_id,1]=global.time_places[level_id,0]
            global.time_places[level_id,0]=global.resulttime + char_id

            global.time_char[level_id,2]=global.time_char[level_id,1]
            global.time_char[level_id,1]=global.time_char[level_id,0]
            global.time_char[level_id,0]=global.player
            new_record=true
            rank=0
        }
        else if global.resulttime<global.time_places[level_id,1] || global.time_places[level_id,1]=-1
        {
            if global.time_places[level_id,1]!=-1
            global.time_places[level_id,2]=global.time_places[level_id,1]
            global.time_places[level_id,1]=global.resulttime + char_id

            global.time_char[level_id,2]=global.time_char[level_id,1]
            global.time_char[level_id,1]=global.player
            rank=1
        }
        else if global.resulttime<global.time_places[level_id,2] || global.time_places[level_id,2]=-1
        {
            global.time_places[level_id,2]=global.resulttime + char_id

            global.time_char[level_id,2]=global.player
            rank=2
        }
        else
        {
            rank=4
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Online Goal Destroy
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objOnlineGoal
instance_destroy()
// You might want to move this to the new result screen
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if rank=0 && global.specialfx>2{
instance_create(view_xview+128,view_yview+152,objRankSparkle)
alarm[0]=random(20)+15}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Save Results
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.time_attack=false && global.online_mode=false
{
    i=0
    if room=rmNIGHT{
    if global.stage[i,0]=-1 || global.stage[i,0]>global.resulttime
    global.stage[i,0]=global.resulttime
    if global.stage[i,1]=-1 || global.stage[i,1]<global.Rings
    global.stage[i,1]=global.Rings
    if global.stage[i,2]=-1 || global.stage[i,2]<calculate
    global.stage[i,2]=calculate
    if global.stage[i,3]=-1 || global.stage[i,3]>rank
    global.stage[i,3]=rank}

    i=1
    if room=rmNIGHT2{
    if global.stage[i,0]=-1 || global.stage[i,0]>global.resulttime
    global.stage[i,0]=global.resulttime
    if global.stage[i,1]=-1 || global.stage[i,1]<global.Rings
    global.stage[i,1]=global.Rings
    if global.stage[i,2]=-1 || global.stage[i,2]<calculate
    global.stage[i,2]=calculate
    if global.stage[i,3]=-1 || global.stage[i,3]>rank
    global.stage[i,3]=rank}

    i=2
    if room=rmBOSSRUN{
    if global.stage[i,0]=-1 || global.stage[i,0]>global.resulttime
    global.stage[i,0]=global.resulttime
    if global.stage[i,1]=-1 || global.stage[i,1]<global.Rings
    global.stage[i,1]=global.Rings
    if global.stage[i,2]=-1 || global.stage[i,2]<calculate
    global.stage[i,2]=calculate
    if global.stage[i,3]=-1 || global.stage[i,3]>rank
    global.stage[i,3]=rank}

    i=10
    if room=rmSUNLIGHT{
    if global.stage[i,0]=-1 || global.stage[i,0]>global.resulttime
    global.stage[i,0]=global.resulttime
    if global.stage[i,1]=-1 || global.stage[i,1]<global.Rings
    global.stage[i,1]=global.Rings
    if global.stage[i,2]=-1 || global.stage[i,2]<calculate
    global.stage[i,2]=calculate
    if global.stage[i,3]=-1 || global.stage[i,3]>rank
    global.stage[i,3]=rank}

    i=11
    if room=rmSUNLIGHT2{
    if global.stage[i,0]=-1 || global.stage[i,0]>global.resulttime
    global.stage[i,0]=global.resulttime
    if global.stage[i,1]=-1 || global.stage[i,1]<global.Rings
    global.stage[i,1]=global.Rings
    if global.stage[i,2]=-1 || global.stage[i,2]<calculate
    global.stage[i,2]=calculate
    if global.stage[i,3]=-1 || global.stage[i,3]>rank
    global.stage[i,3]=rank}

    i=12
    if room=rmSUNLIGHTB{
    if global.stage[i,0]=-1 || global.stage[i,0]>global.resulttime
    global.stage[i,0]=global.resulttime
    if global.stage[i,1]=-1 || global.stage[i,1]<global.Rings
    global.stage[i,1]=global.Rings
    if global.stage[i,2]=-1 || global.stage[i,2]<calculate
    global.stage[i,2]=calculate
    if global.stage[i,3]=-1 || global.stage[i,3]>rank
    global.stage[i,3]=rank}
}
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha0=2
key_alpha0=0
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha1=2
key_alpha1=0
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha2=2
key_alpha2=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if rankdelay>0
rankdelay-=1

//Loop Result Music
if rankdelay=0 && totalpoints=true
{
if musicdelay>0
musicdelay-=1

if musicdelay=40+add_del
{
if global.player="Sonic"
{
if rank=0
sound_play(vcBRes1)
if rank=1
sound_play(vcBRes2)
if rank=2
sound_play(vcBRes3)
if rank=3
sound_play(vcBRes4)
}
if global.player="Shadow"
{
if rank=0
sound_play(vcRRes1)
if rank=1
sound_play(vcRRes2)
if rank=2
sound_play(vcRRes3)
if rank=3
sound_play(vcRRes4)
}
}
    if musicdelay=1
    {
        if global.time_attack=true || global.online_mode=true
        {
            if new_record=true
            {
                /*global.ADD=global.RES1
                sizeinms = FMODSoundGetLength(global.ADD)
                FMODSoundSetLoopPoints(global.ADD,3166/sizeinms,1);
                FMODSoundSetGroup(global.ADD,3);
                FMODGroupSetVolume(3,global.musicvolume)
                global.BGM = FMODSoundLoop(global.ADD);*/
                global.BGM = FMODMusicSetup(global.RES1, "music/SvD_Result1.ogg", 3, .54, 3166, 1)
            }
            else
            {
                /*global.ADD=global.RES2
                sizeinms = FMODSoundGetLength(global.ADD)
                FMODSoundSetLoopPoints(global.ADD,13334/sizeinms,1);
                FMODSoundSetGroup(global.ADD,3);
                FMODGroupSetVolume(3,global.musicvolume)
                global.BGM = FMODSoundLoop(global.ADD);*/
                global.BGM = FMODMusicSetup(global.RES2, "music/SvD_Result2.ogg", 3, .54, 13334, 1)
            }
        }
        else if global.BOSS=true
        global.BGM = FMODMusicSetup(global.RES3, "music/SvD_Results2.ogg", 3, .56, 33965, 1)
        else
        global.BGM = FMODMusicSetup(global.RES, "music/SvD_Results.ogg", 3, .6, 24477, 1)
    }
}

if musicdelay=0 && nextmove<0
nextmove+=10

if bgalpha<.2
bgalpha+=.01

if mpanelalpha<1
mpanelalpha+=.05

//RESULTS
if titlemove2<-40 && resultscrop<1{
resultscrop+=.05
if arrowsweep>6
arrowsweep-=arspd
else
arrowsweep=6
if arspd>0
arspd-=1
}
if arrowsweep=6 && arrowfade<.5
arrowfade+=.05

if starf[0]=-.5
starf[0]=1
if starf[1]=-.5
starf[1]=1
if starf[2]=-.5
starf[2]=1

starf[0]-=.05
starf[1]-=.05
starf[2]-=.05

// Small Panel Titles
if titlemove2<-40{
if paneltalpha1<1
paneltalpha1+=.1
if paneltalpha1=1 && paneltalpha2<1 && paneltmove1=0
paneltalpha2+=.1
if paneltalpha2=1 && paneltalpha3<1 && paneltmove2=0
paneltalpha3+=.1

if paneltmove1>0
paneltmove1-=10
if paneltmove1=0 && paneltmove2>0
paneltmove2-=10
if paneltmove2=0 && paneltmove3>0
paneltmove3-=10

// Panels
if paneltmove1=0 && panelmove1>0
panelmove1-=10
if paneltmove2=0 && panelmove2>0
panelmove2-=10
if paneltmove3=0 && panelmove3>0
panelmove3-=10
if panelmove3=0 && panelmove4>0
panelmove4-=10}

//Panel Sounds
if panelmove1=90 || ((panelmove2=90 || panelmove3=90) && global.time_attack=false && global.online_mode=false) || panelmove4=90
sound_play(sndMenuSlide)
if emalpha=.05 && global.ACT2=false && global.BOSS=false && global.time_attack=false && global.online_mode=false
sound_play(sndMenuPop)

if ranksize2=.8{
alarm[1]=1
sound_play(sndResult)
sound_stop(sndRankFlip)
sound_stop(sndRankFlip2)}
if ranksize=9.5{
if rank<2 && global.time_attack=false
sound_play(sndRankFlip)
else
sound_play(sndRankFlip2)}

//Emerald Panel
if paneltmove3=0{
if emalpha<1
emalpha+=.05
if emmove>0
emmove-=1}

if emalpha>=1 && emdelay>0
emdelay-=1

//NEW RECORD
if paneltmove3=0 && rankdelay=0 && totalpoints=true && musicdelay<40 && global.time_attack=false && global.online_mode=false{

if charttime>global.resulttime || charttime=-1
if nralpha=0
instance_create(view_xview+200,view_yview+52,objRecordSwirl)

if chartrings<global.Rings || chartrings=-1
if nralpha2=0 && nralpha=2
with instance_create(view_xview+200,view_yview+102,objRecordSwirl)
sprite_index=sprSlideSparks3

if chartscore<calculate || chartscore=-1
if nralpha3=0 && nralpha2=2
with instance_create(view_xview+200,view_yview+152,objRecordSwirl)
sprite_index=sprSlideSparks4

if nralpha3<2 && nrmove3<=60 && nralpha2=2
nralpha3+=.1
if nralpha2<2 && nrmove2<=60 && nralpha=2
nralpha2+=.1
if nralpha<2
nralpha+=.1

if nrmove>0
nrmove-=5
if nrmove2>0
nrmove2-=5
if nrmove3>0
nrmove3-=5}


if mpanelalpha=1{
if titlealpha<1 && titlemove2>=-15
titlealpha+=.1
titlemove+=titleslow
titlemove2-=titleslow
if titleslow>.5 && titlemove2>=-15
titleslow-=.5
else if titlemove2>=-15
titleslow+=.2

if titlemove=-478
sound_play(sndMenuPop2)

if titlemove2<-15{
titleslow+=.5
titlealpha-=.1

if totalpoints=true && rankdelay=0// CONTROL TO RANK ANIMATION
{
    if rankalpha<1
    rankalpha+=.05
    if ranksize>1
    ranksize-=.5
    if rankrot<360 && rank<2 && global.time_attack=false
    rankrot+=20
    if ranksize=1.5{
    ranksize2=.9
    rankalpha2=1}
    if ranksize2>0
    ranksize2-=.1
}
}}

if rankalpha2>0{

rankalpha2-=.1
ranksize3+=.1

if rankalpha3>0
rankalpha3-=.1
if ranksize4<5
ranksize4+=.1
if rankrot2<360
rankrot2+=5}

if rankalpha3=0
if crankdelay>0
crankdelay-=1

if crankdelay=0{
if rank=3
{
if crankrot>-15
crankrot-=5
if cranky<10
cranky+=1
}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if button_alpha0>0
button_alpha0-=.1
if button_alpha1>0
button_alpha1-=.1
if button_alpha2>0
button_alpha2-=.1

 if panelmove4=0{
 if gettotal=0{
 if global.time_attack=false
 sound_loop(sndCounting)
 }

 if gettotal<calculate
 gettotal+=123
 if gettotal>=calculate
 gettotal=calculate}

 if gettotal=calculate{
 if totalpoints=false
 {
 rankdelay=100
 if global.time_attack=false{
 sound_stop(sndCounting)
 sound_play(sndTotal)}}
 totalpoints=true}

// Your Grade
//********************************************************

if global.time_attack=false && global.online_mode=false
{
    if room=rmNIGHT
    {
        if calculate>=10000
        rank=0
        if calculate<10000 && calculate>=8000
        rank=1
        if calculate<8000 && calculate>=6000
        rank=2
        if calculate<6000
        rank=3
    }
    if room=rmNIGHT2
    {
        if calculate>=9000
        rank=0
        if calculate<9000 && calculate>=7000
        rank=1
        if calculate<7000 && calculate>=5000
        rank=2
        if calculate<5000
        rank=3
    }
    if room=rmBOSSRUN
    {
        if calculate>=6000
        rank=0
        if calculate<6000 && calculate>=5000
        rank=1
        if calculate<5000 && calculate>=4000
        rank=2
        if calculate<4000
        rank=3
    }

    if room=rmSUNLIGHT
    {
        if calculate>=9500
        rank=0
        if calculate<9500 && calculate>=8000
        rank=1
        if calculate<8000 && calculate>=6000
        rank=2
        if calculate<6000
        rank=3
    }
    if room=rmSUNLIGHT2
    {
        if calculate>=8000
        rank=0
        if calculate<8000 && calculate>=6500
        rank=1
        if calculate<6500 && calculate>=5000
        rank=2
        if calculate<5000
        rank=3
    }
    if room=rmSUNLIGHTB
    {
        if calculate>=5500
        rank=0
        if calculate<5500 && calculate>=4500
        rank=1
        if calculate<4500 && calculate>=3000
        rank=2
        if calculate<3000
        rank=3
    }

    if room=rmTEST
    {
        if calculate>=8000
        rank=0
        if calculate<8000 && calculate>=6000
        rank=1
        if calculate<6000 && calculate>=4000
        rank=2
        if calculate<4000
        rank=3
    }
    if room=rmTEST2
    {
        if calculate>=7000
        rank=0
        if calculate<7000 && calculate>=5000
        rank=1
        if calculate<5000 && calculate>=4000
        rank=2
        if calculate<4000
        rank=3
    }
    if room=rmGREEN
    {
        if calculate>=8000
        rank=0
        if calculate<8000 && calculate>=6000
        rank=1
        if calculate<6000 && calculate>=4000
        rank=2
        if calculate<4000
        rank=3
    }
    if room=rmRAD
    {
        if calculate>=8000
        rank=0
        if calculate<8000 && calculate>=6000
        rank=1
        if calculate<6000 && calculate>=4000
        rank=2
        if calculate<4000
        rank=3
    }
    if room=rmSURF
    {
        if calculate>=7000
        rank=0
        if calculate<7000 && calculate>=6000
        rank=1
        if calculate<6000 && calculate>=5000
        rank=2
        if calculate<5000
        rank=3
    }
    if room=rmGRIND
    {
        if calculate>=6000
        rank=0
        if calculate<6000 && calculate>=5000
        rank=1
        if calculate<5000 && calculate>=4000
        rank=2
        if calculate<4000
        rank=3
    }
}
//********************************************************

if instance_exists(objFadeOut)
if objFadeOut.alph=1{
FMODInstanceStop(global.BGM)
room_goto(rmLOADING)}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for(emz=0;emz<7;emz+=1)
if global.emeralds[emz]=1+emz
global.emeraldget[emz]=true
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=view_current=0
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
draw_set_alpha(bgalpha)
draw_rectangle_color(view_xview,view_yview,view_wview,view_hview,c_black,c_black,c_black,c_black,false)
draw_set_alpha(1)
draw_sprite_ext(RMainPanels,0,view_xview,view_yview,1,1,0,c_white,mpanelalpha)
if global.player="Sonic" || global.player="Supersonic"
draw_sprite_ext(RMainTitles,0,view_xview+220+titlemove,view_yview+22,1,1,0,c_white,titlealpha)
else if global.player="Shadow" || global.player="Supershadow"
draw_sprite_ext(RMainTitles,1,view_xview+220+titlemove,view_yview+22,1,1,0,c_white,titlealpha)
else
draw_sprite_ext(RMainTitles,2,view_xview+220+titlemove,view_yview+22,1,1,0,c_white,titlealpha)
if global.BOSS=true
draw_sprite_ext(RMainTitles,5,view_xview+220+titlemove2,view_yview+220,1,1,0,c_white,titlealpha)
else if global.ACT2=true
draw_sprite_ext(RMainTitles,4,view_xview+220+titlemove2,view_yview+220,1,1,0,c_white,titlealpha)
else
draw_sprite_ext(RMainTitles,3,view_xview+220+titlemove2,view_yview+220,1,1,0,c_white,titlealpha)

// RESULT DUST
draw_sprite_ext(sprResultDust,0,view_xview,view_yview,1,1,0,c_white,resultscrop)
// RESULT SIGN
draw_sprite_ext(RMainTitles2,0,view_xview+211,view_yview+19,resultscrop,resultscrop,0,c_white,resultscrop)



if arrowsweep<46{
draw_sprite_ext(RArrow,0,view_xview+46,view_yview+4,1,1,0,c_white,resultscrop)
draw_sprite_ext(RArrow,0,view_xview+345+29,view_yview+4,-1,1,0,c_white,resultscrop)}

// STARS
if arrowsweep<75{
draw_sprite_ext(RStars,0,view_xview+75,view_yview+4,1,1,0,c_white,starf[0])
draw_sprite_ext(RStars,1,view_xview+75,view_yview+4,1,1,0,c_white,starf[1])
draw_sprite_ext(RStars,2,view_xview+75,view_yview+4,1,1,0,c_white,starf[2])

draw_sprite_ext(RStars,0,view_xview+(420-74),view_yview+4,-1,1,0,c_white,starf[0])
draw_sprite_ext(RStars,1,view_xview+(420-74),view_yview+4,-1,1,0,c_white,starf[1])
draw_sprite_ext(RStars,2,view_xview+(420-74),view_yview+4,-1,1,0,c_white,starf[2])}

//ARROWS
draw_sprite_ext(RArrow,0,view_xview+arrowsweep,view_yview+4,1,1,0,c_white,resultscrop-arrowfade)
draw_sprite_ext(RArrow,0,view_xview+(420-arrowsweep),view_yview+4,-1,1,0,c_white,resultscrop-arrowfade)

if global.time_attack=false && global.online_mode=false
{
    // PANELS
    draw_sprite_ext(RNumberPanel,0,view_xview+215+panelmove1,view_yview+68,1,1,0,c_white,1)
    draw_sprite_ext(RNumberPanel,0,view_xview+215+panelmove2,view_yview+118,1,1,0,c_white,1)
    draw_sprite_ext(RNumberPanel,0,view_xview+215+panelmove3,view_yview+168,1,1,0,c_white,1)

    draw_sprite_ext(RRankPanel,0,view_xview-panelmove4,view_yview+147,1,1,0,c_white,1)
    draw_sprite_ext(RPanelTitles2,1,view_xview+12-panelmove4,view_yview+145,1,1,0,c_white,1)

    // PANEL TITLES
    draw_sprite_ext(RPanelTitles,0,view_xview+168-paneltmove1,view_yview+61,1,1,0,c_white,paneltalpha1)
    draw_sprite_ext(RPanelTitles,1,view_xview+168-paneltmove2,view_yview+111,1,1,0,c_white,paneltalpha2)
    draw_sprite_ext(RPanelTitles,2,view_xview+168-paneltmove3,view_yview+161,1,1,0,c_white,paneltalpha3)

    // EMERALD PANEL
    if global.ACT2=false && global.BOSS=false{
    draw_sprite_ext(REmerald,0,view_xview+33,view_yview+75,1,1,0,c_white,emalpha)
    draw_sprite_ext(RPanelTitles2,0,view_xview+9,view_yview+65+emmove,1,1,0,c_white,emalpha)

    /******************
        Emeralds
    ******************/
    var (emzspr)=sprEM1;
    var (em_num)=0;

    if room=rmNIGHT
    {
        emzspr=sprEM1
        em_num=0

    }
    else if room=rmSUNLIGHT
    {
        emzspr=sprEM2
        em_num=1
    }

    if global.emeralds[em_num]=1+em_num && emdelay=0 && global.emeraldget[em_num]=false{
    if emf<2{
    if emf=0
    sound_play(sndEmeraldResult)
    emf+=.1}
    draw_sprite_ext(sprQTEFlash,0,view_xview+33+22,view_yview+75+19,(emf+.2)*1.5,(emf+.2)*1.5,0,c_white,1.2-emf)
    draw_sprite(emzspr,(global.motion_time)*.015,view_xview+33+22,view_yview+75+19)}

    else if global.emeralds[em_num]=1+em_num && global.emeraldget[em_num]=true
    draw_sprite_ext(emzspr,(global.motion_time)*.015,view_xview+33+22,view_yview+75+19,1,1,0,c_white,emalpha)
    }

    // NEW RECORD
    if rankdelay=0 && totalpoints=true && musicdelay<=40
    {
        if charttime>global.resulttime || charttime=-1
        {
            draw_sprite_ext(RNewRecord,0,view_xview+200,view_yview+52,1,1,0,c_white,1)
            d3d_set_fog(true,c_white,0,0);
            draw_sprite_ext(RNewRecord,0,view_xview+200,view_yview+52,1,1,0,c_white,1-nralpha)
            d3d_set_fog(false,c_white,0,0);
        }
        if chartrings<global.Rings || chartrings=-1
        {
            if nralpha=2
            {
                draw_sprite_ext(RNewRecord,1,view_xview+200,view_yview+102,1,1,0,c_white,1)
                d3d_set_fog(true,c_white,0,0);
                draw_sprite_ext(RNewRecord,1,view_xview+200,view_yview+102,1,1,0,c_white,1-nralpha2)
                d3d_set_fog(false,c_white,0,0);
            }
        }
        if chartscore<calculate || chartscore=-1
        {
            if nralpha2=2
            {
                draw_sprite_ext(RNewRecord,2,view_xview+200,view_yview+152,1,1,0,c_white,1)
                d3d_set_fog(true,c_white,0,0);
                draw_sprite_ext(RNewRecord,2,view_xview+200,view_yview+152,1,1,0,c_white,1-nralpha3)
                d3d_set_fog(false,c_white,0,0);
            }
        }
    } //nrmove3
}
else
{

    // PANELS
    draw_sprite_ext(RNumberPanel,0,view_xview+215+panelmove1,view_yview+94,1,1,0,c_white,1)
    // PANEL TITLES
    draw_sprite_ext(RPanelTitles,0,view_xview+168-paneltmove1,view_yview+87,1,1,0,c_white,paneltalpha1)

    draw_sprite_ext(RRankPanel,0,view_xview-panelmove4,view_yview+147,1,1,0,c_white,1)
    draw_sprite_ext(RPanelTitles2,1,view_xview+12-panelmove4,view_yview+145,1,1,0,c_white,1)

}

var rankspr;

if global.time_attack=false && global.online_mode=false
rankspr=sprRanks
else
rankspr=sprTARanks

//Rank Shine
draw_set_blend_mode(bm_add)
if rankalpha2>0
draw_sprite_ext(sprRankShine,0,view_xview+128,view_yview+152,ranksize4,ranksize4,rankrot2,c_white,rankalpha3)
draw_set_blend_mode(bm_normal)
//Rank
draw_sprite_ext(rankspr,rank,view_xview+128+(cranky/1.5),view_yview+152+cranky,ranksize-ranksize2,ranksize-ranksize2,rankrot+crankrot,c_white,rankalpha)

//Rank Fade Grow
draw_set_blend_mode(bm_add)
draw_sprite_ext(rankspr,rank,view_xview+128,view_yview+152,ranksize3,ranksize3,0,c_white,rankalpha2)
draw_set_blend_mode(bm_normal)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var more;

if global.time_attack>0 || global.online_mode=true
more=26
else
more=0

draw_set_font(global.fntResult);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_number_zero(view_xview+panelmove1+325+73, view_yview+75+more, (actualtime div 10)    mod 100, 2);     // Milliseconds
draw_number_zero(view_xview+panelmove1+267+73, view_yview+75+more,  (actualtime div 1000)  mod 60,  2);    // Seconds
draw_number_zero(view_xview+panelmove1+214+73, view_yview+75+more,  (actualtime div 60000) mod 60,  2);    // Minutes

draw_sprite(sprResultNums,10,view_xview+panelmove1+230+70,view_yview+75+more);    //'
draw_sprite(sprResultNums,11,view_xview+panelmove1+288+70,view_yview+75+more);    //"

if global.time_attack=false && global.online_mode=false
{
draw_number_zero(view_xview+panelmove2+230+120+10, view_yview+124,getrings/10, 5);   // Rings
draw_number_zero(view_xview+panelmove3+230+120, view_yview+174,gettotal, 6);   // Total
}

draw_set_halign(fa_left);


if musicdelay=0{
if global.BOSS=true || global.time_attack>0 || global.online_mode=true
ty=1
else
ty=0
draw_sprite(RNextPanel,ty,view_xview+10+nextmove,view_yview+211)

if ty=0
{
    if global.xbox=false{
    draw_sprite_ext(sprTrickJKeys,key_alpha0,view_xview+10+nextmove,view_yview+211,1,1,0,c_white,1)
    draw_sprite_ext(sprTrickJKeys,key_alpha1,view_xview+140+nextmove,view_yview+211,1,1,0,c_white,1)
    draw_sprite_ext(sprTrickJKeys,key_alpha2,view_xview+270+nextmove,view_yview+211,1,1,0,c_white,1)
    
    draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_a),view_xview+10+nextmove,view_yview+211,1,1,0,c_white,1)
    draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_s),view_xview+140+nextmove,view_yview+211,1,1,0,c_white,1)
    draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_d),view_xview+270+nextmove,view_yview+211,1,1,0,c_white,1)}
    else
    {
    draw_sprite_ext(sprPressScript360,0,view_xview+10+nextmove,view_yview+211,1,1,0,c_white,1)
    draw_sprite_ext(sprPressScript360,2,view_xview+140+nextmove,view_yview+211,1,1,0,c_white,1)
    draw_sprite_ext(sprPressScript360,3,view_xview+270+nextmove,view_yview+211,1,1,0,c_white,1)
    
    draw_sprite_blend_ext(sprPressScript360,0,view_xview+10+nextmove,view_yview+211,1,1,0,c_white,button_alpha0,bm_add)
    draw_sprite_blend_ext(sprPressScript360,2,view_xview+140+nextmove,view_yview+211,1,1,0,c_white,button_alpha1,bm_add)
    draw_sprite_blend_ext(sprPressScript360,3,view_xview+270+nextmove,view_yview+211,1,1,0,c_white,button_alpha2,bm_add)
    }
}
else
{
    if global.xbox=false{
    draw_sprite_ext(sprTrickJKeys,key_alpha0,view_xview+85+nextmove,view_yview+211,1,1,0,c_white,1)
    draw_sprite_ext(sprTrickJKeys,key_alpha1,view_xview+215+nextmove,view_yview+211,1,1,0,c_white,1)
    
    draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_a),view_xview+85+nextmove,view_yview+211,1,1,0,c_white,1)
    draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_s),view_xview+215+nextmove,view_yview+211,1,1,0,c_white,1)}
    else
    {
    draw_sprite_ext(sprPressScript360,0,view_xview+85+nextmove,view_yview+211,1,1,0,c_white,1)
    draw_sprite_ext(sprPressScript360,2,view_xview+215+nextmove,view_yview+211,1,1,0,c_white,1)
    
    draw_sprite_blend_ext(sprPressScript360,0,view_xview+85+nextmove,view_yview+211,1,1,0,c_white,button_alpha0,bm_add)
    draw_sprite_blend_ext(sprPressScript360,2,view_xview+215+nextmove,view_yview+211,1,1,0,c_white,button_alpha1,bm_add)
    }
}

}
#define Trigger_press D
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keypress=false && nextmove=0 && ty=0{

if totalpoints=true && rankdelay=0{
if presseda=false{
presseda=true
global.room_change=rmHUB
sound_play(sndResultA)
if global.unlocknew=0
global.savegame=true
instance_create(0,0,objFadeOut)
if global.unlocknew!=0
global.loadlevel=0
else
global.loadlevel=2

button_alpha2=1
key_alpha2=2
alarm[4]=5}
keypress=true
}
}
#define Trigger_press Menu A
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keypress=false && nextmove=0
{
    if totalpoints=true && rankdelay=0
    {
        if pressedd=false
        {
            if global.time_attack=true
            {
                global.room_change=rmStartMenu
                global.time_attack=2
            }
            else if global.online_mode=true
            {
                global.room_change=rmHUB
            }
            else
            {
                if room=rmNIGHT
                    global.destination=rmNIGHT2
                else if room=rmNIGHT2
                    global.destination=rmBOSSRUN
                else if room=rmSUNLIGHT
                    global.destination=rmSUNLIGHT2
                else if room=rmSUNLIGHT2
                    global.destination=rmSUNLIGHTB
                else
                {
                    global.room_change=rmHUB
                    if global.unlocknew=0
                        global.savegame=true
                }
                pressedd=true
                if global.room_change!=rmHUB
                    global.room_change=TestIntro
            }
            sound_play(sndResultA)
            instance_create(0,0,objFadeOut)

            global.loadlevel=0
            global.ADD=0
            global.room_lag=true

            button_alpha0=1
            key_alpha0=2
            alarm[2]=5
        }
        keypress=true
    }
}
#define Trigger_press Menu S
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keypress=false && nextmove=0{
if totalpoints=true && rankdelay=0{
if pressedz=false{
pressedz=true
/* THIS MOTHER FUCKER HAD ME WORRIED SICK
if room=rmGRIND
global.destination=rmGRIND
if room=rmTEST
global.destination=rmTEST
if room=rmTEST2
global.destination=rmTEST2*/
global.room_change=TestIntro{
sound_play(sndResultA)
instance_create(0,0,objFadeOut)}
global.loadlevel=0
global.ADD=0
global.room_lag=true

button_alpha1=1
key_alpha1=2
alarm[3]=5}
keypress=true
}
}
