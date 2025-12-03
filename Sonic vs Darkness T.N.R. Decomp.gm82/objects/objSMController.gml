#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
close=0
x+=5
y-=72
global.payout=0
global.youbet=5
loop=false
bet=true
paying=false
paytime=1
getpayout=0
rollA=instance_create(x,y,objSMRoller);
rollB=instance_create(x+115+15,y,objSMRoller);
rollC=instance_create(x+230+30,y,objSMRoller);

stoponce=false
stoponce2=false
stoponce3=false

rollA.push=0
rollB.push=20
rollC.push=40

stopper=0;
done=false
stopped=false
jack=false
seven=false
emerald=false
ring=false

mid=false
top=false
bottom=false
dia=false
dia2=false

even=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if rollC.truestop=2 && stoponce3=false{
stoponce=false
stoponce3=true}
if rollB.truestop=2 && stoponce2=false{
stoponce=false
stoponce2=true}
if rollA.truestop=2 && stoponce=false{
stoponce=true
sound_play(sndSMLever)
if rollB.truestop=2
even=5}

if stopped=true && done=false && rollA.truestop=2 && rollB.truestop=2 && rollC.truestop=2
{
    sound_stop(sndSMReel)
    //mid
    if rollA.choice2=rollB.choice2 && rollB.choice2=rollC.choice2 && mid=false && !instance_exists(objSMGOTIT) && bet=false && objSMPull.visible=false
    {
        jack=true
        //Seven
        if (rollA.choice2=sprSM7 && rollB.choice2=sprSM7){
        seven=true
        if global.youbet=5
        global.payout+=900
        else if global.youbet=10
        global.payout+=600
        else
        global.payout+=300}
        //Emerald
        if (rollA.choice2=sprSME && rollB.choice2=sprSME){
        emerald=true
        if global.youbet=5
        global.payout+=450
        else if global.youbet=10
        global.payout+=300
        else
        global.payout+=150}
        //Leaf
        if (rollA.choice2=sprSMLE && rollB.choice2=sprSMLE){
        if global.youbet=5
        global.payout+=240
        else if global.youbet=10
        global.payout+=160
        else
        global.payout+=80}
        //BAR
        if (rollA.choice2=sprSMB && rollB.choice2=sprSMB){
        if global.youbet=5
        global.payout+=150
        else if global.youbet=10
        global.payout+=100
        else
        global.payout+=50}
        //Ring
        if (rollA.choice2=sprSMR && rollB.choice2=sprSMR){
        ring=true
        if global.youbet=5
        global.payout+=150
        else if global.youbet=10
        global.payout+=100
        else
        global.payout+=50}
        //Lemon
        if (rollA.choice2=sprSML && rollB.choice2=sprSML){
        if global.youbet=5
        global.payout+=60
        else if global.youbet=10
        global.payout+=40
        else
        global.payout+=20}

        instance_create(x,y+200,objSMGOTIT)
        instance_create(x+130,y+200,objSMGOTIT)
        instance_create(x+260,y+200,objSMGOTIT)
        mid=true
    }
    //top
    if rollA.choice1=rollB.choice1 && rollB.choice1=rollC.choice1 && top=false && !instance_exists(objSMGOTIT) && global.youbet>5 && bet=false && objSMPull.visible=false
    {
        jack=true
        if (rollA.choice1=sprSM7 && rollB.choice1=sprSM7){
        seven=true
        if global.youbet=10
        global.payout+=600
        else
        global.payout+=300}
        //Emerald
        if (rollA.choice1=sprSME && rollB.choice1=sprSME){
        emerald=true
        if global.youbet=10
        global.payout+=300
        else
        global.payout+=150}
        //Leaf
        if (rollA.choice1=sprSMLE && rollB.choice1=sprSMLE){
        if global.youbet=10
        global.payout+=160
        else
        global.payout+=80}
        //BAR
        if (rollA.choice1=sprSMB && rollB.choice1=sprSMB){
        if global.youbet=10
        global.payout+=100
        else
        global.payout+=50}
        //Ring
        if (rollA.choice1=sprSMR && rollB.choice1=sprSMR){
        ring=true
        if global.youbet=10
        global.payout+=100
        else
        global.payout+=50}
        //Lemon
        if (rollA.choice1=sprSML && rollB.choice1=sprSML){
        if global.youbet=20
        global.payout+=40
        else
        global.payout+=20}
        instance_create(x,y+100,objSMGOTIT)
        instance_create(x+130,y+100,objSMGOTIT)
        instance_create(x+260,y+100,objSMGOTIT)
        top=true
    }
    //bottom
    if rollA.choice3=rollB.choice3 && rollB.choice3=rollC.choice3 && bottom=false && !instance_exists(objSMGOTIT) && global.youbet>5 && bet=false && objSMPull.visible=false
    {
        jack=true
        if (rollA.choice3=sprSM7 && rollB.choice3=sprSM7){
        seven=true
        if global.youbet=10
        global.payout+=600
        else
        global.payout+=300}
        //Emerald
        if (rollA.choice3=sprSME && rollB.choice3=sprSME){
        emerald=true
        if global.youbet=10
        global.payout+=300
        else
        global.payout+=150}
        //Leaf
        if (rollA.choice3=sprSMLE && rollB.choice3=sprSMLE){
        if global.youbet=10
        global.payout+=160
        else
        global.payout+=80}
        //BAR
        if (rollA.choice3=sprSMB && rollB.choice3=sprSMB){
        if global.youbet=10
        global.payout+=100
        else
        global.payout+=50}
        //Ring
        if (rollA.choice3=sprSMR && rollB.choice3=sprSMR){
        ring=true
        if global.youbet=10
        global.payout+=100
        else
        global.payout+=50}
        //Lemon
        if (rollA.choice3=sprSML && rollB.choice3=sprSML){
        if global.youbet=10
        global.payout+=40
        else
        global.payout+=20}
        instance_create(x,y+300,objSMGOTIT)
        instance_create(x+130,y+300,objSMGOTIT)
        instance_create(x+260,y+300,objSMGOTIT)
        bottom=true
    }
    // diagnol left
    if ((rollA.choice1=rollB.choice2 && rollB.choice2=rollC.choice3)) && dia=false && !instance_exists(objSMGOTIT) && global.youbet>10 && bet=false && objSMPull.visible=false
    {
        jack=true
        if (rollA.choice1=sprSM7 && rollB.choice2=sprSM7) || (rollC.choice1=sprSM7 && rollB.choice2=sprSM7){
        seven=true
        global.payout+=300}
        //Emerald
        if (rollA.choice1=sprSME && rollB.choice2=sprSME) || (rollC.choice1=sprSME && rollB.choice2=sprSME){
        emerald=true
        global.payout+=150}
        //Leaf
        if (rollA.choice1=sprSMLE && rollB.choice2=sprSMLE) || (rollC.choice1=sprSMLE && rollB.choice2=sprSMLE){
        global.payout+=80}
        //BAR
        if (rollA.choice1=sprSMB && rollB.choice2=sprSMB) || (rollC.choice1=sprSMB && rollB.choice2=sprSMB){
        global.payout+=50}
        //Ring
        if (rollA.choice1=sprSMR && rollB.choice2=sprSMR) || (rollC.choice1=sprSMR && rollB.choice2=sprSMR){
        ring=true
        global.payout+=50}
        //Lemon
        if (rollA.choice1=sprSML && rollB.choice2=sprSML) || (rollC.choice1=sprSML && rollB.choice2=sprSML){
        global.payout+=20}
        instance_create(x+130,y+200,objSMGOTIT)
        instance_create(x,y+100,objSMGOTIT)
        instance_create(x+260,y+300,objSMGOTIT)
        dia=true
    }
    //diagnol right
    if ((rollA.choice3=rollB.choice2 && rollB.choice2=rollC.choice1)) && dia2=false && !instance_exists(objSMGOTIT) && global.youbet>10 && bet=false && objSMPull.visible=false
    {
        jack=true
        if (rollA.choice1=sprSM7 && rollB.choice2=sprSM7) || (rollC.choice1=sprSM7 && rollB.choice2=sprSM7){
        seven=true
        global.payout+=300}
        //Emerald
        if (rollA.choice1=sprSME && rollB.choice2=sprSME) || (rollC.choice1=sprSME && rollB.choice2=sprSME){
        emerald=true
        global.payout+=150}
        //Leaf
        if (rollA.choice1=sprSMLE && rollB.choice2=sprSMLE) || (rollC.choice1=sprSMLE && rollB.choice2=sprSMLE){
        global.payout+=80}
        //BAR
        if (rollA.choice1=sprSMB && rollB.choice2=sprSMB) || (rollC.choice1=sprSMB && rollB.choice2=sprSMB){
        global.payout+=50}
        //Ring
        if (rollA.choice1=sprSMR && rollB.choice2=sprSMR) || (rollC.choice1=sprSMR && rollB.choice2=sprSMR){
        ring=true
        global.payout+=50}
        //Lemon
        if (rollA.choice1=sprSML && rollB.choice2=sprSML) || (rollC.choice1=sprSML && rollB.choice2=sprSML){
        global.payout+=20}
        instance_create(x+130,y+200,objSMGOTIT)
        instance_create(x,y+300,objSMGOTIT)
        instance_create(x+260,y+100,objSMGOTIT)
        dia2=true
    }
    if jack=true{
    if seven=true || emerald=true{
    sound_play(sndBigPrize)
    if seven=true
    instance_create(0,0,objSMLucky)
    emerald=false
    seven=false}
    else if ring=true{
    sound_play(sndRingDeluxe)
    ring=false}
    else
    sound_play(sndLeafToken)
    paying=true
    jack=false
    getpayout=global.payout}
}

