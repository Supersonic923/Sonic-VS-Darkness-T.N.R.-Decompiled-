#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=120
y=56
x2=120
y2=56

xm=0
ym=0

xplace=120
yplace=56

lag=-1

slow=0
slow2=0

alpha=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Item Sensor
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xplace=120 && yplace=56
global.imhover=1
if xplace=187 && yplace=56
global.imhover=2
if xplace=254 && yplace=56
global.imhover=3
if xplace=321 && yplace=56
global.imhover=4
if xplace=388 && yplace=56
global.imhover=5
if xplace=455 && yplace=56
global.imhover=6

if xplace=120 && yplace=130
global.imhover=7
if xplace=187 && yplace=130
global.imhover=8
if xplace=254 && yplace=130
global.imhover=9
if xplace=321 && yplace=130
global.imhover=10
if xplace=388 && yplace=130
global.imhover=11
if xplace=455 && yplace=130
global.imhover=12

if xplace=120 && yplace=205
global.imhover=13
if xplace=187 && yplace=205
global.imhover=14
if xplace=254 && yplace=205
global.imhover=15
if xplace=321 && yplace=205
global.imhover=16
if xplace=388 && yplace=205
global.imhover=17
if xplace=455 && yplace=205
global.imhover=18
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Pricing
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.imhover=1 || global.imhover=2 || global.imhover=3 || global.imhover=4{

if global.imhover=1{
if global.buy1=1
global.imapply=1
else
global.imapply=0
//global.gsdisplay=sprSalomChao
}
if global.imhover=2{
if global.buy2=1
global.imapply=2
else
global.imapply=0
//global.gsdisplay=sprVerminChao
}
if global.imhover=3{
if global.buy3=1
global.imapply=3
else
global.imapply=0
//global.gsdisplay=sprSonicChao
}
if global.imhover=4{
if global.buy4=1
global.imapply=4
else
global.imapply=0
//global.gsdisplay=sprShadowChao
}
}

if global.imhover=5{
if global.buy5=1
global.imapply=5
else
global.imapply=0
//global.gsdisplay=sprDarkChao
}

if global.imhover=6{
if global.buy6=1
global.imapply=5
else
global.imapply=0
//global.gsdisplay=sprAngelChao
}

if global.imhover=7{
if global.buy7=1
global.imapply=5
else
global.imapply=0
//global.gsdisplay=sprGSRRing
}

if global.imhover=8{
if global.buy8=1
global.imapply=5
else
global.imapply=0
//global.gsdisplay=sprGSRTime
}

if global.imhover=9{
if global.buy9=1
global.imapply=5
else
global.imapply=0
//global.gsdisplay=sprGSLife
}

if global.imhover=10{
if global.buy10=1
global.imapply=5
else
global.imapply=0
//global.gsdisplay=sprGSCheck
}

if global.imhover=11{
if global.buy11=1
global.imapply=5
else
global.imapply=0
//global.gsdisplay=sprGSHype
}

