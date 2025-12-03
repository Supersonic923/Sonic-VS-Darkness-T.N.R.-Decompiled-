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
global.gshover=1
if xplace=187 && yplace=56
global.gshover=2
if xplace=254 && yplace=56
global.gshover=3
if xplace=321 && yplace=56
global.gshover=4
if xplace=388 && yplace=56
global.gshover=5
if xplace=455 && yplace=56
global.gshover=6

if xplace=120 && yplace=130
global.gshover=7
if xplace=187 && yplace=130
global.gshover=8
if xplace=254 && yplace=130
global.gshover=9
if xplace=321 && yplace=130
global.gshover=10
if xplace=388 && yplace=130
global.gshover=11
if xplace=455 && yplace=130
global.gshover=12

if xplace=120 && yplace=205
global.gshover=13
if xplace=187 && yplace=205
global.gshover=14
if xplace=254 && yplace=205
global.gshover=15
if xplace=321 && yplace=205
global.gshover=16
if xplace=388 && yplace=205
global.gshover=17
if xplace=455 && yplace=205
global.gshover=18
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
if global.gshover=1{
if global.itemunlock1=1{
global.gsapply=1
global.gstitle=1
global.price=500
global.tprice=2
global.gsdisplay=sprSalomChao}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}
if global.gshover=2{
if global.itemunlock2=1{
global.gsapply=2
global.gstitle=2
global.price=500
global.tprice=2
global.gsdisplay=sprVerminChao}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}

if global.gshover=3{
if global.itemunlock3=1{
global.gsapply=3
global.gstitle=3
global.price=500
global.tprice=2
global.gsdisplay=sprSonicChao}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}

if global.gshover=4{
if global.itemunlock4=1{
global.gsapply=4
global.gstitle=4
global.price=500
global.tprice=2
global.gsdisplay=sprShadowChao}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}



if global.gshover=5{
if global.itemunlock5=1{
global.gsapply=5
global.price=1000
global.tprice=5
global.gstitle=5
global.gsdisplay=sprDarkChao}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}

if global.gshover=6{
if global.itemunlock6=1{
global.gsapply=5
global.price=2000
global.tprice=10
global.gstitle=6
global.gsdisplay=sprAngelChao}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}

if global.gshover=7{
if global.itemunlock7=1{
global.gsapply=5
global.price=500
global.tprice=0
global.gstitle=7
global.gsdisplay=sprGSRRing}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}

if global.gshover=8{
if global.itemunlock8=1{
global.gsapply=5
global.price=200
global.tprice=0
global.gstitle=8
global.gsdisplay=sprGSRTime}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}

if global.gshover=9{
if global.itemunlock9=1{
global.gsapply=5
global.price=500
global.tprice=5
global.gstitle=9
global.gsdisplay=sprGSLife}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}

if global.gshover=10{
if global.itemunlock10=1{
global.gsapply=5
global.price=400
global.tprice=2
global.gstitle=10
global.gsdisplay=sprGSCheck}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}

if global.gshover=11{
if global.itemunlock11=1{
global.gsapply=5
global.price=2000
global.tprice=10
global.gstitle=11
global.gsdisplay=sprGSHype}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}

