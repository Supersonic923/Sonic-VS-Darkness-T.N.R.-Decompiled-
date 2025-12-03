#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // ---- Enemy flags -------------------------------------------
    harmful             = false;
    active              = false;
    target=1
    dst=250
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.specialfx>1
repeat(choose(3,4))instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objENP)

if global.specialfx>2{
c=instance_create(x,y,objOvalFX)
b=instance_create(x,y,objOvalFX2)

c.image_angle=random(360)
b.image_angle=c.image_angle+90}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objExplode
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndEnemyBreak)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=611
relative=1
applies_to=self
var_name=global.Score
var_value=+200
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.AComboPause=false{
global.ACombo+=1
if global.ACombo>0
global.AComboTime=240}

if room!=rmTRAIN && global.no_boost_replish=false{
if global.boost>5
global.boost-=5
else
global.boost=0}
#define Collision_objSUNCatapult3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