if global.imhover=12{
if global.buy12=1
global.imapply=5
else
global.imapply=0
//global.gsdisplay=sprGSTarget
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.imhover=13{
if global.buy13=1
global.imapply=1
else
global.imapply=0
//global.gsdisplay=sprSalomChao
}
if global.imhover=14{
if global.buy14=1
global.imapply=1
else
global.imapply=0
//global.gsdisplay=sprVerminChao
}
if global.imhover=15{
if global.buy15=1
global.imapply=2
else
global.imapply=0
//global.gsdisplay=sprSonicChao
}
if global.imhover=16{
if global.buy16=1
global.imapply=3
else
global.imapply=0
//global.gsdisplay=sprShadowChao
}

if global.imhover=17{
if global.buy17=1
global.imapply=4
else
global.imapply=0
//global.gsdisplay=sprDarkChao
}

if global.imhover=18{
if global.buy18=1
global.imapply=5
else
global.imapply=0
//global.gsdisplay=sprAngelChao
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Desc
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
                                                              ////




if global.imhover=1 && global.buy1=1
global.imtext="This is a chao version of Salom the hedgehog.
Each character chao has it's own unique
abilities pertaining to the player."
else if global.imhover=1
global.imtext="This item has not been purchased."

if global.imhover=2 && global.buy2=1
global.imtext="This is a chao version of Vermin the hedgehog.
Each character chao has it's own unique
abilities pertaining to the player."
else if global.imhover=2
global.imtext="This item has not been purchased."

if global.imhover=3 && global.buy3=1
global.imtext="This is a chao version of Sonic the hedgehog.
Each character chao has it's own unique
abilities pertaining to the player."
else if global.imhover=3
global.imtext="This item has not been purchased."

if global.imhover=4 && global.buy4=1
global.imtext="This is a chao version of Shadow the hedgehog.
Each character chao has it's own unique
abilities pertaining to the player."
else if global.imhover=4
global.imtext="This item has not been purchased."

if global.imhover=5 && global.buy5=1
global.imtext="A chao full of evil. With this chao by your side,
enemies will fear your power, however there
is a small chance of  bad luck occuring.
Be cautious."
else if global.imhover=5
global.imtext="This item has not been purchased."

if global.imhover=6 && global.buy6=1
global.imtext="A chao full of good. With this chao by your side,
you'll be supplied with necessities, however
there is a small cost for each action taken
by this chao. Be vigilant."
else if global.imhover=6
global.imtext="This item has not been purchased."

if global.imhover=7 && global.buy7=1
global.imtext="In the beginning of a level, you will receive
a random amount of rings ranging from 10 to 50.
This also happens after losing a life."
else if global.imhover=7
global.imtext="This item has not been purchased."

if global.imhover=8 && global.buy8=1
global.imtext="When rings scatter, the time to recollect them
all is extended to 10 seconds."
else if global.imhover=8
global.imtext="This item has not been purchased."

if global.imhover=9 && global.buy9=1
global.imtext="An extra life is awarded to you after running
out of lives. This only happens once per level.
However restarting will cause this
action to reset."
else if global.imhover=9
global.imtext="This item has not been purchased."

if global.imhover=10 && global.buy10=1
global.imtext="Once you lose a life and continue at checkpoint,
30 seconds is subtracted from the timer.
This only happens once per level. However
restarting will cause this action to reset."
else if global.imhover=10
global.imtext="This item has not been purchased."

if global.imhover=11 && global.buy11=1
global.imtext="With this equipped, you will stay in hyper mode
throughout the level. It'll also keep the
hyper gauge from draining."
else if global.imhover=11
global.imtext="This item has not been purchased."

if global.imhover=12 && global.buy12=1
global.imtext="A more advance version of the original Target
Locker. Each player has their own custom color.
The lock-on sound is also changed."
else if global.imhover=12
global.imtext="This item has not been purchased."
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
                                                              ////




if global.imhover=13 && global.buy13=1
global.imtext="Equip this item to unlock the Surfing Challenge.
In order to play it, you must go through
the stage entrance at the beach."
else if global.imhover=13
global.imtext="This item has not been purchased."

if global.imhover=14 && global.buy14=1
global.imtext="Equip this emerald to perform a special attack
on a stage. Press the D Key to
use a Sol Wind attack."
else if global.imhover=14
global.imtext="This item has not been purchased."

if global.imhover=15 && global.buy15=1
global.imtext="Equip this emerald to perform a special attack
on a stage. Press the D Key to
use a Sol Bomb attack."
else if global.imhover=15
global.imtext="This item has not been purchased."

if global.imhover=16 && global.buy16=1
global.imtext="Equip this emerald to perform a special attack
on a stage. Press the D Key to
use a Speed Break boost."
else if global.imhover=16
global.imtext="This item has not been purchased."

if global.imhover=17 && global.buy17=1
global.imtext="Equip this emerald to perform a special attack
on a stage. Press the D Key to
use a Chaos Control maneuver."
else if global.imhover=17
global.imtext="This item has not been purchased."

if global.imhover=18 && global.buy18=1
global.imtext="With this equipped, your boost energy is at max
and will never deplete. This gives
you infinite boost and attack."
else if global.imhover=18
global.imtext="This item has not been purchased."
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Other
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha<1
alpha+=.1

if lag>-1
lag-=1
if lag=0{
x=xplace
y=yplace}

x2=xplace
y2=yplace

if slow>0
slow-=.2

if slow2>0
slow2-=.2

if xm<2&&xm>0
xm=0

if xm>-2&&xm<0
xm=0

if xm>0
xm-=slow

if xm<0
xm+=slow



if ym<2&&ym>0
ym=0

if ym>-2&&ym<0
ym=0

if ym>0
ym-=slow2

if ym<0
ym+=slow2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprIMHover,0,x,y,1,1,0,c_white,alpha)

draw_sprite_ext(sprIMHover2,0,x2-xm,y2-ym,1,1,0,c_white,alpha)
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.imhover=1 && global.buy1=1)||
(global.imhover=2 && global.buy2=1)||
(global.imhover=3 && global.buy3=1)||
(global.imhover=4 && global.buy4=1)||
(global.imhover=5 && global.buy5=1)||
(global.imhover=6 && global.buy6=1)||
(global.imhover=7 && global.buy7=1)||
(global.imhover=8 && global.buy8=1)||
(global.imhover=9 && global.buy9=1)||
(global.imhover=10 && global.buy10=1)||
(global.imhover=11 && global.buy11=1)||
(global.imhover=12 && global.buy12=1)||