if global.gshover=12{
if global.itemunlock12=1{
global.gsapply=5
global.price=1000
global.tprice=4
global.gstitle=12
global.gsdisplay=sprGSTarget}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gshover=13{
if global.itemunlock13=1{
global.gsapply=1
global.gstitle=13
global.price=500
global.tprice=4
global.gsdisplay=sprGSBoard}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}
if global.gshover=14{
if global.itemunlock14=1{
global.gsapply=1
global.gstitle=14
global.price=1000
global.tprice=5
global.gsdisplay=sprGSEmerald1}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}

if global.gshover=15{
if global.itemunlock15=1{
global.gsapply=2
global.gstitle=15
global.price=1000
global.tprice=5
global.gsdisplay=sprGSEmerald2}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}

if global.gshover=16{
if global.itemunlock16=1{
global.gsapply=3
global.gstitle=16
global.price=1000
global.tprice=5
global.gsdisplay=sprGSEmerald3}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}



if global.gshover=17{
if global.itemunlock17=1{
global.gsapply=4
global.price=1000
global.tprice=5
global.gstitle=17
global.gsdisplay=sprGSEmerald4}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
}

if global.gshover=18{
if global.itemunlock18=1{
global.gsapply=5
global.price=2000
global.tprice=10
global.gstitle=18
global.gsdisplay=sprGSInf}
else
{
global.gsapply=0
global.gstitle=19
global.price=0
global.tprice=0
global.gsdisplay=sprGSNoPreview
}
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




if global.gshover=1{
if global.itemunlock1=1
global.gstext="This is a chao version of Salom the hedgehog.
Each character chao has it's own unique
abilities pertaining to the player."
else
global.gstext="This item is locked."
}

if global.gshover=2{
if global.itemunlock2=1
global.gstext="This is a chao version of Vermin the hedgehog.
Each character chao has it's own unique
abilities pertaining to the player."
else
global.gstext="This item is locked."}

if global.gshover=3{
if global.itemunlock3=1
global.gstext="This is a chao version of Sonic the hedgehog.
Each character chao has it's own unique
abilities pertaining to the player."
else
global.gstext="This item is locked."
}

if global.gshover=4{
if global.itemunlock4=1
global.gstext="This is a chao version of Shadow the hedgehog.
Each character chao has it's own unique
abilities pertaining to the player."
else
global.gstext="This item is locked."}

if global.gshover=5{
if global.itemunlock5=1
global.gstext="A chao full of evil. With this chao by your side,
enemies will fear your power, however there
is a small chance of  bad luck occuring.
Be cautious."
else
global.gstext="This item is locked."}

if global.gshover=6{
if global.itemunlock6=1
global.gstext="A chao full of good. With this chao by your side,
you'll be supplied with necessities, however
there is a small cost for each action taken
by this chao. Be vigilant."
else
global.gstext="This item is locked."}

if global.gshover=7{
if global.itemunlock7=1
global.gstext="In the beginning of a level, you will receive
a random amount of rings ranging from 10 to 50.
This also happens after losing a life."
else
global.gstext="This item is locked."}

if global.gshover=8{
if global.itemunlock8=1
global.gstext="When rings scatter, the time to recollect them
all is extended to 10 seconds."
else
global.gstext="This item is locked."}

if global.gshover=9{
if global.itemunlock9=1
global.gstext="An extra life is awarded to you after running
out of lives. This only happens once per level.
However restarting will cause this
action to reset."
else
global.gstext="This item is locked."}

if global.gshover=10{
if global.itemunlock10=1
global.gstext="Once you lose a life and continue at checkpoint,
30 seconds is subtracted from the timer.
This only happens once per level. However
restarting will cause this action to reset."
else
global.gstext="This item is locked."}

if global.gshover=11{
if global.itemunlock11=1
global.gstext="With this equipped, you will stay in hyper mode
throughout the level. It'll also keep the
hyper gauge from draining."
else
global.gstext="This item is locked."}

if global.gshover=12{
if global.itemunlock12=1
global.gstext="A more advance version of the original Target
Locker. Each player has their own custom color.
The lock-on sound is also changed."
else
global.gstext="This item is locked."
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
                                                              ////




if global.gshover=13{
if global.itemunlock13=1
global.gstext="Equip this item to unlock the Surfing Challenge.
In order to play it, you must go through
the stage entrance at the beach."
else
global.gstext="This item is locked."
}

if global.gshover=14{
if global.itemunlock14=1
global.gstext="Equip this emerald to perform a special attack
on a stage. Press the D Key to
use a Sol Wind attack."
else
global.gstext="This item is locked."}

if global.gshover=15{
if global.itemunlock15=1
global.gstext="Equip this emerald to perform a special attack
on a stage. Press the D Key to
use a Sol Bomb attack."
else
global.gstext="This item is locked."
}

if global.gshover=16{
if global.itemunlock16=1
global.gstext="Equip this emerald to perform a special attack
on a stage. Press the D Key to
use a Speed Break boost."
else
global.gstext="This item is locked."}

if global.gshover=17{
if global.itemunlock17=1
global.gstext="Equip this emerald to perform a special attack
on a stage. Press the D Key to
use a Chaos Control maneuver."
else
global.gstext="This item is locked."}

if global.gshover=18{
if global.itemunlock18=1
global.gstext="With this equipped, your boost energy is at max
and will never deplete. This gives
you infinite boost and attack."
else
global.gstext="This item is locked."}
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
draw_sprite_ext(sprIMHover,0,x+71,y-24,1,1,0,c_white,alpha)

draw_sprite_ext(sprIMHover2,0,(x2-xm)+71,(y2-ym)-24,1,1,0,c_white,alpha)
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.gshover=1)
global.it1=0
if (global.gshover=2)
global.it2=0
if (global.gshover=3)
global.it3=0
if (global.gshover=4)
global.it4=0
if (global.gshover=5)
global.it5=0
if (global.gshover=6)
global.it6=0
if (global.gshover=7)
global.it7=0
if (global.gshover=8)
global.it8=0
if (global.gshover=9)
global.it9=0
if (global.gshover=10)
global.it10=0
if (global.gshover=11)
global.it11=0
if (global.gshover=12)
global.it12=0
if (global.gshover=13)
global.it13=0
if (global.gshover=14)
global.it14=0
if (global.gshover=15)
global.it15=0
if (global.gshover=16)
global.it16=0
if (global.gshover=17)
global.it17=0
if (global.gshover=18)
global.it18=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objGSConfirm1) && !instance_exists(objGSConfirm2)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.gshover=1 && (global.buy1=1 || global.itemunlock1=0))||
(global.gshover=2 && (global.buy2=1 || global.itemunlock2=0))||
(global.gshover=3 && (global.buy3=1 || global.itemunlock3=0))||
(global.gshover=4 && (global.buy4=1 || global.itemunlock4=0))||
(global.gshover=5 && (global.buy5=1 || global.itemunlock5=0))||
(global.gshover=6 && (global.buy6=1 || global.itemunlock6=0))||
(global.gshover=7 && (global.buy7=1 || global.itemunlock7=0))||
(global.gshover=8 && (global.buy8=1 || global.itemunlock8=0))||
(global.gshover=9 && (global.buy9=1 || global.itemunlock9=0))||
(global.gshover=10 && (global.buy10=1 || global.itemunlock10=0))||
(global.gshover=11 && (global.buy11=1 || global.itemunlock11=0))||
(global.gshover=12 && (global.buy12=1 || global.itemunlock12=0))||

