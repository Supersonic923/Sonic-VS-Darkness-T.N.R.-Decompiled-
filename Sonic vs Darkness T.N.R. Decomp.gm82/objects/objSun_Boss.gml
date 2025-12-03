#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
toggle=0
spd=0
spd2=0
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

master_x=300
pos_x=-100

barrel=0

mouth=0

if instance_exists(objRotateBG)
{
bob=-390
attack_init=720
dark_fade=-36.4
}
else
{
bob=-130
attack_init=320
dark_fade=-10.4
}

real_bob=0
real_bob2=0
bob_ang=0
water=0
water2=0
shake=0

pinch=false
pinch_half=false

pinchturn=3
glitch_fix=-1

eye_alpha=0
eye_back=false
eye_rot=0

global.hitflash=0

mood=0
laugh=0
hurt=0
flash=false

pinchmove=false
pinchmove2=false

jack=false

fall_down=false

darkness=0

pinchbar=0

voice=0

hitbox=instance_create(0,1500,objSun_BossT)
hitbox2=instance_create(0,1500,objSun_BossT)
hitbox3=instance_create(0,1500,objSun_BossT)
hitbox4=instance_create(0,1500,objSun_BossT)

global.splash_sound=0


sequence=-1

global.boss_life=10

destroy=false

guess_mast=0

Ink=0

aura=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer
goal=true

global.resulttime=global.game_time
global.stoptime=true
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Scrape Attack
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Standard Scrape Attack
if sequence=0
{
    with hitbox{
    slide_attack=true
    spike=choose(true,false,false)
    given_x=choose(396,896)

                    global.boss_warning_t=60
                    global.boss_warning_x=min(given_x-342,358)
                    global.boss_warning_y=120}
}
// Double Scrape Attack
if sequence=1
{
    with hitbox{
    slide_attack2=true
    spike=choose(true,false,false)
    given_x=96+other.master_x

                    global.boss_warning_t=60
                    global.boss_warning_x=min(given_x-342,358)
                    global.boss_warning_y=120}

    with hitbox2{
    slide_attack2=true
    if other.hitbox.spike=false
    spike=true
    else
    spike=choose(true,false,false)
    given_x=596+other.master_x

                    global.boss_warning_t2=60
                    global.boss_warning_x2=min(given_x-342,358)
                    global.boss_warning_y2=120}
}
// Quadruple Scrape Attack
if sequence=2
{
    with hitbox{
    slide_attack2=true
    spike=choose(true,false,false)
    given_x=96+other.master_x
    depth=25}

    with hitbox2{
    slide_attack2=true
    if other.hitbox.spike=false
    spike=true
    else
    spike=choose(true,false,false)
    given_x=96+sprite_width+other.master_x
    delay=true}

    with hitbox3{
    slide_attack2=true
    if other.hitbox.spike=false || other.hitbox2.spike=false
    spike=true
    else
    spike=choose(true,false,false)
    given_x=596+other.master_x
    depth=25}

    with hitbox4{
    slide_attack2=true
    if other.hitbox.spike=false || other.hitbox2.spike=false || other.hitbox3.spike=false
    spike=true
    else
    spike=choose(true,false,false)
    given_x=596-sprite_width+other.master_x
    delay=true}
}
//sequence=choose(0,1,2)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Slam Attack
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Standard Slam Attack
if sequence=3
{
    with hitbox{
    slam_attack=true
    spike=false
    given_x=choose(396,896)

                    global.boss_warning_t=60
                    global.boss_warning_x=min(given_x-342,358)
                    global.boss_warning_y=120}
}
// Double Slam Attack
if sequence=4
{
    with hitbox{
    slam_attack2=true
    spike=false
    given_x=96+other.master_x
    delay=true
    brothers=other.hitbox2
    avoid=other.hitbox2
    to_side=1

                    global.boss_warning_t=60
                    global.boss_warning_x=min(given_x-342,358)
                    global.boss_warning_y=120}

    with hitbox2{
    slam_attack2=true
    spike=true
    given_x=596+other.master_x
    brothers=other.hitbox
    avoid=other.hitbox
    depth=25
    to_side=-1

                    global.boss_warning_t2=60
                    global.boss_warning_x2=min(given_x-342,358)
                    global.boss_warning_y2=120}
}
// Quadruple Slam Attack
if sequence=5
{
    with hitbox{
    slam_attack2=true
    spike=false
    given_x=96+other.master_x+50
    delay=4
    brothers=other.hitbox2
    avoid=other.hitbox2
    to_side=1}

    with hitbox2{
    slam_attack2=true
    spike=true
    given_x=96+sprite_width+4+other.master_x+50
    depth=25
    delay=3
    brothers=other.hitbox4
    avoid=other.hitbox3
    to_side=1}

    with hitbox3{
    slam_attack2=true
    spike=true
    given_x=596+other.master_x-50
    depth=24
    delay=2
    brothers=other.hitbox4
    avoid=other.hitbox4
    to_side=-1}

    with hitbox4{
    slam_attack2=true
    spike=true
    given_x=596-sprite_width-4+other.master_x-50
    depth=23
    delay=1
    brothers=other.hitbox3
    avoid=other.hitbox
    to_side=1}
}
//sequence=choose(0,1,2)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Big Attacks
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Standard Scrape Attack
if sequence=6
{
    with hitbox{
    final_attack=true
    spike=true
    given_x=choose(396,896)

                    global.boss_warning_t=60
                    global.boss_warning_x=min(given_x-342,358)
                    global.boss_warning_y=120}
}

