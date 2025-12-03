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
bounce=false
blink=20
hit=false
alarm[0]=1
alarm[1]=5
delay=15
target=false
spikes=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.specialfx>2{
instance_create(x,y,objMagicStarEf)
alarm[0]=1}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
depth=-.5
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

if hit=false{
if image_index=1
hspeed=-6
else if image_index=0 || image_index=3
hspeed=-5
else
hspeed=-4}

if blink=0
blink=20

if blink>0
blink-=1


check=instance_place(x,y+1,objSolid)
if check!=noone && vspeed>0
{
if check.y>y{
if vspeed>0
sound_play(sndBossBall)
if image_index=2
vspeed=-6
else
vspeed=-4
bounce=true}
}

if delay>0
delay-=1

if instance_exists(objPlayer){
if delay=0 && objPlayer.x<x && hit=false
target=true
else
target=false}

if spikes=true{
image_index=3
target=0
noboost=true}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.x>other.xprevious && other.x<x && delay=0 && other.homing=1 && spikes=false{
if hit=false
{
target=false
hspeed=10
vspeed=-6.5
sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3))
global.Score+=50

if global.boost>5
global.boost-=5
else
global.boost=0

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
hit=true
}

if spikes=true
{
instance_destroy()
with instance_create(x,y,objExplode)
sprite_index=sprExplosionBigger
}
#define Collision_objBoostPar
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.x>other.xprevious && other.x<x && delay=0 && spikes=false{
if hit=false
{
target=false
hspeed=10
vspeed=-6.5
sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3))
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
hit=true
}
#define Collision_objBossHitArea
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=hit=true && global.hitflash=0 && objNight_Boss.jack=false
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
                        global.bossdamage+=174/other.life
                        if global.bossdamage>=174{
                        with other
                        instance_destroy()
                        with objNight_Boss
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
                        if global.bossdamage>=(174/other.life)*(other.life-(other.life/3)) && other.pinch=false{//if global.bossdamage=(174/objBossHitArea.life)*(objBossHitArea.life-3)
                        sound_play(choose(vcEHurtP,vcEHurtP2,vcEHurtP))
                        other.pinch=true}
                        else{
                        with objBossPar
                        hurt_choose()}
                        with objNight_Boss{
                        form=false
                        headmove=0}
                        with other
                        hit=true
                        global.Score+=300
                        instance_destroy()}

                        with instance_create(x,y,objExplode)
                        sprite_index=sprExplosionBigger
#define Collision_objNight_BossJack
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with other{
if sprite_index=sprNight_BossClown3 && leave=false{
hspeed=4
ydis=40
angle=0
//hit=true

if timer>=30
timer-=30
else
timer=0

repeat(choose(2,3))instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objBNP)

sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3))

with instance_create(other.x,other.y,objExplode)
sprite_index=sprExplosionBigger

with other
instance_destroy()}}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
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

if spikes=true
draw_sprite_ext(sprNight_BossBallS,image_index,x,y,1,1,image_angle,c_white,1)

draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,1)
draw_sprite_ext(sprNight_BossBallB,image_index,x,y,1,1,0,c_white,1)
if blink<10
draw_sprite_blend_ext(sprNight_BossBallB,image_index,x,y,1,1,0,c_white,1,bm_add)

if instance_exists(objNight_Boss)
if objNight_Boss.flash=true && global.hitflash>0 && global.pausegame=false{
draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
draw_rectangle_color(x-200, y-200, x+200, y+200, c_white, c_white, c_white, c_white, false);}
draw_set_blend_mode(bm_normal)
