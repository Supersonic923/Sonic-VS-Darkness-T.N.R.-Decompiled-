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
    life=1
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.specialfx>1
repeat(choose(5,6))instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objENP)

if global.specialfx>2{
c=instance_create(x,y,objOvalFX)
b=instance_create(x,y,objOvalFX2)

c.image_angle=random(360)
b.image_angle=c.image_angle+90}

if !instance_exists(objEnemyCount)
{
    var t;
    t=instance_nearest(x,y,objHandleR)
    var s;
    s=instance_nearest(x,y,objButtonBox)
    var f;
    f=instance_nearest(x,y,objFlameTrapT)

    if distance_to_object(t)<500{
    t.give=true}

    else if distance_to_object(s)<500{
    s.go=true
    with s
    sound_play(sndSwitchOn2)}

    else if distance_to_object(f)<500{
    with f{
    instance_destroy()
    sound_play(sndSwitchOn2)}
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objExplode2
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=611
relative=1
applies_to=self
var_name=global.Score
var_value=+500
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

if global.boost>10
global.boost-=10
else
global.boost=0
#define Collision_objSplashLand
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3)) life-=1 if life>0blink=60
if life>0
repeat(choose(2,3))instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objBNP)}
#define Collision_objASnake
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3)) life-=1 if life>0blink=60
if life>0
repeat(choose(2,3))instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objBNP)}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=other
invert=0
arg0=objSnakeSign
arg1=other.x
arg2=other.y
*/
#define Collision_objChaosSpear
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3)) life-=1 if life>0blink=60
if life>0
repeat(choose(2,3))instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objBNP)}
#define Collision_objSuperSnake
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3)) life-=1 blink=60}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=other
invert=0
arg0=objSnakeSign
arg1=other.x
arg2=other.y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=other
invert=0
arg0=objSSnakeRing
arg1=other.x
arg2=other.y
*/
#define Collision_objSSnakeRing
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3)) life-=1 if life>0blink=60}
