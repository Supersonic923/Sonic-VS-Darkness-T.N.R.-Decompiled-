#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
toggle=0
spd=0
spd2=0
depth=-.5
timer=100
gunmove=0
shoot=false
form=false
headmove=0
headmove2=0
nohit=false
intro=true
spdm=0
gunok=true
if instance_exists(objRotateBG)
x=-2600
else
x=-100

pinch=false

pinchturn=3

global.hitflash=0

mood=0
laugh=0
hurt=0
flash=false

pinchmove=false
pinchmove2=false

hitbox=instance_create(x,y,objNight_BossHit)

jack=false

if instance_exists(objRotateBG)
alarm[1]=330
else
alarm[1]=100

pinchbar=0

voice=0

global.boss_life=12
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
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
sound_play(vcEDie)
sound_play(sndBossExplode)
with instance_create(x,y,objBossDebris){sprite_index=sprNight_Boss vspeed=-5.5 mainpart=true}

with instance_create(x,y+35,objBossDebris){sprite_index=sprNight_BossW vspeed=-(random(4)+5) hspeed=-(random(.5)+.1)}
with instance_create(x-28,y+35,objBossDebris){sprite_index=sprNight_BossW vspeed=-(random(4)+5) hspeed=-(random(.5)+.1)}
with instance_create(x+28,y+35,objBossDebris){sprite_index=sprNight_BossW vspeed=-(random(4)+5) hspeed=-(random(.5)+.1)}

with instance_create(x,y+35,objBossDebris){sprite_index=sprNight_BossW vspeed=-(random(4)+5) hspeed=-(random(.5)+.1)}
with instance_create(x-28,y+35,objBossDebris){sprite_index=sprNight_BossW vspeed=-(random(4)+5) hspeed=-(random(.5)+.1)}
with instance_create(x+28,y+35,objBossDebris){sprite_index=sprNight_BossW vspeed=-(random(4)+5) hspeed=-(random(.5)+.1)}

with instance_create(x-26,y-5,objBossDebris){sprite_index=sprNight_BossG vspeed=-(random(2)+5) hspeed=-3 spin=true}
with instance_create(x+26,y-5,objBossDebris){sprite_index=sprNight_BossB vspeed=-(random(2)+4) hspeed=-1 spin=true}

with objPlayer
checknend=true

instance_create(x,y-5,objBossExplode2)

global.resulttime=global.game_time
global.stoptime=true

with objBoostPar
instance_destroy()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.hitflash>0{
if flash=true
flash=false
else
flash=true

alarm[0]=2}
else
flash=false
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Jack Intro
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
jack=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Life Control
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.bossdamage<(174/global.boss_life)*(global.boss_life/2)
pinchbar=0
if global.bossdamage>=(174/global.boss_life)*(global.boss_life/2)
pinchbar=1
if global.bossdamage>=(174/global.boss_life)*(global.boss_life-(global.boss_life/3))
pinchbar=2

if ((pinchmove=true || pinchmove2=true)) && timer<5 || jack=true
nohit=true
else
nohit=false