// Mast Attack
if sequence=7
{
    with hitbox{
    final_attack2=true
    spike=false
    other.guess_mast=choose(96+sprite_width*2,596-sprite_width*2)
    given_x=other.guess_mast+other.master_x
    rise_delay=100}

    with hitbox2{
    hold=true
    spike=true
    given_x=96+sprite_width+other.master_x}

    with hitbox3{
    hold=true
    spike=true
    given_x=596-sprite_width+other.master_x
    rise_delay=25}
}
// Mast Attack Again
if sequence=8
{
    with hitbox{
    final_attack2=true
    spike=false

    if other.guess_mast=596-sprite_width*2
        other.guess_mast=96+sprite_width*2
    else
        other.guess_mast=596-sprite_width*2

    given_x=other.guess_mast+other.master_x}
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Flashing
*/
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

alarm[1]=2}
else
flash=false
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Ink Attack
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(random_range(96,596),1000,objSun_BossInk)

if Ink>0
{
Ink-=1
alarm[2]=30
}
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Eye Glare
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (fall_down=false && bob>=0 && darkness=1) && destroy=false
{
    eye_rot=0
    eye_alpha=0
    eye_back=false
}

alarm[3]=400
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Mast Sequence
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if destroy=false
{
    with objBossCont{
    mast=712
    alarm[0]=60}

    if fall_down=false{
    fall_down=true
    water=0
    with objController
    sound_play(sndBossOceanIn)
    }
    else
    {
    fall_down=false
    global.mask_on=false

    with objController
    sound_play(sndBossOceanOut)

    with objRing
    if y>708 && y<984
    instance_destroy()

    with objMonitor
    if y>708 && y<984
    x=-100
    }
}
else
{
    fall_down=true
    water=0
    with objController{
    sound_play(vcKrakenRoar)
    sound_play(sndBossOceanIn)}
}
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
if global.bossdamage<(174/global.boss_life)*(global.boss_life/3)
pinchbar=0
if global.bossdamage>=(174/global.boss_life)*(global.boss_life/3)
pinchbar=1
if global.bossdamage>=(174/global.boss_life)*(global.boss_life-(global.boss_life/3))
pinchbar=2

if ((pinchmove=true || pinchmove2=true)) && timer<5 || jack=true
nohit=true
else
nohit=false

if global.hitflash>0
    global.hitflash-=1

if global.splash_sound>0
    global.splash_sound-=1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Animation
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mouth+=.05
if mouth>=4
mouth=0

// FADE EFFECT
if darkness=0
{
    if destroy=false
    {
        if dark_fade<1
        {
            dark_fade+=.1

            if floor(dark_fade)=-10 && glitch_fix=-1{
            glitch_fix=0
            with objController
            sound_play(sndBossOceanOut)}

            if floor(dark_fade)=0 && glitch_fix=0{
            glitch_fix=1
            with objController
            sound_play(sndDarknessFX)}
        }
        else
        darkness=1
    }
    else
    {
        if dark_fade>-2
        {
            dark_fade-=.1
        }
    }
}
else
{
    if destroy=false
    {
        if dark_fade>-2
        {
            dark_fade-=.1

            if floor(dark_fade)=-2 && glitch_fix=1{
            glitch_fix=2
            with objController
            sound_play(vcKrakenRoar)}
        }
        else
        {
            if eye_rot<360
            eye_rot+=2
            if eye_alpha<2 && eye_back=false
            eye_alpha+=.05
            else if eye_alpha>0 && eye_back=true
            eye_alpha-=.05
            if eye_alpha>=2{
            eye_back=true
            alarm[3]=400}
        }
    }
    else
    {
        if dark_fade<1
        {
            dark_fade+=.1

            if floor(dark_fade)=0 && glitch_fix=0{
            glitch_fix=1}
        }
        else
        darkness=0
    }
}

if destroy=true || fall_down=true{
eye_alpha=0
eye_back=true
eye_rot=0}

//Bobbing up and down
if fall_down=false && bob>=0
bob_ang+=3
else
bob_ang=0

if bob_ang>=360
bob_ang-=360