(global.imhover=13 && global.buy13=1)||
(global.imhover=14 && global.buy14=1)||
(global.imhover=15 && global.buy15=1)||
(global.imhover=16 && global.buy16=1)||
(global.imhover=17 && global.buy17=1)||
(global.imhover=18 && global.buy18=1)
sound_play(sndMenuConfirm)
else
sound_play(sndMenuBlocked2)

if (global.imhover=1 && global.buy1=1){
if global.use1=0{
global.use5=0
global.use6=0
global.use1=1}
else
global.use1=0}
if (global.imhover=2 && global.buy2=1){
if global.use2=0{
global.use5=0
global.use6=0
global.use2=1}
else
global.use2=0}
if (global.imhover=3 && global.buy3=1){
if global.use3=0{
global.use5=0
global.use6=0
global.use3=1}
else
global.use3=0}
if (global.imhover=4 && global.buy4=1){
if global.use4=0{
global.use5=0
global.use6=0
global.use4=1}
else
global.use4=0}
if (global.imhover=5 && global.buy5=1){
if global.use5=0{
global.use1=0
global.use2=0
global.use3=0
global.use4=0
global.use6=0
global.use5=1}
else
global.use5=0}
if (global.imhover=6 && global.buy6=1){
if global.use6=0{
global.use1=0
global.use2=0
global.use3=0
global.use4=0
global.use5=0
global.use6=1}
else
global.use6=0}
if (global.imhover=7 && global.buy7=1){
if global.use7=0
global.use7=1
else
global.use7=0}
if (global.imhover=8 && global.buy8=1){
if global.use8=0
global.use8=1
else
global.use8=0}
if (global.imhover=9 && global.buy9=1){
if global.use9=0
global.use9=1
else
global.use9=0}
if (global.imhover=10 && global.buy10=1){
if global.use10=0
global.use10=1
else
global.use10=0}
if (global.imhover=11 && global.buy11=1){
if global.use11=0
global.use11=1
else
global.use11=0}
if (global.imhover=12 && global.buy12=1){
if global.use12=0
global.use12=1
else
global.use12=0}