/*if global.bossdamage<(174/hitbox.life)*(hitbox.life/2)
pinchbar=0
if global.bossdamage>=(174/hitbox.life)*(hitbox.life/2)
pinchbar=1
if global.bossdamage>=(174/hitbox.life)*(hitbox.life-(hitbox.life/3))
pinchbar=2

if ((pinchmove=true || pinchmove2=true)) && timer<5 || jack=true
nohit=true
else
nohit=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Main Functions
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if intro=false && !instance_exists(objRotateBG) && instance_exists(objPlayer)
{
    // NORMAL ATTACKS
    //if (form=false && (headmove=0||jack=true)) || (form=true && (headmove=30||jack=true)) //if form=false || headmove=30
    timer-=1

    if gunok=true{
    if timer<0 && timer>-5
    gunmove-=2
    else if timer<=-5
    gunmove+=1}

    if timer<20 && timer>0 && pinchmove=false
    spdm+=.2

    if timer=0
    {
        if pinchmove=true
        {
            if mood=0 && global.hitflash=0 && form=false
            {
                if form=false && (!sound_isplaying(vcEHurt) && !sound_isplaying(vcEHurt2) && !sound_isplaying(vcEHurt3) && !sound_isplaying(vcEHurtP) && !sound_isplaying(vcEHurtP2)
                 && !sound_isplaying(vcELaugh) && !sound_isplaying(vcELaugh2))
                sound_play(choose(vcEAttack,vcEAttack2))
                form=true
                timer=100
                pinchmove=false

                if pinchmove2=true{
                sound_play(sndBossCharge)
                instance_create(x,y,objBossCharge)}
            }
                gunok=false
        }
        else
        shoot=true
    }

    if shoot=true{
    spdm=0
    if form=true{
    if pinchmove2=true && global.bossdamage>=(174/global.boss_life)*(global.boss_life-(global.boss_life/3))//global.bossdamage>=(174/global.boss_life)*(global.boss_life-3)
    {
    instance_create(x,y,objBossBeam)}
    else
    instance_create(x-36,y-5,objNight_BossBallE)}
    else{
    with instance_create(x-36,y-5,objNight_BossBall){
    image_index=other.toggle
    if other.pinchbar=2
    spikes=choose(true,false,false)
    else if other.pinchbar=1
    spikes=choose(true,false,false,false)}
    }
    sound_play(sndBossShoot)
    if global.specialfx>2{
    with instance_create(x-60,y-5,objOvalFX)
    image_angle=90
    with instance_create(x-60,y-5,objOvalFX){
    image_angle=90}
    scale=.5}
    if form=false
    toggle+=1
    pinchturn-=1
    if toggle=3
    toggle=0

    //Ball Levels
    if global.bossdamage<(174/global.boss_life)*(global.boss_life/2)
    toggle=0
    else if global.bossdamage<(174/global.boss_life)*(global.boss_life-(global.boss_life/3))
    if toggle=2
    toggle=0

    if pinchturn=0{
    if global.bossdamage>=(174/global.boss_life)*(global.boss_life/2) && jack=false
    pinchmove=true//choose(true,false)
    if global.bossdamage>=(174/global.boss_life)*(global.boss_life-(global.boss_life/3)){
    if jack=false
    pinchmove2=false//choose(true,false,true)
    pinchmove=true
    if jack=true
    pinchmove2=true}
    pinchturn=choose(3,4,5)}
    gunok=true
    shoot=false}

    if global.bossdamage<(174/global.boss_life)*(global.boss_life-(global.boss_life/3)) && jack=true
    pinchmove=false

    if global.bossdamage>=(174/global.boss_life)*(global.boss_life-(global.boss_life/3)) && jack=true && pinchmove=true
    pinchmove2=true

    if timer<=-15{
    if pinch=true
    timer=75
    else
    timer=100
    gunmove=0}


    //FINAL ATTACK
    if form=true
    {
    if headmove<30
    headmove+=1

    if headmove2<30 && pinchmove2=false
    headmove2+=1
    }
    else
    {
    if alarm[1]<120
    jack=true
    if jack=false
    if headmove>0
    headmove-=1
    if headmove2>0
    headmove2-=1
    }
    /*if form=false && headmove=0
    {
    with hitbox
    mask_index=sprite_index
    }*/

    //Prevent Attacks from the player
    if headmove!=0
    {
    with hitbox
    mask_index=nomask}
    else
    {
    with hitbox
    mask_index=sprite_index
    }
}
else if x<xstart
x+=(max(min(10,point_distance(x,y,xstart,ystart)*.07),.5))
else if instance_exists(objPlayer){
if intro=true && objPlayer.checknend=false{
hitbox.mask_index=hitbox.sprite_index
intro=false}}

    spd+=max((x-xprevious)*.1,.5)
    if spd>=4
    spd=0

    spd2+=.3
    if spd2>=4
    spd2=0

    if global.hitflash=60{
    if global.specialfx>1
    repeat(choose(2,3))instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objBNP)}

    if global.hitflash>0
    global.hitflash-=1

    pinch=hitbox.pinch


    //JACK SHIELD
    if form=false && global.hitflash=0 && hitbox.hit=false// && pinchmove=false
    {
    if jack=true{
    if headmove<30
    headmove+=1
    if !instance_exists(objNight_BossJack) && headmove=30{//headmove=29{
    instance_create(x,y,objNight_BossJack)
    if global.specialfx>2
    instance_create(x,y-34,objNight_BossConfetti)}}
    else{
    if headmove>0
    headmove-=1}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Eggman Emotions
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if laugh>0
{

if mood<3
mood+=.2
if mood>=3
mood=1

laugh-=1
}
else if global.hitflash>0
{
mood=3
}
else if floor(mood)<3
mood=0
else
mood+=.2

if mood>=5
mood=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with hitbox{
x=other.x
y=other.y-45+other.headmove}

if instance_exists(objPlayer)
if objPlayer.action=objPlayer.action_hurt{
if global.hitflash=0 && mood=0 && laugh=0{
if sound_isplaying(vcEAttack)
sound_stop(vcEAttack)
if sound_isplaying(vcEAttack2)
sound_stop(vcEAttack2)
if !sound_isplaying(vcEHurt) && !sound_isplaying(vcEHurt2) && !sound_isplaying(vcEHurt3) && !sound_isplaying(vcEHurtP) && !sound_isplaying(vcEHurtP2){
if instance_exists(objNight_BossBallE){
with objNight_BossBallE
sound_play(choose(vcELaugh,vcELaugh2))}
else
sound_play(choose(vcELaugh,vcELaugh2))
laugh=85}
}}

if instance_exists(objPlayerDie){
if global.hitflash=0 && mood=0 && laugh=0 && objPlayerDie.vspeed<0{
if sound_isplaying(vcEAttack)
sound_stop(vcEAttack)
if sound_isplaying(vcEAttack2)
sound_stop(vcEAttack2)
if !sound_isplaying(vcEHurt) && !sound_isplaying(vcEHurt2) && !sound_isplaying(vcEHurt3) && !sound_isplaying(vcEHurtP) && !sound_isplaying(vcEHurtP2){
if instance_exists(objNight_BossBallE){
with objNight_BossBallE
sound_play(choose(vcELaugh,vcELaugh2))}
else
sound_play(choose(vcELaugh,vcELaugh2))
laugh=85}
}}


if instance_exists(objOvalFX){
objOvalFX.x=x-70}

if instance_exists(objBossBeam){
objBossBeam.x=x-26}

if instance_exists(objBossCharge){
objBossCharge.x=x}

if instance_exists(objEnergyAbsorbFx){
objEnergyAbsorbFx.x=x}

if instance_exists(objNight_BossJack) && global.bossspeed=0{
objNight_BossJack.x=x
objNight_BossJack.xstart=x}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if flash=true && global.hitflash>0 && global.pausegame=false{
draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
draw_rectangle_color(x-200, y-200, x+200, y+200, c_white, c_white, c_white, c_white, false);
draw_set_blend_mode(bm_normal);}

//eggman glass
draw_sprite(sprNight_BossE2,0,x,y-45+headmove)
draw_sprite(sprNight_BossE,floor(mood),x,y-45+headmove)
//backside
draw_sprite(sprNight_BossB,floor(spd2),x+26-headmove2,y-5)
//gun
draw_sprite(sprNight_BossG,0,(x-26)-gunmove,y-5)

//center wheel b
draw_sprite(sprNight_BossW,floor(spd),x-4,y+35-1)
//left wheel b
draw_sprite(sprNight_BossW,floor(spd),x-28-4,y+35-1)
//right wheel b
draw_sprite(sprNight_BossW,floor(spd),x+28-4,y+35-1)

//main center
draw_sprite(sprNight_Boss,spdm,x,y)

//center wheel f
draw_sprite(sprNight_BossW,floor(spd),x,y+35)
//left wheel f
draw_sprite(sprNight_BossW,floor(spd),x-28,y+35)
//right wheel f
draw_sprite(sprNight_BossW,floor(spd),x+28,y+35)

if flash=true && global.hitflash>0 && global.pausegame=false{
draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
draw_rectangle_color(x-200, y-200, x+200, y+200, c_white, c_white, c_white, c_white, false);}
draw_set_blend_mode(bm_normal)

if global.hitflash>0
draw_sprite(sprNight_BossE,floor(mood),x,y-45+headmove)