if stopped=false
done=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if paying=true && !instance_exists(objSMGOTIT)
{
paytime-=1
if paytime=0 && global.payout>0{
sound_stop(sndSMPayout)
sound_play(sndSMPayout)
if getpayout>=200 && global.payout>100{
global.payout-=50
global.money+=50
}
else{
global.payout-=10
global.money+=10}
paytime=5}
if global.payout=0{
paying=false
bet=true
getpayout=0}
}

if stopped=true && done=false && rollA.truestop=2 && rollB.truestop=2 && rollC.truestop=2 && !instance_exists(objSMGOTIT)
if global.payout=0 && bet=false && objSMPull.visible=false{
sound_play(sndMenuBlocked2)
bet=true}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var b;
if rollA.choice1 = rollB.choice2
close=rollA.choice1
if rollA.choice3 = rollB.choice2
close=rollA.choice3
if rollA.choice1 = rollB.choice1
close=rollA.choice1
if rollA.choice3 = rollB.choice3
close=rollA.choice3
if rollA.choice2 = rollB.choice2
close=rollA.choice2

if close=sprSM7
b=4
else if close=sprSME
b=3
else
b=3
if close!=0 && loop=true{
for (i=0;i<44;i+=b){
rollC.sprA[i]=close
i+=choose(1,0,0)
}
loop=false
}
#define KeyPress_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bet=true{
instance_create(0,0,objWhiteFlash)
global.arcade=false
global.HUB=true
instance_create(0,0,objSaving)
room_goto(rmHUBArcade)}
#define KeyPress_38
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if paying=false && rollA.truestop=2 && rollB.truestop=2 && rollC.truestop=2 && bet=true{
if global.youbet=5{
global.youbet=10
sound_play(sndMenuCursor3)}
else if global.youbet=10{
global.youbet=20
sound_play(sndMenuCursor3)}}
#define KeyPress_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if paying=false && rollA.truestop=2 && rollB.truestop=2 && rollC.truestop=2 && bet=true{
if global.youbet=20{
global.youbet=10
sound_play(sndMenuCursor3)}
else if global.youbet=10{
global.youbet=5
sound_play(sndMenuCursor3)}}
#define KeyPress_65
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.money>=global.youbet{
if bet=true{
objSMPull.visible=true
sound_play(sndSMBet)
global.money-=global.youbet
bet=false}}
else
sound_play(sndMenuBlocked2)
#define KeyRelease_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


switch(stopper){
case 0:
if rollA.truestop=2 && rollB.truestop=2 && rollC.truestop=2 && bet=false && paying=false{
objSMPull.visible=false
with(objSMRoller){stop=false;ypow=25;yneg=-10}
stopper=1
stopped=false
sound_stop(sndSMReel)
sound_loop(sndSMReel)}
break;
case 1:
stoponce=false
stoponce2=false
stoponce3=false
mid=false
top=false
bottom=false
dia=false
dia2=false
rollA.stop=true;
rollB.ypow=30;
rollC.ypow=30;
stopper=2
break;
case 2:
rollB.stop=true;
rollC.ypow=40;
stopper=3
break;
case 3:
loop=true
rollC.stop=true;
stopped=true
stopper=0;
break;
}
