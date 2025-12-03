#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // ---- Enemy flags -------------------------------------------
    harmful             = false;
    active              = false;
    stomphit=0
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
if instance_exists(objPlayer){
if stomphit=0
hspeed=(objPlayer.speed*objPlayer.animation_direction)+objPlayer.x_speed+stomphit
else
hspeed=stomphit
v=instance_create(x,y,objEnemyDeath)
v.sprite_index=sprite_index
v.image_speed=image_speed
v.image_xscale=image_xscale
v.hspeed=hspeed

if objPlayer.action=objPlayer.action_jumping
v.hspeed=0

with v{
    if abs(hspeed)<3
    instance_destroy()}
sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3))}


if global.AComboPause=false{
global.ACombo+=1
if global.ACombo>0
global.AComboTime=240}
#define Collision_objSplashLand
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x<other.x
stomphit=-8
else if x>other.x
stomphit=8
else
stomphit=0

instance_destroy()
#define Collision_objEnemyDeath
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if other.dont=false
if inside_view(x,y,0)
{
if x<other.x
stomphit=other.hspeed
else if x>other.x
stomphit=other.hspeed
else
stomphit=0

instance_destroy()
}
#define Collision_objASnake
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x<other.x
stomphit=-8
else if x>other.x
stomphit=8
else
stomphit=0

instance_destroy()
#define Collision_objChaosSpear
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x<other.x
stomphit=-8
else if x>other.x
stomphit=8
else
stomphit=0

instance_destroy()