if (global.imhover=13 && global.buy13=1){
if global.use13=0
global.use13=1
else
global.use13=0}
if (global.imhover=14 && global.buy14=1){
if global.use14=0
global.use14=1
else
global.use14=0}
if (global.imhover=15 && global.buy15=1){
if global.use15=0
global.use15=1
else
global.use15=0}
if (global.imhover=16 && global.buy16=1){
if global.use16=0
global.use16=1
else
global.use16=0}
if (global.imhover=17 && global.buy17=1){
if global.use17=0
global.use17=1
else
global.use17=0}
if (global.imhover=18 && global.buy18=1){
if global.use18=0
global.use18=1
else
global.use18=0}
#define KeyPress_37
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xplace!=120
{
x=xplace
y=yplace

lag=10
slow=6

if xplace=187{
xplace=120
xm=-67}

if xplace=254{
xplace=187
xm=-67}

if xplace=321{
xplace=254
xm=-67}

if xplace=388{
xplace=321
xm=-67}

if xplace=455{
xplace=388
xm=-67}

sound_play(sndMenuCursor)
}
#define KeyPress_38
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if yplace!=56
{
x=xplace
y=yplace

lag=10
slow2=6

if yplace=130{
yplace=56
ym=-74}

if yplace=205{
yplace=130
ym=-75}

sound_play(sndMenuCursor)
}
#define KeyPress_39
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xplace!=455
{
x=xplace
y=yplace

lag=10
slow=6

if xplace=388{
xplace=455
xm=67}

if xplace=321{
xplace=388
xm=67}

if xplace=254{
xplace=321
xm=67}

if xplace=187{
xplace=254
xm=67}

if xplace=120{
xplace=187
xm=67}

sound_play(sndMenuCursor)
}
#define KeyPress_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if yplace!=205
{
x=xplace
y=yplace

lag=10
slow2=6

if yplace=130{
yplace=205
ym=75}

if yplace=56{
yplace=130
ym=74}

sound_play(sndMenuCursor)
}
#define KeyPress_65
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.imhover=1 && global.buy1=1)||
(global.imhover=2 && global.buy2=1)||
(global.imhover=3 && global.buy3=1)||
(global.imhover=4 && global.buy4=1)||
(global.imhover=5 && global.buy5=1)||
(global.imhover=6 && global.buy6=1)||
(global.imhover=7 && global.buy7=1)||
(global.imhover=8 && global.buy8=1)||
(global.imhover=9 && global.buy9=1)||
(global.imhover=10 && global.buy10=1)||
(global.imhover=11 && global.buy11=1)||
(global.imhover=12 && global.buy12=1)||

(global.imhover=13 && global.buy13=1)||
(global.imhover=14 && global.buy14=1)||
(global.imhover=15 && global.buy15=1)||
(global.imhover=16 && global.buy16=1)||
(global.imhover=17 && global.buy17=1)||
(global.imhover=18 && global.buy18=1)
sound_play(sndMenuConfirm)
else
sound_play(sndMenuBlocked2)

if (global.imhover=1 && global.buy1=1){
if global.use1=0{
global.use5=0
global.use6=0
global.use1=1}
else
global.use1=0}
if (global.imhover=2 && global.buy2=1){
if global.use2=0{
global.use5=0
global.use6=0
global.use2=1}
else
global.use2=0}
if (global.imhover=3 && global.buy3=1){
if global.use3=0{
global.use5=0
global.use6=0
global.use3=1}
else
global.use3=0}
if (global.imhover=4 && global.buy4=1){
if global.use4=0{
global.use5=0
global.use6=0
global.use4=1}
else
global.use4=0}
if (global.imhover=5 && global.buy5=1){
if global.use5=0{
global.use1=0
global.use2=0
global.use3=0
global.use4=0
global.use6=0
global.use5=1}
else
global.use5=0}
if (global.imhover=6 && global.buy6=1){
if global.use6=0{
global.use1=0
global.use2=0
global.use3=0
global.use4=0
global.use5=0
global.use6=1}
else
global.use6=0}
if (global.imhover=7 && global.buy7=1){
if global.use7=0
global.use7=1
else
global.use7=0}
if (global.imhover=8 && global.buy8=1){
if global.use8=0
global.use8=1
else
global.use8=0}
if (global.imhover=9 && global.buy9=1){
if global.use9=0
global.use9=1
else
global.use9=0}
if (global.imhover=10 && global.buy10=1){
if global.use10=0
global.use10=1
else
global.use10=0}
if (global.imhover=11 && global.buy11=1){
if global.use11=0
global.use11=1
else
global.use11=0}
if (global.imhover=12 && global.buy12=1){
if global.use12=0
global.use12=1
else
global.use12=0}



if (global.imhover=13 && global.buy13=1){
if global.use13=0
global.use13=1
else
global.use13=0}
if (global.imhover=14 && global.buy14=1){
if global.use14=0
global.use14=1
else
global.use14=0}
if (global.imhover=15 && global.buy15=1){
if global.use15=0
global.use15=1
else
global.use15=0}
if (global.imhover=16 && global.buy16=1){
if global.use16=0
global.use16=1
else
global.use16=0}
if (global.imhover=17 && global.buy17=1){
if global.use17=0
global.use17=1
else
global.use17=0}
if (global.imhover=18 && global.buy18=1){
if global.use18=0
global.use18=1
else
global.use18=0}
