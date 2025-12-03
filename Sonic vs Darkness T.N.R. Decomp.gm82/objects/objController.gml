#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Initialize Variables
{
    global.combocounter = 0
    global.ACombo=-1
    global.AComboTime=0
    global.AComboPause=false
    global.supers=false
    global.bossdamage=0
    bossdamage2=0
    bossgrow=174
    check=1;
    Rings=0;
    Time=0;
    Score=0;
    blink=10;
    bcolor=c_white;
    global.combo = global.combocounter
    global.RingLivesGiven=1;
    global.millis=""
    global.secs=""
    global.mins=""
    global.motion_time=global.game_time
    putdepth=1

    if global.xbox=true && global.ps3=true
    controlinput=2
    else if global.xbox=true
    controlinput=1
    else
    controlinput=0

    drawone=0

    global.redraw_ripple=false

    active=3
    if room=rmBOSSRUN || room=rmSUNLIGHTB
    activate_region=false
    else
    activate_region=true
    once=5
    cct=false
    bleepsign=false
    bleepsign2=false
    dark=0
    impact=0
    goal_dis=0
    player_pos=0

    //For the camera
    global.lookahead=false
    global.lookahead2=false
    global.lookbehind=false

    //boost shine animation speed
    bspd=0

    skilltime=60
    ringadd=0

    ver=0// if vermin exists then raise the lives and v and lives number

    moneyspeed=0

    global.solidwater=true
    global.underwater=false

    pjspd=0

    qte=0

    //EMERALDS
    emget=13
    empos=0

    //************ACTION CHAIN*******************
    //whole logo
    acalpha=0
    aclogoa=0
    //logo shine
    aclogoa2b=0
    aclogoa2=0
    //logo letters
    aclogos=2
    for(i=0;i<12;i+=1)
    acsize[i]=2+(i/2)

    //logo numbers
    acnumalpha=0
    global.acflash=0

    //Cool,Extreme,Perfect Fly-in
    respd=60
    resframe=0

    //Arrow Speed
    arrowspd=10

    //Number Zoom
    aczoom=1
    acflash2=1
    //*******************************************

    tczoom=1
    tcalpha=1
    tcangle=0
    tcbgalpha=0
    tcbgzoom=2
    tcbgalpha2=0

    // Spikes Animated
    global.spiketime=60
    global.spikepos=1

    global.sm1=false
    global.sm2=false
    global.sm3=false
    global.sm4=false
    global.sm5=false

    global.eletime=150
    global.elebutton=false

    global.loadscreen=-1

    //COME BACK TO THIS **********************************************
    //if global.online_mode=true
    //gms_instance_sync(id, is_full,"global.loadscreen");

    if instance_exists(objRotateBG){
    global.stoptime=true

    if global.online_mode=true && !instance_exists(objOnlineHUD)
    instance_create(0,0,objOnlineHUD)}
    else
    global.stoptime=false

    if global.online_mode=true
    online_activate=5
    else
    online_activate=-1

    global.buttonset=1
    global.buttonlen=0
    randomkey1 = choose("A","S","D","W")
    randomkey2 = choose("A","S","D","W")
    randomkey3 = choose("A","S","D","W")

    randomkey4 = choose("A","S","D","W")
    randomkey5 = choose("A","S","D","W")

    keydraw1=""
    keydraw2=""
    keydraw3=""

    keydraw4=""
    keydraw5=""

    alpha=0
    blpha=0
    ringalpha=0
    beamalpha=1
    buttontimer=0
    stfr=0
    stap=1
    global.HUB=false
    global.TUT=false
    global.BOSS=false
    global.ACT2=false

    if room=rmNIGHT
    global.dscenter=room_height/2+30
    else
    global.dscenter=room_height/2

    if room=rmHUB
    global.HUB=true

    if room=rmTRAIN
    global.TUT=true

    if room=rmBOSSRUN || room=rmSUNLIGHTB
    global.BOSS=true

    if room=rmNIGHT2 || room=rmSUNLIGHT2
    global.ACT2=true

    global.no_boost_replish=false

    //Boss Warnings
    bwarn=0
    global.boss_warning_t=0
    global.boss_warning_t2=0
    global.boss_warning_t3=0
    global.boss_warning_t4=0

    global.boss_warning_x=0
    global.boss_warning_x2=0
    global.boss_warning_x3=0
    global.boss_warning_x4=0

    global.boss_warning_y=0
    global.boss_warning_y2=0
    global.boss_warning_y3=0
    global.boss_warning_y4=0

    global.arcade=false

    global.pausereturn=false

    global.imageindex=0
    ready=0

    if !instance_exists(MusicSystem)
    instance_create(0,0,MusicSystem)

    shine=false
    shinefade=.45
    rainbscale=0

    hyper=0
    starot1=0
    starot2=0
    starot3=0
    starot4=0
    starot5=0
    //underwater sound
    fadewater=0

    //jet sound
    fadejet=.7
    if room=rmTRAIN || room=rmHUB || global.game_time!=0 || global.BOSS=true
    global.boost=127
    else
    global.boost=0
    global.Vboost=0

    // hyper boost
    global.hyperboost=0
    hue=0

    //power up hud
    shield=0
    run=2
    level=4
    star=6
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if global.time_attack=true
//instance_create(0,0,objGhostRec)

//FPSO_init()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Extra Lives via Rings
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if (global.RingLivesGiven < 3){

if (global.Rings >= (global.RingLivesGiven * 100)){

global.RingLivesGiven += 1;
lives += 1;
sound_play(sndExtraLife);
drawone=100

    }

}*/
if drawone>0
drawone-=1

//Prevent Power ups from going over limit
if lives>99
lives=99
if global.Rings>999
global.Rings=999



//Boost shine animation speed
bspd+=.3

if global.imageindex<3.6
global.imageindex+=.3
else
global.imageindex=0

if global.loadscreen>0
global.loadscreen-=1
else
global.loadscreen=-1

if global.loadscreen=20 && global.HUB=false
instance_create(0,0,objFadeOut)


if global.loadscreen=0{
global.loadscreen=-1
room_goto(rmLOADING)}


if global.elebutton=true{
if global.eletime>-30
global.eletime-=1
else
global.eletime=150}

if pjspd>=.1
pjspd+=.1
if pjspd>11
pjspd=0

if ringalpha>0
ringalpha-=.1

if qte<2
qte+=.1

if qte=2
qte=0


//BOSS
if global.bossdamage>bossdamage2
bossdamage2+=.5

bossdamage2=min(173,bossdamage2)

if instance_exists(objBossCont)
global.no_boost_replish=true

if global.boss_warning_t>0
global.boss_warning_t-=1
if global.boss_warning_t2>0
global.boss_warning_t2-=1
if global.boss_warning_t3>0
global.boss_warning_t3-=1
if global.boss_warning_t4>0
global.boss_warning_t4-=1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Emeralds Collected
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.emeralds[0]=1
if global.emeralds[1]=2
if global.emeralds[2]=3
if global.emeralds[3]=4
if global.emeralds[4]=5
if global.emeralds[5]=6
if global.emeralds[6]=7 && (global.player="Supersonic" || global.player="Supershadow" || global.player="Burningblaze"){
global.supers=true
if !instance_exists(objSuperSparkle)
instance_create(0,0,objSuperSparkle)}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
moneyspeed+=.2

if global.combocounter>5
stfr+=.1



    if !instance_exists(objRotateBG) && global.game_time<5999998 && global.stoptime=false && room!=rmHUB && room!=rmTRAIN
    global.game_time += 1000/60;

    global.motion_time+=1000/60;

    if global.game_time>=5999998
    global.game_time=5999998

    /*if global.game_time>=599998{
    if global.arcade=false{
    with objPlayer{
    if instance_exists(objCheckpointClosed)
    objCheckpointClosed.persistent=false
    global.start_x = -1;
    global.start_y = -1;
    instance_destroy()}}
    global.game_time=599998}*/

    global.combo = global.combocounter

    if shine=true && !instance_exists(objBBoost) && !instance_exists(objRBoost)
    {
        shinefade-=.05
        if shinefade=0
        shine=false
    }
    if shine=true && instance_exists(objBBoost) && instance_exists(objRBoost)
    {
        shinefade=.45
    }

        if instance_exists(objPlayer){
        if objPlayer.buttonjump=true && objPlayer.path_speed=.5
        if alpha<.5
        alpha+=.05

        if alpha=.5
        if blpha<1
        blpha+=.1

        if objPlayer.buttonjump=true && objPlayer.path_speed=.5
        if buttontimer<77
        buttontimer=objPlayer.buttontimeup}//.4}

    // UNDERWATER AMBIENCE
    var bgu;
    if instance_exists(objBGSUNLIGHT2)
    bgu=sndBGUnderwaterCove
    else
    bgu=sndBGUnderwater
    if global.underwater=false && sound_isplaying(bgu)
    {
        sound_volume(bgu,fadewater)
        sound_volume(sndBGUnderwater2,fadewater)
        if fadewater>0
            fadewater-=.05
        else
        {
            sound_stop(bgu)
            sound_stop(sndBGUnderwater2)
            fadewater=0
        }
    }
    if (global.underwater=true) && sound_isplaying(bgu){
    sound_volume(bgu,fadewater)
    sound_volume(sndBGUnderwater2,fadewater)
    if fadewater<.4
    fadewater+=.015}

    //for jet
    if !instance_exists(objBBoost) && sound_isplaying(sndJet)
    {
    sound_volume(sndJet,fadejet)
    if fadejet>0
    fadejet-=.015
    else
    {
    sound_stop(sndJet)
    fadejet=.7
    }
    }
    if (instance_exists(objBBoost)) && sound_isplaying(sndJet){
    fadejet=.7
    sound_volume(sndJet,.7)}
    if !instance_exists(objPlayer)
    sound_stop(sndJet)

    //for jet 2
    if !instance_exists(objRBoost) && sound_isplaying(sndWindLp2)
    {
    sound_volume(sndWindLp2,fadejet)
    if fadejet>0
    fadejet-=.015
    else
    {
    sound_stop(sndWindLp2)
    fadejet=.7
    }
    }
    if (instance_exists(objRBoost)) && sound_isplaying(sndWindLp2){
    fadejet=.7
    sound_volume(sndWindLp2,.7)}
    if !instance_exists(objPlayer)
    sound_stop(sndWindLp2)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Bigass List of buttons
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*    if randomkey1="A"
    keydraw1=sprAKey
    if randomkey1="S"
    keydraw1=sprSKey
    if randomkey1="D"
    keydraw1=sprDKey
    if randomkey1="W"
    keydraw1=sprWKey

    if randomkey2="A"
    keydraw2=sprAKey
    if randomkey2="S"
    keydraw2=sprSKey
    if randomkey2="D"
    keydraw2=sprDKey
    if randomkey2="W"
    keydraw2=sprWKey

    if randomkey3="A"
    keydraw3=sprAKey
    if randomkey3="S"
    keydraw3=sprSKey
    if randomkey3="D"
    keydraw3=sprDKey
    if randomkey3="W"
    keydraw3=sprWKey

    //
    if randomkey4="A"
    keydraw4=sprAKey
    if randomkey4="S"
    keydraw4=sprSKey
    if randomkey4="D"
    keydraw4=sprDKey
    if randomkey4="W"
    keydraw4=sprWKey

    if randomkey5="A"
    keydraw5=sprAKey
    if randomkey5="S"
    keydraw5=sprSKey
    if randomkey5="D"
    keydraw5=sprDKey
    if randomkey5="W"
    keydraw5=sprWKey


    if global.ps3=false{
    if randomkey1="AC"
    keydraw1=sprAButton
    if randomkey1="BC"
    keydraw1=sprBButton
    if randomkey1="X"
    keydraw1=sprXButton
    if randomkey1="Y"
    keydraw1=sprYButton
    if randomkey1="LB"
    keydraw1=sprLBButton
    if randomkey1="RB"
    keydraw1=sprRBButton

    if randomkey2="AC"
    keydraw2=sprAButton
    if randomkey2="BC"
    keydraw2=sprBButton
    if randomkey2="X"
    keydraw2=sprXButton
    if randomkey2="Y"
    keydraw2=sprYButton
    if randomkey2="LB"
    keydraw2=sprLBButton
    if randomkey2="RB"
    keydraw2=sprRBButton

    if randomkey3="AC"
    keydraw3=sprAButton
    if randomkey3="BC"
    keydraw3=sprBButton
    if randomkey3="X"
    keydraw3=sprXButton
    if randomkey3="Y"
    keydraw3=sprYButton
    if randomkey3="LB"
    keydraw3=sprLBButton
    if randomkey3="RB"
    keydraw3=sprRBButton

    //
    if randomkey4="AC"
    keydraw4=sprAButton
    if randomkey4="BC"
    keydraw4=sprBButton
    if randomkey4="X"
    keydraw4=sprXButton
    if randomkey4="Y"
    keydraw4=sprYButton
    if randomkey4="LB"
    keydraw4=sprLBButton
    if randomkey4="RB"
    keydraw4=sprRBButton

    if randomkey5="AC"
    keydraw5=sprAButton
    if randomkey5="BC"
    keydraw5=sprBButton
    if randomkey5="X"
    keydraw5=sprXButton
    if randomkey5="Y"
    keydraw5=sprYButton
    if randomkey5="LB"
    keydraw5=sprLBButton
    if randomkey5="RB"
    keydraw5=sprRBButton}


    else{
    if randomkey1="AC"
    keydraw1=sprCrButton
    if randomkey1="BC"
    keydraw1=sprCiButton
    if randomkey1="X"
    keydraw1=sprSqButton
    if randomkey1="Y"
    keydraw1=sprTrButton
    if randomkey1="LB"
    keydraw1=sprL1Button
    if randomkey1="RB"
    keydraw1=sprR1Button

    if randomkey2="AC"
    keydraw2=sprCrButton
    if randomkey2="BC"
    keydraw2=sprCiButton
    if randomkey2="X"
    keydraw2=sprSqButton
    if randomkey2="Y"
    keydraw2=sprTrButton
    if randomkey2="LB"
    keydraw2=sprL1Button
    if randomkey2="RB"
    keydraw2=sprR1Button

    if randomkey3="AC"
    keydraw3=sprCrButton
    if randomkey3="BC"
    keydraw3=sprCiButton
    if randomkey3="X"
    keydraw3=sprSqButton
    if randomkey3="Y"
    keydraw3=sprTrButton
    if randomkey3="LB"
    keydraw3=sprL1Button
    if randomkey3="RB"
    keydraw3=sprR1Button

    //
    if randomkey4="AC"
    keydraw4=sprCrButton
    if randomkey4="BC"
    keydraw4=sprCiButton
    if randomkey4="X"
    keydraw4=sprSqButton
    if randomkey4="Y"
    keydraw4=sprTrButton
    if randomkey4="LB"
    keydraw4=sprL1Button
    if randomkey4="RB"
    keydraw4=sprR1Button

    if randomkey5="AC"
    keydraw5=sprCrButton
    if randomkey5="BC"
    keydraw5=sprCiButton
    if randomkey5="X"
    keydraw5=sprSqButton
    if randomkey5="Y"
    keydraw5=sprTrButton
    if randomkey5="LB"
    keydraw5=sprL1Button
    if randomkey5="RB"
    keydraw5=sprR1Button}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=DS Camera
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer) && instance_exists(objCameraDS) && room!=rmHUB
{
    if objPlayer.y>global.dscenter{
    view_yport[0]=245
    view_yport[7]=0
    global.view_switch="bottom"
    global.current_view=0}
    else{
    view_yport[0]=0
    view_yport[7]=245
    global.view_switch="top"
    global.current_view=7}
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Gauge & PowerUp
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if global.boost<127{
if (instance_exists(objBBoost) || instance_exists(objRBoost)) && global.hyperboost=0
global.boost+=.25}
else
global.boost=127


if global.boost>127
global.boost=127


if global.boost<0
global.boost=0

if global.Vboost>39
global.Vboost=39

if global.hyperboost>0{
if global.player!="Supersonic" && global.player!="Supershadow" && global.player!="Burningblaze"
global.hyperboost-=1
if global.hyperboost=1
sound_play(sndTankDrop)
if global.hyperboost>0
global.boost=0}

if global.player="Supersonic" || global.player="Supershadow" || global.player="Burningblaze"
global.hyperboost=100

if rainbscale<2 && global.hyperboost>0
rainbscale+=.1
else if global.hyperboost=0
rainbscale=0

//powerup vars

if instance_exists(objPlayer)
{
if objPlayer.shield
shield=1
else
shield=0

if objPlayer.speed_sneakers=1
run=3
else
run=2

if objPlayer.green_boost=1
level=5
else
level=4

if objPlayer.invincibility=1
star=7
else
star=6
}
else
{
shield=0
run=2
level=4
star=6
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Action Chain
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Canceling Action Chain
if instance_exists(objCamera)
if objCamera.script=true
if global.AComboTime=240
global.AComboTime=0


// Flashing Text When Combo Increase
if global.AComboTime=240 && acnumalpha=1{
global.acflash=1
aclogoa2=1
arrowspd=0

aczoom=2
acflash2=0
}
if global.AComboTime=240{
with objCPTime
instance_destroy()
with objTrickResult
instance_destroy()
// Combo Sound
//if global.player="Sonic"{
if global.ACombo=1
sound_play(ac1)
if global.ACombo=2
sound_play(ac2)
if global.ACombo=3
sound_play(ac3)
if global.ACombo=4
sound_play(ac4)
if global.ACombo=5
sound_play(ac5)
if global.ACombo>=6
sound_play(ac6)/*}
else
{
if global.ACombo=1
sound_play(dc1)
if global.ACombo=2
sound_play(dc2)
if global.ACombo=3
sound_play(dc3)
if global.ACombo=4
sound_play(dc4)
if global.ACombo=5
sound_play(dc5)
if global.ACombo>=6
sound_play(dc6)
}*/
}

if aczoom>1
aczoom-=.2
if acflash2<1
acflash2+=.2

// Trick Chain
if tczoom>1
tczoom-=.2
if tcalpha<1
tcalpha+=.2
tcangle-=2

if tcbgzoom<2
tcbgzoom+=.1
if tcbgalpha2>0
tcbgalpha2-=.1

if arrowspd<170
arrowspd+=10

//Action Chain Countdown
if global.AComboTime>0{
if instance_exists(objPlayer){
//if objPlayer.slide=1 && global.AComboTime>60
//global.AComboTime=239
//else
global.AComboTime-=1}
else
global.AComboTime-=1}

if global.AComboTime=0 && global.ACombo>0
global.ACombo=-1

if global.AComboTime=60{
global.AComboPause=true
acalpha=1
//AWARD PLAYER
global.Score+=global.ACombo*200

if global.camgoal=false && room!=rmTRAIN{
if global.ACombo<15
repeat(floor(global.ACombo div 1.5))instance_create(view_xview+148,view_yview+43,objEnergySprite)
else
repeat(10)instance_create(view_xview+148,view_yview+43,objEnergySprite)}

//Reset Object Combo Collisions
instance_activate_object(objParCombo)
instance_activate_object(objParDasher)
instance_activate_object(objParDasherR)
instance_activate_object(objParSpeedRing)
instance_activate_object(objParSpring)
instance_activate_object(objParRail)
instance_activate_object(objRampJump)
instance_activate_object(objSmRamp)
with objParCombo
comboget=false
with objParDasher
comboget=false
with objParDasherR
comboget=false
with objParSpeedRing
comboget=false
with objParSpring
comboget=false
with objParRail
comboget=false
with objRampJump
comboget=false
with objSmRamp
comboget=false
instance_deactivate_object(objParCombo)
instance_deactivate_object(objParDasher)
instance_deactivate_object(objParDasherR)
instance_deactivate_object(objParSpeedRing)
instance_deactivate_object(objParSpring)
instance_deactivate_object(objParRail)
instance_deactivate_object(objRampJump)
instance_deactivate_object(objSmRamp)

if instance_exists(objPlayer) && global.camgoal=false{
if global.player="Sonic"{
if global.ACombo<4
sound_play(vcBAC1)
else if global.ACombo<10
sound_play(vcBAC2)
else if global.ACombo>=10
sound_play(vcBAC3)}
else if global.player="Shadow"{
if global.ACombo<4
sound_play(vcRAC1)
else if global.ACombo<10
sound_play(vcRAC2)
else if global.ACombo>=10
sound_play(vcRAC3)}}
}

if global.AComboTime=0
global.AComboPause=false

// Decrease Flashing Text Value
if global.acflash>0
global.acflash-=.2

if global.ACombo>0 && global.AComboTime>60
{
acalpha+=.1
for(i=0;i<12;i+=1){
if acsize[i]>1
acsize[i]-=.1}
}
else if acalpha>0
{
acalpha-=.1
acnumalpha=acalpha

// RESET EVERYTHING
    if acalpha=0{
    for(i=0;i<12;i+=1)
    acsize[i]=2+(i/2)
    aclogoa=0
    aclogos=2
    aclogoa2=0
    aclogoa2b=0
    respd=60
    resframe=0
    aczoom=1
    acflash2=1}
}


//MAIN ACTION CHAIN LOGO ANIMATION

if acsize[11]=1 && aclogoa<1
aclogoa+=.05

if acsize[11]=1 && aclogos>1
aclogos-=.1

if aclogoa=1{
if acnumalpha<1
acnumalpha+=.1

//CEP FLYIN
if respd>0
respd-=5

if aclogoa2b=0
aclogoa2+=.1

if aclogoa2b=1
aclogoa2-=.1

if aclogoa2=1
aclogoa2b=1
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Activate/Deactivate Region
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=view_xview+view_wview/2
y=view_yview+view_hview/2

if online_activate>0
online_activate-=1


    /*with __newobject1826
    {
    x=view_xview
    y=view_yview
    }*/

if putdepth!=0
{
// solid objects with different depth
//with objSolid
//depth=depth+.5-(id/1000000)
with all//objPlatform
depth=depth+.5-(id/1000000)

objSpikeAn.depth=3
putdepth-=1
}
if activate_region=true{
active-=1
if active=0
{

    if global.nds=true
    {
        if global.view_switch="bottom"
        instance_deactivate_region(view_xview[7]-200,view_yview[7]-200,view_wview[7]+400,view_hview[7]+view_hview[0]+400,0,1)
        else
        instance_deactivate_region(view_xview[0]-200,view_yview[0]-200,view_wview[0]+400,view_hview[0]+view_hview[7]+400,0,1)
    }
    else
        instance_deactivate_region(view_xview[0]-200,view_yview[0]-200,view_wview[0]+400,view_hview[0]+400,0,1)
}

if global.nds=true
{
    if global.view_switch="bottom"
        instance_activate_region(view_xview[7]-200,view_yview[7]-200,view_wview[7]+400,view_hview[7]+view_hview[0]+400,1)
    else
        instance_activate_region(view_xview[0]-200,view_yview[0]-200,view_wview[0]+400,view_hview[0]+view_hview[7]+400,1)
}
else
    instance_activate_region(view_xview[0]-200,view_yview[0]-200,view_wview[0]+400,view_hview[0]+400,1)

    instance_activate_object(objPushSolid);
    instance_activate_object(objPlayerAI);
    with objPushSolid
    instance_activate_region(x-75,y-75,150,150,1)

//make these objects below exceptions to the above code:
if active=0{

    instance_activate_object(objControl);
    instance_activate_object(objGOD);

    instance_activate_object(objEnemyDeath);
    instance_activate_object(objDoorSolidAuto);
    instance_activate_object(objDoorSolid);
    instance_activate_object(objDoorSwitch);
    instance_activate_object(objEleFencePar);
    instance_activate_object(objMovePlatform);
    instance_activate_object(objButtonBox);
    instance_activate_object(objWallRun);
    instance_activate_object(objNIGHTFirework);
    instance_activate_object(objWaterTop);
    instance_activate_object(objWaterSpout);
    instance_activate_object(objSUNAnchor);

    instance_activate_object(objGHole);
    instance_activate_object(objGHole2);
    instance_activate_object(objNegaGHog);

    instance_activate_object(objRocketRide);
    instance_activate_object(objHUBGrass);

    instance_activate_object(objHandle360);
    instance_activate_object(objHandleLR);
    instance_activate_object(objHandleU);
    instance_activate_object(objHandleU2);
    instance_activate_object(objHandleU3);

    if global.online_mode=true && online_activate=0
    {
    if gms_info_isloggedin() && gms_info_isconnected()
    instance_activate_object(global.__obj)
    }

    active=60}

    }
    /*

    var tile_id; var tile_id2; var tile_id3; var tile_id4; var tile_id5;

for (i=0;i<=room_width;i+=8)
  {
  for (j=0;j<=room_height;j+=8)
    {
    tile_id = tile_layer_find(101,i,j);
    tile_id2 = tile_layer_find(100,i,j);
    tile_id3 = tile_layer_find(-1,i,j);
    tile_id4 = tile_layer_find(0,i,j);
    tile_id5 = tile_layer_find(-100,i,j);
    if (i < view_xview || j < view_yview || i > view_xview+view_wview || j > view_yview+view_hview)
      {
      if tile_exists(tile_id)
      tile_set_visible(tile_id,0);
      if tile_exists(tile_id2)
      tile_set_visible(tile_id2,0);
      if tile_exists(tile_id3)
      tile_set_visible(tile_id3,0);
      if tile_exists(tile_id4)
      tile_set_visible(tile_id4,0);
      if tile_exists(tile_id5)
      tile_set_visible(tile_id5,0);
      }
    else
      {
      if tile_exists(tile_id)
      tile_set_visible(tile_id,1);
      if tile_exists(tile_id2)
      tile_set_visible(tile_id2,1);
      if tile_exists(tile_id3)
      tile_set_visible(tile_id3,1);
      if tile_exists(tile_id4)
      tile_set_visible(tile_id4,1);
      if tile_exists(tile_id5)
      tile_set_visible(tile_id5,1);
      }
    }
  }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Spikes An
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.spiketime-=1
if global.spiketime=0&&global.spikepos=-1
{
if instance_exists(objDarkChao)
global.spiketime=choose(60,60,60,60,60,60,30,20,10)
else
global.spiketime=60
global.spikepos=1
}
if global.spiketime=0&&global.spikepos=1
{
if instance_exists(objDarkChao)
global.spiketime=choose(60,60,60,60,60,60,30,20,10)
else
global.spiketime=60
global.spikepos=-1
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_persistent=false
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=view_current=0 && global.redraw_ripple=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Normal HUD
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
{
    var i;
    var extra;
    extra=1

    //Get Stat Variables from Global
    Rings = global.Rings;
    Score = global.Score;
    Time  = global.Time;
    if global.player="Sonic"||global.player="Supersonic"
    bsh=sprBoostShine
    else
    bsh=sprBoostShine2

    {
    if instance_exists(objGBoost) || instance_exists(objBBoost) || instance_exists(objRBoost){
    if global.specialfx>2
    draw_sprite_blend_ext(bsh,bspd,view_xview,view_yview,1,1,0,c_white,.7,bm_add)
    shine=true}
    else if shine=true{
    if global.specialfx>2
    draw_sprite_blend_ext(bsh,bspd,view_xview,view_yview,1,1,0,c_white,shinefade,bm_add)}

    // CAVE EFFECT
    if instance_exists(objEmeraldSwirl) && global.specialfx>1
    {
        if dark<.6
        dark+=.05
    }
    else if dark>0
    dark-=.05
    if dark>0
    draw_sprite_ext(sprDarkCave,0,view_xview,view_yview,1,1,0,c_white,dark)

    // BEAM EFFECT
    if instance_exists(objBossBeam){
    if beamalpha>0
    beamalpha-=.1}
    else if beamalpha<1
    beamalpha+=.1

    if beamalpha<1 && global.specialfx>1{
    var darkcolor;
    darkcolor=merge_color(make_color_rgb(0,70,119),c_white,beamalpha)
    draw_set_blend_mode_ext(bm_dest_color,bm_zero)
    draw_rectangle_color(view_xview, floor(view_yview-200), view_xview+view_wview, floor(view_yview+view_hview/2), darkcolor, darkcolor, c_white, c_white, false)
    draw_rectangle_color(view_xview, floor(view_yview+view_hview/2), view_xview+view_wview, floor(view_yview+view_hview+200), c_white, c_white, darkcolor, darkcolor, false)
    draw_set_blend_mode(bm_normal)}

    // BOSS WARNING
    if global.boss_warning_t>0
    draw_sprite(sprBossWarning,bwarn,view_xview+global.boss_warning_x,view_yview+global.boss_warning_y)
    if global.boss_warning_t2>0
    draw_sprite(sprBossWarning,bwarn,view_xview+global.boss_warning_x2,view_yview+global.boss_warning_y2)
    if global.boss_warning_t3>0
    draw_sprite(sprBossWarning,bwarn,view_xview+global.boss_warning_x3,view_yview+global.boss_warning_y3)
    if global.boss_warning_t4>0
    draw_sprite(sprBossWarning,bwarn,view_xview+global.boss_warning_x4,view_yview+global.boss_warning_y4)

    bwarn+=.3
    if bwarn>=2
    bwarn=0



        if global.player="Sonic"
        tk=sprTrickJKeys
        else
        tk=sprTrickJKeys2

        // Draw TrickJump Stuff
        if instance_exists(objPlayer)
        if objPlayer.path_index=pathtrick1 && objPlayer.trickjump=true
        {
            {
                // KEYBOARD KEYS
                if global.xbox=false{
                for (i=0;i<5;i+=1)
                {
                    var r; var l;
                    r = 0; l = 0;
                    if i = 1 r=31
                    if i = 2 r=71
                    if i = 3{ r=51 l=20}
                    if i = 4{ r=51 l=0}
                    draw_sprite(tk,0,view_xview+314+r,view_yview+213-l)
                }
                if objPlayer.key_left_direct
                draw_sprite(tk,2,view_xview+314+31,view_yview+213)
                if objPlayer.key_right_direct
                draw_sprite(tk,2,view_xview+314+71,view_yview+213)
                if objPlayer.key_up_direct
                draw_sprite(tk,2,view_xview+314+51,view_yview+213-20)
                if objPlayer.key_down_direct
                draw_sprite(tk,2,view_xview+314+51,view_yview+213)
                if objPlayer.path_position>.6 && blink>6
                draw_sprite(tk,1,view_xview+314,view_yview+213)

            // Draw the chosen keys
            draw_sprite(sprPressScriptL,scrCheckASCII(global.k_a),view_xview+314,view_yview+213)
            draw_sprite(sprPressScriptL,scrCheckASCII(global.k_left),view_xview+314+31,view_yview+213)
            draw_sprite(sprPressScriptL,scrCheckASCII(global.k_right),view_xview+314+71,view_yview+213)
            draw_sprite(sprPressScriptL,scrCheckASCII(global.k_up),view_xview+314+51,view_yview+213-20)
            draw_sprite(sprPressScriptL,scrCheckASCII(global.k_down),view_xview+314+51,view_yview+213)}

                // XBOX 360 BUTTONS
                else{
                if objPlayer.key_left_direct
                draw_sprite(sprPressScript360,7,view_xview+314+50,view_yview+202)
                else if objPlayer.key_right_direct
                draw_sprite(sprPressScript360,5,view_xview+314+50,view_yview+202)
                else if objPlayer.key_up_direct
                draw_sprite(sprPressScript360,4,view_xview+314+50,view_yview+202)
                else if objPlayer.key_down_direct
                draw_sprite(sprPressScript360,6,view_xview+314+50,view_yview+202)
                else
                draw_sprite(sprPressScript360,14,view_xview+314+50,view_yview+202)
                // A BUTTON
                draw_sprite(sprPressScript360,0,view_xview+314,view_yview+202)
                if objPlayer.path_position>.6 && blink>6
                draw_sprite_blend(sprPressScript360,0,view_xview+314,view_yview+202,bm_add)}
            }
            if  objPlayer.holdtricktime=false{
                draw_sprite(sprReadySign,0,view_xview+220,view_yview+46)
                if global.AComboTime>61
                global.AComboTime=61
                with objCPTime
                instance_destroy()
                with objTrickResult
                instance_destroy()}
            else
            {
                if tcbgalpha<1
                tcbgalpha+=.2
                draw_set_font(global.fntHUDTC);
                draw_set_color(c_white);
                draw_set_halign(fa_left);
                draw_set_blend_mode(bm_add)
                if tcbgzoom<2
                draw_sprite_ext(sprTCBG,1,view_xview+218,view_yview+68,tcbgzoom,tcbgzoom,-tcangle*1.5,c_white,tcbgalpha2)
                draw_sprite_ext(sprTCBG,0,view_xview+218,view_yview+68,1,1,tcangle,c_white,tcbgalpha)
                draw_set_blend_mode(bm_normal)
                draw_sprite(sprTCLogo,0,view_xview+218,view_yview+55)
                draw_number_zero(view_xview+207, view_yview+80, (global.combo)   mod 100, 2);
                if tcalpha<1{
                draw_set_alpha(tcalpha)
                draw_set_blend_mode(bm_add)
                draw_number_zero_transformed(view_xview+207, view_yview+80, (global.combo)   mod 100, 2,tczoom,tczoom);
                draw_sprite_ext(sprTCLogo,0,view_xview+218,view_yview+55,1,1,0,c_white,tcalpha)
                draw_set_blend_mode(bm_normal)
                draw_set_alpha(1)}

            }
        }
        else
        tcbgalpha=0

        if instance_exists(objPlayer)
        if (objPlayer.path_index=pathtrick1 && objPlayer.trickjump=false && global.combocounter>0) || objPlayer.trickbackup=true
        {
            if objPlayer.holdtricktime=true
            {
                global.combocounter=0
                objPlayer.trickbackup=false
            }
        }

        // Draw ButtonJump Stuff
        if instance_exists(objPlayer){
        if objPlayer.buttonjump=true && objPlayer.path_speed=.5{
        draw_set_alpha(alpha)
        draw_rectangle_color(view_xview,view_yview,view_xview+720,view_yview+360,c_black,c_black,c_black,c_black,false)
        draw_set_alpha(1)
        if global.buttonlen=0
        draw_sprite_ext(sprButtonBar,buttontimer,view_xview+263,view_yview+180,1,1,0,c_white,blpha)
        else
        draw_sprite_ext(sprButtonBar2,buttontimer,view_xview+193,view_yview+180,1,1,0,c_white,blpha)

        if global.buttonlen=0{
        if objPlayer.keyloop=0
        draw_sprite_ext(keydraw1,0,view_xview+270,view_yview+150,1,1,0,c_white,blpha)
        if objPlayer.keyloop>=0 && objPlayer.keyloop<2
        draw_sprite_ext(keydraw2,0,view_xview+320,view_yview+150,1,1,0,c_white,blpha)
        if objPlayer.keyloop>=0
        draw_sprite_ext(keydraw3,0,view_xview+370,view_yview+150,1,1,0,c_white,blpha)}

        if global.buttonlen=1{
        var p;
        p=50
        if objPlayer.keyloop=0
        draw_sprite_ext(keydraw1,0,view_xview+270-p,view_yview+150,1,1,0,c_white,blpha)
        if objPlayer.keyloop>=0 && objPlayer.keyloop<2
        draw_sprite_ext(keydraw2,0,view_xview+320-p,view_yview+150,1,1,0,c_white,blpha)
        if objPlayer.keyloop>=0 && objPlayer.keyloop<3
        draw_sprite_ext(keydraw3,0,view_xview+370-p,view_yview+150,1,1,0,c_white,blpha)
        if objPlayer.keyloop>=0 && objPlayer.keyloop<4
        draw_sprite_ext(keydraw4,0,view_xview+420-p,view_yview+150,1,1,0,c_white,blpha)
        if objPlayer.keyloop>=0 && objPlayer.keyloop<5
        draw_sprite_ext(keydraw5,0,view_xview+470-p,view_yview+150,1,1,0,c_white,blpha)}

        }
        else{
        buttontimer=0
        alpha=0
        blpha=0
        }}

        // Draw Side Run Stuff
        /*if instance_exists(objPlayer)
        if objPlayer.action=objPlayer.action_siderun
        {
        if global.xbox=true
            {
            if global.ps3=false
            {
                if objPlayer.key_left_direct
                draw_sprite(sprTrickJ360,1,view_xview+580,view_yview+300)
                else if objPlayer.key_right_direct
                draw_sprite(sprTrickJ360,2,view_xview+580,view_yview+300)
                else if objPlayer.key_up_direct
                draw_sprite(sprTrickJ360,3,view_xview+580,view_yview+300)
                else if objPlayer.key_down_direct
                draw_sprite(sprTrickJ360,4,view_xview+580,view_yview+300)
                else
                draw_sprite(sprTrickJ360,0,view_xview+580,view_yview+300)
            }
            else
            {
                if objPlayer.key_left_direct
                draw_sprite(sprTrickJPS3,1,view_xview+580,view_yview+300)
                else if objPlayer.key_right_direct
                draw_sprite(sprTrickJPS3,2,view_xview+580,view_yview+300)
                else if objPlayer.key_up_direct
                draw_sprite(sprTrickJPS3,3,view_xview+580,view_yview+300)
                else if objPlayer.key_down_direct
                draw_sprite(sprTrickJPS3,4,view_xview+580,view_yview+300)
                else
                draw_sprite(sprTrickJPS3,0,view_xview+580,view_yview+300)
            }
            }
            else
            {
            if objPlayer.key_left_direct
            draw_sprite(sprTrickJKeys,1,view_xview+580,view_yview+300)
            else if objPlayer.key_right_direct
            draw_sprite(sprTrickJKeys,2,view_xview+580,view_yview+300)
            else if objPlayer.key_up_direct
            draw_sprite(sprTrickJKeys,3,view_xview+580,view_yview+300)
            else if objPlayer.key_down_direct
            draw_sprite(sprTrickJKeys,4,view_xview+580,view_yview+300)
            else
            draw_sprite(sprTrickJKeys,0,view_xview+580,view_yview+300)
            }
        }*/

        //SONIC THE HEDGEHOG

        // Boost HUD
        draw_sprite(sprBoostGauge, 0, view_xview+2, view_yview+210);
        if global.hyperboost=0
        draw_sprite_ext(sprGaugeBar, global.boost, view_xview+58, view_yview+221,1,1,0,c_white,.7);

        if global.hyperboost>0{
        draw_sprite_blend_ext(sprCustomGauge,(global.motion_time)*.03, view_xview+58, view_yview+221,1,1,0,c_white,.7,bm_add);
        if hue<255
        hue +=20
        if hue>255
        hue=0

        cul=make_color_hsv(hue,53,255);
        draw_sprite_ext(sprCustomIcon, 0, view_xview+3, view_yview+210,1,1,0,cul,1);
        if rainbscale!=0
        draw_sprite_blend_ext(sprRainbowParticle,0, view_xview+20, view_yview+221,rainbscale,rainbscale,0,c_white,2-rainbscale,bm_add);
        }

        if instance_exists(objPlayer)
        {
            pspd=min((abs(objPlayer.x_speed)+objPlayer.speed)/1.1,16)
            draw_sprite_ext(sprSpeedBar, pspd, view_xview+60, view_yview+213,1,1,0,c_white,.75);
        }

        //Normal HUD
        if global.player="Sonic"
        draw_sprite(sprHUDBars, 0, view_xview, view_yview+15);
        else if global.player="Shadow"
        draw_sprite(sprHUDBars, 1, view_xview, view_yview+15);
        else if global.player="Blaze"
        draw_sprite(sprHUDBars, 2, view_xview, view_yview+15);
        else if global.player="Silver"
        draw_sprite(sprHUDBars, 3, view_xview, view_yview+15);
        else if global.player="Supersonic"
        draw_sprite(sprHUDBars, 4, view_xview, view_yview+15);
        else if global.player="Supershadow"
        draw_sprite(sprHUDBars, 5, view_xview, view_yview+15);

        if global.online_mode=false && global.time_attack=false
        {
            if instance_exists(objPlayer){
            if objPlayer.trickjump=false
            {
                if global.player="Sonic"{
                draw_sprite(sprLifeIcon, 0, view_xview+357, view_yview+212);
                draw_sprite_blend_ext(sprLifeIcon, 0, view_xview+357, view_yview+212,1,1,0,c_white,(drawone-90)/10,bm_add);}
                else if global.player="Shadow"{
                draw_sprite(sprLifeIcon, 1, view_xview+357, view_yview+212);
                draw_sprite_blend_ext(sprLifeIcon, 1, view_xview+357, view_yview+212,1,1,0,c_white,(drawone-90)/10,bm_add);}
                if global.player="Supersonic"{
                draw_sprite(sprLifeIcon, 2, view_xview+357, view_yview+212);
                draw_sprite_blend_ext(sprLifeIcon, 0, view_xview+357, view_yview+212,1,1,0,c_white,(drawone-90)/10,bm_add);}
                else if global.player="Supershadow"{
                draw_sprite(sprLifeIcon, 3, view_xview+357, view_yview+212);
                draw_sprite_blend_ext(sprLifeIcon, 1, view_xview+357, view_yview+212,1,1,0,c_white,(drawone-90)/10,bm_add);}
            }}
            else
            {
                if global.player="Sonic"{
                draw_sprite(sprLifeIcon, 0, view_xview+357, view_yview+212);
                draw_sprite_blend_ext(sprLifeIcon, 0, view_xview+357, view_yview+212,1,1,0,c_white,(drawone-90)/10,bm_add);}
                else if global.player="Shadow"{
                draw_sprite(sprLifeIcon, 1, view_xview+357, view_yview+212);
                draw_sprite_blend_ext(sprLifeIcon, 1, view_xview+357, view_yview+212,1,1,0,c_white,(drawone-90)/10,bm_add);}
                if global.player="Supersonic"{
                draw_sprite(sprLifeIcon, 2, view_xview+357, view_yview+212);
                draw_sprite_blend_ext(sprLifeIcon, 0, view_xview+357, view_yview+212,1,1,0,c_white,(drawone-90)/10,bm_add);}
                else if global.player="Supershadow"{
                draw_sprite(sprLifeIcon, 3, view_xview+357, view_yview+212);
                draw_sprite_blend_ext(sprLifeIcon, 1, view_xview+357, view_yview+212,1,1,0,c_white,(drawone-90)/10,bm_add);}
            }
        }

        if emget<13
        emget+=.4

        var r; r=0
        if global.online_mode=false
        for(i=0;i<7;i+=1){
        draw_sprite(sprEmeraldIcon, global.emeralds[i], view_xview+6+r, view_yview+74);
        r+=15}

        if emget<13
        draw_sprite(sprEmeraldGetIcon, emget, view_xview+6+empos, view_yview+74);

        blink-=1
        if blink=0
        blink=10

        // Draw HUD counters
        if room=rmHUB || room=rmTRAIN && blink<6
        bcolor=c_yellow
        else
        bcolor=c_white

        draw_set_color(bcolor);
        if global.player="Shadow"
        draw_set_font(global.fntHUDShad);
        else
        draw_set_font(global.fntHUD);

        draw_set_halign(fa_left);
        global.millis=draw_number_zero(view_xview+87, view_yview+31, (global.game_time div 10)    mod 100, 2);    // Milliseconds
        global.secs=draw_number_zero(view_xview+66, view_yview+31,  (global.game_time div 1000)  mod 60,  2);    // Seconds
        global.mins=draw_number_zero(view_xview+45, view_yview+31,  (global.game_time div 60000) mod 100,  2);    // Minutes

        if global.player="Shadow" || global.player="Supershadow"
        fntc=sprHUDFontShad
        else
        fntc=sprHUDFont
        draw_sprite_ext(fntc,10,view_xview+63, view_yview+32,1,1,0,bcolor,1) // :
        draw_sprite_ext(fntc,10,view_xview+84, view_yview+32,1,1,0,bcolor,1) // :
        draw_set_color(c_white);

        draw_number_zero(view_xview+45, view_yview+61, global.Score, 7);   // Score

        draw_set_font(global.fntHUD2);
        draw_number_zero(view_xview+37, view_yview+221, global.Rings, 3);   // Rings

        draw_set_font(global.fntHUD3);

        if global.online_mode=false
        {
            if global.time_attack=false
            {
                if instance_exists(objPlayer)
                {
                    if objPlayer.trickjump=false
                    {
                        draw_number_zero(view_xview+382, view_yview+220, max(lives,0),  2);    // Lives number
                    }
                }
                else
                draw_number_zero(view_xview+382, view_yview+220, max(lives,0),  2);
            }
        }
        else
        {
            if global.HUB=false
            {
                if global.stoptime=false
                global.online_place=online_instance_range_count();
                if instance_exists(objPlayer)
                {
                    if objPlayer.trickjump=false
                    draw_sprite(sprOnlinePlace,max(global.online_place-1,0),view_xview+392,view_yview+220)
                }
                else
                {
                    draw_sprite(sprOnlinePlace,max(global.online_place-1,0),view_xview+392,view_yview+220)
                }
            }
        }

        //draw_text(view_xview+600,view_yview+60,string(fps))            //FPS

        //BOSS HUD
        if global.BOSS=true{
        if !instance_exists(objRotateBG)
        if bossgrow>0
        bossgrow-=2

        draw_sprite(sprBossHUD,0,view_xview[0]+196,view_yview[0]+18)
        if bossdamage2<173 && bossgrow=0
        draw_rectangle_color(view_xview[0]+207+floor(bossdamage2),view_yview[0]+29,view_xview[0]+207+173,view_yview[0]+29+4,c_red,c_red,c_red,c_red,0)
        if global.bossdamage<173 && bossgrow<174
        draw_sprite_stretched(sprBossLifeBar,0,view_xview[0]+207+floor(global.bossdamage+bossgrow),view_yview[0]+29,174-floor(global.bossdamage+bossgrow),5)
        if global.bossdamage<173 && bossgrow<174
        draw_sprite(sprBossLifeBar,1,view_xview[0]+207+floor(global.bossdamage+bossgrow),view_yview[0]+29)

            if instance_exists(objBossHitArea)
            {
            if ((!instance_exists(objBossCont) && global.bossdamage<(174/global.boss_life)*(global.boss_life/2)) || (instance_exists(objBossCont) && global.bossdamage<(174/global.boss_life)*(global.boss_life/3))) && bossgrow=0
            draw_sprite(sprBossPhaseBar,0,view_xview[0]+335,view_yview[0]+39)
            if global.bossdamage<(174/global.boss_life)*(global.boss_life-(global.boss_life/3)) && bossgrow<174/2
            draw_sprite(sprBossPhaseBar,0,view_xview[0]+350,view_yview[0]+39)
            if global.bossdamage<173 && bossgrow<174
            draw_sprite(sprBossPhaseBar,0,view_xview[0]+365,view_yview[0]+39)
            }
        }

        if global.AComboTime>61
        moved=50
        else
        moved=0

        if floor(qte)=1{
        add=1
        c=make_color_rgb(0,216,255)}
        else{
        add=0
        c=c_white}

        // Duck Sign
        if instance_exists(objPlayer) && instance_exists(objPSDuck)
        {
        d=instance_nearest(objPlayer.x,objPlayer.y,objPSDuck)
        with objPlayer
        other.impact=distance_to_point(other.d.x,other.d.y)/6
        with objPlayer
        if distance_to_point(other.d.x,other.d.y)<600+(x_speed*5) && y>other.d.y && x<other.d.x && x_speed>3 && other.d.noprompt=false
        {
        global.lookahead=true
        with other{
        if bleepsign=false{sound_play(sndMenuWarning)bleepsign=true}
            if global.xbox=false{
            draw_sprite_ext(sprQTEFlash,0,view_xview+(view_wview/2-15)+15,view_yview+64+moved,(qte+.2)*1.5,(qte+.2)*1.5,0,c_white,1.2-qte)
            draw_sprite_ext(sprQTEBoard,floor(qte),view_xview+(view_wview/2-15),view_yview+50+moved,1,1,0,c_white,1)
            draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_down2),view_xview+(view_wview/2-15)+4,view_yview+50+2+add+moved,1,1,0,c,1)}
            else{
            draw_sprite_ext(sprQTEFlash,0,view_xview+(view_wview/2-15)+16,view_yview+64+moved,(qte+.2)*1.5,(qte+.2)*1.5,0,c_white,1.2-qte)
            draw_sprite_ext(sprPressScript360,1,view_xview+(view_wview/2-15)+4,view_yview+50+2+add+moved,1,1,0,c_white,1)
            if add=1
            draw_sprite_blend_ext(sprPressScript360,1,view_xview+(view_wview/2-15)+4,view_yview+50+2+add+moved,1,1,0,c_white,1,bm_add)}
            draw_sprite_ext(sprQTEBar,0,view_xview+177,view_yview+84+moved,1,1,0,c_white,1)
            draw_sprite_ext(sprQTEBar2,0,view_xview+177+62,view_yview+85+moved,max(min(impact,100),0)/100,1,0,c_white,1)
        }
        }
        else
        {
            global.lookahead=false with other bleepsign=false
        }
        }

        // Boost Sign
        if instance_exists(objPlayer) && instance_exists(objPSBoostLine)
        {
            v=instance_nearest(objPlayer.x,objPlayer.y,objPSBoostLine)
            with objPlayer
                other.impact=distance_to_point(other.v.x,other.v.y)/10
            with objPlayer
            if distance_to_point(other.v.x,other.v.y)<1000+(x_speed*5) && y>other.v.y && y<other.v.y+100 && x<other.v.x && x_speed>3
            {
                global.lookahead2=true
                with other
                {
                    if bleepsign2=false
                    {
                        sound_play(sndMenuWarning)bleepsign2=true
                    }
                    if global.xbox=false
                    {
                        draw_sprite_ext(sprQTEFlash,0,view_xview+(view_wview/2-15)+15,view_yview+64+moved,(qte+.2)*1.5,(qte+.2)*1.5,0,c_white,1.2-qte)
                        draw_sprite_ext(sprQTEBoard,floor(qte),view_xview+(view_wview/2-15),view_yview+50+moved,1,1,0,c_white,1)
                        draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_s),view_xview+(view_wview/2-15)+4,view_yview+50+2+add+moved,1,1,0,c,1)
                    }
                    else
                    {
                        draw_sprite_ext(sprQTEFlash,0,view_xview+(view_wview/2-15)+16,view_yview+64+moved,(qte+.2)*1.5,(qte+.2)*1.5,0,c_white,1.2-qte)
                        draw_sprite_ext(sprPressScript360,2,view_xview+(view_wview/2-15)+4,view_yview+50+2+add+moved,1,1,0,c_white,1)
                        if add=1
                            draw_sprite_blend_ext(sprPressScript360,2,view_xview+(view_wview/2-15)+4,view_yview+50+2+add+moved,1,1,0,c_white,1,bm_add)
                    }
                    draw_sprite_ext(sprQTEBar,0,view_xview+177,view_yview+84+moved,1,1,0,c_white,1)
                    draw_sprite_ext(sprQTEBar2,0,view_xview+177+62,view_yview+85+moved,max(min(impact,100),0)/100,1,0,c_white,1)
                }
            }
            else
            {
                global.lookahead2=false with other bleepsign2=false
            }
        }

        // Walljump Sign
        if instance_exists(objPlayer) && global.wjstart=false
        {
            if objPlayer.action=objPlayer.action_walljump
            if global.xbox=false
            {
                draw_sprite_ext(sprQTEFlash,0,view_xview+(view_wview/2-15)+15,view_yview+64+moved,(qte+.2)*1.5,(qte+.2)*1.5,0,c_white,1.2-qte)
                draw_sprite_ext(sprQTEBoard,floor(qte),view_xview+(view_wview/2-15),view_yview+50+moved,1,1,0,c_white,1)
                draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_a),view_xview+(view_wview/2-15)+4,view_yview+50+2+add+moved,1,1,0,c,1)
            }
            else
            {
                draw_sprite_ext(sprQTEFlash,0,view_xview+(view_wview/2-15)+16,view_yview+64+moved,(qte+.2)*1.5,(qte+.2)*1.5,0,c_white,1.2-qte)
                draw_sprite_ext(sprPressScript360,0,view_xview+(view_wview/2-15)+4,view_yview+50+2+add+moved,1,1,0,c_white,1)
                if add=1
                draw_sprite_blend_ext(sprPressScript360,0,view_xview+(view_wview/2-15)+4,view_yview+50+2+add+moved,1,1,0,c_white,1,bm_add)
            }
        }
        // Duck Sign Alt.
        if instance_exists(objPlayer) && global.duckstart=false
        {
            if instance_exists(objTrigger_Duck)
            if global.xbox=false
            {
                draw_sprite_ext(sprQTEFlash,0,view_xview+(view_wview/2-15)+15,view_yview+64+moved,(qte+.2)*1.5,(qte+.2)*1.5,0,c_white,1.2-qte)
                draw_sprite_ext(sprQTEBoard,floor(qte),view_xview+(view_wview/2-15),view_yview+50+moved,1,1,0,c_white,1)
                draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_down2),view_xview+(view_wview/2-15)+4,view_yview+50+2+add+moved,1,1,0,c,1)
            }
            else
            {
                draw_sprite_ext(sprQTEFlash,0,view_xview+(view_wview/2-15)+16,view_yview+64+moved,(qte+.2)*1.5,(qte+.2)*1.5,0,c_white,1.2-qte)
                draw_sprite_ext(sprPressScript360,1,view_xview+(view_wview/2-15)+4,view_yview+50+2+add+moved,1,1,0,c_white,1)
                if add=1
                draw_sprite_blend_ext(sprPressScript360,1,view_xview+(view_wview/2-15)+4,view_yview+50+2+add+moved,1,1,0,c_white,1,bm_add)
            }
        }

     }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Action Chain
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.ACombo<4{
draw_set_font(global.fntHUDAC);
resframe=0}
else if global.ACombo<10{
draw_set_font(global.fntHUDAC2);
resframe=1}
else{
draw_set_font(global.fntHUDAC3);
resframe=2}