if fall_down=false && bob>=0
{
real_bob=lengthdir_y(3,bob_ang)
real_bob2=lengthdir_x(3,bob_ang)
}
else
{
real_bob=0
real_bob2=0
}

// Aura
if (fall_down=false && bob>=0 && darkness=1) || aura>0
aura+=.25

if aura>=23
aura=0


// Falling and Rising
if fall_down=true
{
    if bob>-120
    {
        if destroy=false
        bob-=1
        else{
        bob-=.5
        master_x-=.5}

        if shake=0
        shake=2
        else if shake=2
        shake=0.1
        else if shake=0.1
        shake=-2
        else if shake=-2
        shake=0
    }
    else if destroy=true && master_x>-50
        master_x-=.5
}
else
{
    if bob<0
    bob+=1
}

// Water
if water<7
water+=.2

if (fall_down=true && bob>-120) || (fall_down=false && bob<0)
{
    if water>=5
    water=2
}

if fall_down=false && bob>=0
{
    water2+=.2
    if water2>=4
    water2=0
}
else
water2=4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Auto Attacks
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer) && destroy=false
{
    if objPlayer.y>=1068 && fall_down=false
    {
        if hitbox.y=hitbox.ystart && hitbox2.y=hitbox2.ystart && hitbox3.y=hitbox3.ystart && hitbox4.y=hitbox4.ystart
        {
            if attack_init>0
            {
                attack_init-=1
                if attack_init=0
                {
                    alarm[0]=30
                    randomize()
                    var seqz;
                    if pinchbar=0
                    {
                        if sequence=-1
                        sequence=3
                        else
                        {
                            seqz=choose(0,1,3,4)
                            while sequence=seqz
                            {
                                seqz=choose(0,1,3,4)
                            }
                            sequence=seqz
                        }
                    }
                    else
                    {
                        seqz=choose(1,2,4,6)
                        while sequence=seqz
                        {
                            seqz=choose(1,2,4,6)
                        }
                        sequence=seqz
                    }
                }
            }
        }
        else
        {
            attack_init=120
        }
    }
    // Mast Attacks
    else if objPlayer.y<1068 && global.mask_on=true
    {
        if !instance_exists(objEnemyParent)
        {
            if hitbox.y=hitbox.ystart
            {
                if attack_init>0
                {
                    attack_init-=1
                    if attack_init=0 && hitbox2.y=hitbox2.ystart{
                    alarm[0]=30
                    sequence=7
                    global.boss_warning_t=60
                    global.boss_warning_t2=60
                    global.boss_warning_x=24+30
                    global.boss_warning_y=180
                    global.boss_warning_x2=328+30
                    global.boss_warning_y2=180}
                    else if attack_init=0{
                    alarm[0]=30
                    sequence=8
                    }
                }
            }
            else
            attack_init=100
        }
        else
        {
            attack_init=100
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
                if flash=true && global.hitflash>0 && global.pausegame=false{
                draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
                draw_rectangle_color((view_xview-100)*.86, y-200, (view_xview+470)*.86, y+200, c_white, c_white, c_white, c_white, false);
                draw_set_blend_mode(bm_normal);}

// BG Tentacles
draw_sprite_part(sprSun_BossBGT,darkness*2,0,0,58,42+max(min(bob,0),-42)-real_bob2,floor((view_xview+pos_x+master_x)*.86)+29+floor(shake),((y+70)-bob)+real_bob2)
draw_sprite_part(sprSun_BossBGT,darkness*2+1,0,0,58,42+max(min(bob,0),-42)-real_bob2,floor((view_xview+pos_x+master_x)*.86)+131+floor(shake),((y+70)-bob)+real_bob2)

// FADE EFFECT
d3d_set_fog(true,c_white,0,0)
draw_set_blend_mode(bm_add)
draw_sprite_part_ext(sprSun_BossBGT,darkness*2,0,0,58,42+max(min(bob,0),-42)-real_bob2,floor((view_xview+pos_x+master_x)*.86)+29+floor(shake),((y+70)-bob)+real_bob2,1,1,c_white,dark_fade)
draw_sprite_part_ext(sprSun_BossBGT,darkness*2+1,0,0,58,42+max(min(bob,0),-42)-real_bob2,floor((view_xview+pos_x+master_x)*.86)+131+floor(shake),((y+70)-bob)+real_bob2,1,1,c_white,dark_fade)
draw_set_blend_mode(bm_normal)
d3d_set_fog(false,c_black,0,0)


                if flash=true && global.hitflash>0 && global.pausegame=false{
                draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
                draw_rectangle_color((view_xview-100)*.86, y-200, (view_xview+470)*.86, y+200, c_white, c_white, c_white, c_white, false);}
                draw_set_blend_mode(bm_normal)

// Water Intro BG
draw_sprite(sprSun_BossW,floor(water),floor((view_xview+pos_x+master_x)*.86)+99,y+92)
draw_sprite_ext(sprSun_BossW,floor(water),floor((view_xview+pos_x+master_x)*.86)+119,y+92,-1,1,0,c_white,1)

// Water Loop BG
if water>=6
{
    draw_sprite(sprSun_BossW2,floor(water2),floor((view_xview+pos_x+master_x)*.86)+99,y+92)
    draw_sprite_ext(sprSun_BossW2,floor(water2),floor((view_xview+pos_x+master_x)*.86)+119,y+92,-1,1,0,c_white,1)
}


                if flash=true && global.hitflash>0 && global.pausegame=false{
                draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
                draw_rectangle_color((view_xview-100)*.86, y-200, (view_xview+470)*.86, y+200, c_white, c_white, c_white, c_white, false);
                draw_set_blend_mode(bm_normal);}

// Base
draw_sprite_part(sprite_index,darkness,0,0,sprite_width,sprite_height+max(bob,-120)-real_bob,floor((view_xview+pos_x+master_x)*.86)+floor(shake),floor(y-bob)+floor(real_bob))
// Mouth
if darkness=1
draw_sprite_part(sprSun_BossM,floor(mouth),0,0,22,22+max(min(bob+12,0),-22),floor((view_xview+pos_x+master_x)*.86)+98+floor(shake),floor((y+86)-bob)+floor(real_bob))

// FADE EFFECT
d3d_set_fog(true,c_white,0,0)
draw_set_blend_mode(bm_add)
draw_sprite_part_ext(sprite_index,0,0,0,sprite_width,sprite_height+max(bob,-120)-real_bob,floor((view_xview+pos_x+master_x)*.86)+floor(shake),floor(y-bob)+floor(real_bob),1,1,c_white,dark_fade)
draw_set_blend_mode(bm_normal)
d3d_set_fog(false,c_black,0,0)

// EYE SHINE
draw_sprite_blend_ext(sprSun_BossEye,0,floor((view_xview+pos_x+master_x)*.86)+92+floor(shake),floor((y+88)-bob)+floor(real_bob),min(eye_alpha*.6,1),min(eye_alpha*.6,1),eye_rot,c_white,eye_alpha,bm_add)
draw_sprite_blend_ext(sprSun_BossEye,0,floor((view_xview+pos_x+master_x)*.86)+125+floor(shake),floor((y+88)-bob)+floor(real_bob),min(eye_alpha*.6,1),min(eye_alpha*.6,1),-eye_rot,c_white,eye_alpha,bm_add)


                if flash=true && global.hitflash>0 && global.pausegame=false{
                draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
                draw_rectangle_color((view_xview-100)*.86, y-200, (view_xview+470)*.86, y+200, c_white, c_white, c_white, c_white, false);}
                draw_set_blend_mode(bm_normal)


// Water Intro
draw_sprite(sprSun_BossW,floor(water),floor((view_xview+pos_x+master_x)*.86)+109,y+100)
draw_sprite_ext(sprSun_BossW,floor(water),floor((view_xview+pos_x+master_x)*.86)+109,y+100,-1,1,0,c_white,1)
draw_sprite(sprSun_BossW,floor(water),floor((view_xview+pos_x+master_x)*.86)+59,y+100)
draw_sprite_ext(sprSun_BossW,floor(water),floor((view_xview+pos_x+master_x)*.86)+159,y+100,-1,1,0,c_white,1)

// Water Loop FG
if water>=6
{
    draw_sprite(sprSun_BossW2,floor(water2),floor((view_xview+pos_x+master_x)*.86)+109,y+100)
    draw_sprite_ext(sprSun_BossW2,floor(water2),floor((view_xview+pos_x+master_x)*.86)+109,y+100,-1,1,0,c_white,1)
    draw_sprite(sprSun_BossW2,floor(water2),floor((view_xview+pos_x+master_x)*.86)+59,y+100)
    draw_sprite_ext(sprSun_BossW2,floor(water2),floor((view_xview+pos_x+master_x)*.86)+159,y+100,-1,1,0,c_white,1)
}

// Auras
draw_sprite_blend_ext(sprBossAura,aura,floor((view_xview+pos_x+master_x)*.86)+109,floor(y)+42,1,1,0,c_white,1,bm_add)
draw_sprite_blend_ext(sprBossAura,aura,floor((view_xview+pos_x+master_x)*.86)+49,floor(y)+42+45,.5,.5,0,c_white,1,bm_add)
draw_sprite_blend_ext(sprBossAura,aura,floor((view_xview+pos_x+master_x)*.86)+169,floor(y)+42+45,.5,.5,0,c_white,1,bm_add)
#define KeyPress_32
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if fall_down=false{
fall_down=true
water=0}
else
fall_down=false
#define KeyPress_86
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*Ink=10

alarm[2]=1
