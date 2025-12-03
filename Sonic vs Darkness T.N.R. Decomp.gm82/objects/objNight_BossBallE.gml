#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
hspeed=-6
bounce=false
hit=false

delay=15
target=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.3
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bounce=true
image_angle+=abs(hspeed)

if global.hitflash>0
mask_index=nomask
else
mask_index=sprite_index


check=instance_place(x,y+1,objSolid)
if check!=noone && vspeed>0
{
if check.y>y{
if vspeed>0
sound_play(sndBossBall)
vspeed=-4
bounce=true}
}

if delay>0
delay-=1

/*
if instance_exists(objPlayer){
if delay=0 && objPlayer.x<x && hit=false
target=true
else
target=false}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if other.x>other.xprevious && other.x<x && delay=0 && other.homing=true{
if hit=false
{
hspeed=10
vspeed=-5
sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3))
image_index=1
global.Score+=50


with other
{
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
animation="home"
x_speed=8
y_speed=-4
homing=0

rstrenght=.8
hitrumble=10
}
}
}
hit=true}
#define Collision_objBoostPar
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.x>other.xprevious && other.x<x && delay=0{
if hit=false
{
hspeed=10
vspeed=-5
sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3))
image_index=1
global.Score+=50

if global.boost>5
global.boost-=5
else
global.boost=0

with objPlayer{
rstrenght=.8
hitrumble=10
}
}
hit=true}
#define Collision_objNight_Boss
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=hit=true && global.hitflash=0 && !instance_exists(objNight_BossJack)
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
                        global.bossdamage+=174/objBossHitArea.life
                        if global.bossdamage>=174{
                        with other
                        instance_destroy()
                        with objBossHitArea
                        instance_destroy()
                        instance_destroy()}
                        else{
                        if sound_isplaying(vcEAttack)
                        sound_stop(vcEAttack)
                        if sound_isplaying(vcEAttack2)
                        sound_stop(vcEAttack2)
                        if sound_isplaying(vcELaugh)
                        sound_stop(vcELaugh)
                        if sound_isplaying(vcELaugh2)
                        sound_stop(vcELaugh2)
                        if sound_isplaying(vcEHurt)
                        sound_stop(vcEHurt)
                        if sound_isplaying(vcEHurt2)
                        sound_stop(vcEHurt2)
                        if sound_isplaying(vcEHurt3)
                        sound_stop(vcEHurt3)
                        if sound_isplaying(vcEHurtP)
                        sound_stop(vcEHurtP)
                        if sound_isplaying(vcEHurtP2)
                        sound_stop(vcEHurtP2)

                        sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3))
                        sound_play(sndBossDamage)
                        if global.bossdamage>=(174/objBossHitArea.life)*(objBossHitArea.life-(objBossHitArea.life/3)) && objBossHitArea.pinch=false{//if global.bossdamage=(174/objBossHitArea.life)*(objBossHitArea.life-3)
                        sound_play(choose(vcEHurtP,vcEHurtP2,vcEHurtP,))
                        objBossHitArea.pinch=true}
                        else{
                        with other
                        hurt_choose()}
                        other.form=false
                        other.headmove=0
                        if other.pinch=true
                        other.timer=75
                        else
                        other.timer=100
                        with objBossHitArea
                        hit=true
                        global.Score+=300
                        instance_destroy()}

                        with instance_create(x,y,objExplode)
                        sprite_index=sprExplosionBigger
#define Other_0
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
objNight_Boss.form=false
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objNight_Boss)
if objNight_Boss.flash=true && global.hitflash>0 && global.pausegame=false{
draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
draw_rectangle_color(x-200, y-200, x+200, y+200, c_white, c_white, c_white, c_white, false);}
draw_set_blend_mode(bm_normal)

draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,1)

if instance_exists(objNight_Boss)
if objNight_Boss.flash=true && global.hitflash>0 && global.pausegame=false{
draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
draw_rectangle_color(x-200, y-200, x+200, y+200, c_white, c_white, c_white, c_white, false);}
draw_set_blend_mode(bm_normal)