if global.ACombo>0 // Start The Combo Logos N Numbers
{
    //Boards
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(sprHUDActionChainB,0,view_xview+119,view_yview+21,1,1,0,c_white,acnumalpha)
    draw_set_blend_mode(bm_normal)
    draw_sprite_ext(sprHUDActionChainB,1,view_xview+119,view_yview+21,1,1,0,c_white,acnumalpha)

    //Arrow
    if acnumalpha=1
    draw_sprite_ext(sprHUDActionChainA,0,view_xview+310-arrowspd,view_yview+21,1,1,0,c_white,(1-(arrowspd-80)/90))

    draw_sprite_ext(sprHUDActionChainB2,0,view_xview+271,view_yview+51,1,1,0,c_white,acnumalpha)

    //Results
    draw_sprite_ext(sprHUDActionChainR,resframe,view_xview+(160-respd),view_yview+54,1,1,0,c_white,acnumalpha)
    draw_set_blend_mode(bm_add)
    if (global.ACombo=4 || global.ACombo=10) && acnumalpha=1
    draw_sprite_ext(sprHUDActionChainR,resframe,view_xview+160,view_yview+54,1,1,0,c_white,global.acflash)
    draw_set_blend_mode(bm_normal)

    //Energy Sprite
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(sprHUDActionChainS,global.motion_time div 30,view_xview+148,view_yview+43,1,1,0,c_white,acnumalpha)
    draw_set_blend_mode(bm_normal)

    //Combo Numbers
    for (i=0;i<12;i+=1){
    if global.AComboTime>60
    draw_sprite_ext(sprHUDActionChain,i,view_xview+245,view_yview+39,acsize[i],acsize[i],0,c_white,acalpha-(i/2))
    else
    draw_sprite_ext(sprHUDActionChain,i,view_xview+245,view_yview+39,acsize[i],acsize[i],0,c_white,acalpha)}
    if global.AComboTime>60
    draw_sprite_ext(sprHUDActionChain,12,view_xview+245,view_yview+39,aclogos,aclogos,0,c_white,aclogoa)
    draw_sprite_ext(sprHUDActionChain,13,view_xview+245,view_yview+39,1,1,0,c_white,aclogoa2)
    draw_set_alpha(acnumalpha)
    draw_number_zero(view_xview+267, view_yview+48, global.ACombo, 2);   // Action Chain

    //Flash Effect
    if global.ACombo>3{
    draw_set_alpha(global.acflash)
    draw_set_blend_mode(bm_add)
    draw_number_zero(view_xview+267, view_yview+48, global.ACombo, 2);   // Action Chain
    draw_set_blend_mode(bm_normal)}

    //Zoom Effect
    if acflash2<1 && global.ACombo>3{
    draw_set_alpha(acflash2)
    draw_set_blend_mode(bm_add)
    draw_number_zero_transformed(view_xview+267, view_yview+48, global.ACombo, 2,aczoom,aczoom);   // Action Chain
    draw_set_blend_mode(bm_normal)}
    draw_set_alpha(1)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Online HUD
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var dis_div, inst, icon_play, dark;

if global.online_mode=true && room!=rmHUB{
draw_sprite(sprGoalBar,0,view_xview+150,view_yview+2)

if instance_exists(objPlayer)
player_pos=objPlayer.x
//if instance_exists(objPlayerOn)
//other_player_pos=objPlayerOn.x
/*
//CHECK WHOS IN FRONT
if instance_exists(objPlayer) && instance_exists(objGoal) && instance_exists(objPlayerOn)
{

}

// PLAYER UNDER LAYER
if instance_exists(objPlayer) && instance_exists(objGoal)
{
        goal_dis=(objGoal.x-objPlayer.x)
        dis_div=objGoal.x/228
        if global.player="Sonic"
        icon_play=0
        else
        icon_play=1
        draw_sprite_ext(sprGoalIcons,icon_play,view_xview+155+floor(max(min((objGoal.x-goal_dis)/dis_div,228),0)),view_yview+12,1,1,0,c_white,1)
}
*/
// OTHER PLAYER
if instance_exists(objGoal)
{
        for (i=0; i<gms_other_count(); i+=1)
        {
        inst = gms_other_find(i);
        goal_dis=(objGoal.x-gms_other_get(inst,"x"))
        dis_div=objGoal.x/228

        if gms_other_get(inst,"global.player")="Sonic"
        icon_play=0
        else
        icon_play=1

        if (icon_play=0 && global.player="Sonic") || (icon_play=1 && global.player="Shadow")
        dark=merge_color(c_white,c_black,.5)
        else
        dark=c_white

        draw_sprite_ext(sprGoalIcons,icon_play,view_xview+155+floor(max(min((objGoal.x-goal_dis)/dis_div,228),0)),view_yview+12,1,1,0,dark,1)
        }

//PLAYER
        goal_dis=(objGoal.x-player_pos)
        dis_div=objGoal.x/228
        if global.player="Sonic"
        icon_play=0
        else
        icon_play=1
        draw_sprite_ext(sprGoalIcons,icon_play,view_xview+155+floor(max(min((objGoal.x-goal_dis)/dis_div,228),0)),view_yview+12,1,1,0,c_white,1)
}

}

/*
var inst, i, maxinsts, total;
maxinsts = gms_other_count();
total = 0;
for (i=0; i<maxinsts+1; i+=1) {
  inst = gms_other_find(i);
  if (gms_other_get(inst,"x")>objPlayer.x){
    total += 1;
  }
}