(global.gshover=13 && (global.buy13=1 || global.itemunlock13=0))||
(global.gshover=14 && (global.buy14=1 || global.itemunlock14=0))||
(global.gshover=15 && (global.buy15=1 || global.itemunlock15=0))||
(global.gshover=16 && (global.buy16=1 || global.itemunlock16=0))||
(global.gshover=17 && (global.buy17=1 || global.itemunlock17=0))||
(global.gshover=18 && (global.buy18=1 || global.itemunlock18=0))
{
sound_play(sndMenuBlocked2)
}
else
{
if global.money>=global.price && global.tokens>=global.tprice{
sound_play(sndMenuConfirm)
instance_create(0,0,objGSConfirm2)}
else{
sound_play(sndMenuBlocked2)
instance_create(0,0,objGSConfirm1)}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objGSConfirm1
instance_destroy()
#define KeyPress_37
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objGSConfirm1) && !instance_exists(objGSConfirm2)
*/
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
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objGSConfirm1) && !instance_exists(objGSConfirm2)
*/
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
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objGSConfirm1) && !instance_exists(objGSConfirm2)
*/
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
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objGSConfirm1) && !instance_exists(objGSConfirm2)
*/
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
if (global.gshover=1)
global.it1=0
if (global.gshover=2)
global.it2=0
if (global.gshover=3)
global.it3=0
if (global.gshover=4)
global.it4=0
if (global.gshover=5)
global.it5=0
if (global.gshover=6)
global.it6=0
if (global.gshover=7)
global.it7=0
if (global.gshover=8)
global.it8=0
if (global.gshover=9)
global.it9=0
if (global.gshover=10)
global.it10=0
if (global.gshover=11)
global.it11=0
if (global.gshover=12)
global.it12=0
if (global.gshover=13)
global.it13=0
if (global.gshover=14)
global.it14=0
if (global.gshover=15)
global.it15=0
if (global.gshover=16)
global.it16=0
if (global.gshover=17)
global.it17=0
if (global.gshover=18)
global.it18=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objGSConfirm1) && !instance_exists(objGSConfirm2)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.gshover=1 && (global.buy1=1 || global.itemunlock1=0))||
(global.gshover=2 && (global.buy2=1 || global.itemunlock2=0))||
(global.gshover=3 && (global.buy3=1 || global.itemunlock3=0))||
(global.gshover=4 && (global.buy4=1 || global.itemunlock4=0))||
(global.gshover=5 && (global.buy5=1 || global.itemunlock5=0))||
(global.gshover=6 && (global.buy6=1 || global.itemunlock6=0))||
(global.gshover=7 && (global.buy7=1 || global.itemunlock7=0))||
(global.gshover=8 && (global.buy8=1 || global.itemunlock8=0))||
(global.gshover=9 && (global.buy9=1 || global.itemunlock9=0))||
(global.gshover=10 && (global.buy10=1 || global.itemunlock10=0))||
(global.gshover=11 && (global.buy11=1 || global.itemunlock11=0))||
(global.gshover=12 && (global.buy12=1 || global.itemunlock12=0))||

(global.gshover=13 && (global.buy13=1 || global.itemunlock13=0))||
(global.gshover=14 && (global.buy14=1 || global.itemunlock14=0))||
(global.gshover=15 && (global.buy15=1 || global.itemunlock15=0))||
(global.gshover=16 && (global.buy16=1 || global.itemunlock16=0))||
(global.gshover=17 && (global.buy17=1 || global.itemunlock17=0))||
(global.gshover=18 && (global.buy18=1 || global.itemunlock18=0)){
sound_play(sndMenuBlocked2)
}
else
{
if global.money>=global.price && global.tokens>=global.tprice{
sound_play(sndMenuConfirm)
instance_create(0,0,objGSConfirm2)}
else{
sound_play(sndMenuBlocked2)
instance_create(0,0,objGSConfirm1)}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objGSConfirm1
instance_destroy()
