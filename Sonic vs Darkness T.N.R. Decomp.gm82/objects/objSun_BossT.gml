#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hit=false
mask_index=nomask
image_speed=0
pinch=false
img_spd=0

bg_fade=0
flash=false

// Scraping the tentacle across the ship
slide_attack=false
slide_attack2=false

// Slamming the tentacle on the ship
slam_attack=false
slam_attack2=false

// Final Attacks
final_attack=false
final_attack2=false
final_time=400
final_speed=0
hold=false

slam_time=140
slam_speed=0
slam_rate=.3

img_rate=.2

attack_timer=-1

get_side=0

// Which side the tentacle should slide to
to_side=0

// Move Tentacle off the ship
retreat=false

// Smooth movement for tentacle retreat
move_speed=5

// Make sure the tentacle doesn't slam on the same spot
move_over=false

// Tentacle scale for depth
scale=1

// Ship damaging
plank=0

// Top Spikes
spike=false

// Id of other tentacles
brothers=-1
avoid=-1
quad=false

// X position assigned
given_x=0

// X position to end at
end_x=96

// Delay attack
delay=false
rise_delay=0

height_max=1068

slam_max=1240

aura=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objBossPar
invert=0
*/
#define Alarm_0
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

alarm[0]=2}
else
flash=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
if objPlayer.y<1068{
height_max=576
slam_max=672}
else
{
height_max=1068
slam_max=1240
}

if attack_timer>0
attack_timer-=1

if plank>0
plank-=1

aura+=.25

if aura>=23
aura=0

// Slide Attack
if slide_attack=true || slide_attack2=true || final_attack=true
{
    if y=ystart{
    //if slide_attack=true || final_attack=true
    //x=choose(396,896)
    //else
    x=given_x
    sound_play(sndSplash2)}

    if y>height_max && attack_timer=-1
    y-=max((y-height_max)*.1,.5)
    else if attack_timer=-1
    {
        if delay=true
        attack_timer=110
        else
        attack_timer=60

        if final_attack=true
        {
            if x>696
            final_speed=-6
            else
            final_speed=6
        }
    }
}

// Slam Attack
if slam_attack=true || slam_attack2=true || final_attack2=true
{
    if y=ystart && rise_delay=0{
    //if slam_attack=true
    //x=choose(396,896)
    //else
    x=given_x
    if final_attack2=false
    sound_play(sndSplash2)

        if x>696
        final_speed=-6
        else
        final_speed=6}

    if y>height_max && attack_timer=-1 && rise_delay=0
    y-=max((y-height_max)*.1,.5)
    else if attack_timer=-1 && rise_delay=0
    {
        //if slam_attack2=false
        {
            if delay=true || final_attack2=true
            attack_timer=180
            else
            attack_timer=90
        }
        /*else
        {
            attack_timer=90*delay
        }*/
    }
    else if attack_timer>-1 && y<=height_max && instance_exists(objPlayer) && rise_delay=0
    {
        if slam_attack2=true && attack_timer=0 && (x<avoid.x+sprite_width && x>avoid.x-sprite_width)
        {
            if move_over=false
            get_side=sign(objPlayer.x-x)*4
            x+=get_side
            move_over=true
        }
        else if (slam_attack2=true && avoid.y<=height_max) && ((x<objPlayer.x && to_side=1) || (x>objPlayer.x && to_side=-1)) //&& delay=1
            x+=min(max(((brothers.x+sprite_width*sign(x-objPlayer.x))-x)/5,-4),4)//x+=min(max((objPlayer.x-x)/5,-4),4)
        //else if (slam_attack2=true && avoid.y<=height_max)// && ((x<objPlayer.x && to_side=1) || (x>objPlayer.x && to_side=-1))
           // x+=min(max(((brothers.x+sprite_width*to_side)-x)/5,-4),4)
        else if final_attack2=true
        {
            x+=final_speed
            if (x>690) && final_speed>-4 && x>600
                final_speed-=.15
            else if (x<600) && final_speed<4 && x<690
                final_speed+=.15

                final_speed=min(max(final_speed,-4),4)
        }
        else if move_over=false
            x+=min(max((objPlayer.x-x)/5,-4),4)
        else
            move_over=false
    }
}

// Hold
if hold=true
{
    if y=ystart && rise_delay=0{
    x=given_x
    //sound_play(sndSplash2)
    }

    if y>height_max && attack_timer=-1 && rise_delay=0
    y-=max((y-height_max)*.1,.5)
    else if attack_timer=-1 && rise_delay=0
    {
        attack_timer=0
    }
}

if hit=true && global.hitflash=0
{
with objSun_Boss{
if headmove=0{
global.hitflash=60
mood=3
laugh=0
flash=true
alarm[1]=2}}

flash=true
alarm[0]=2
hit=false
}

    if rise_delay>0
    rise_delay-=1


scr_sun_boss_1()
scr_sun_boss_2()
scr_sun_boss_3()
scr_sun_boss_4()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
                if flash=true && global.hitflash>0 && global.pausegame=false{
                draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
                draw_rectangle_color(x-50, y-70, x+50, y+200, c_white, c_white, c_white, c_white, false);
                draw_set_blend_mode(bm_normal);}

draw_sprite_ext(sprSun_BossA,0,floor(x),floor(y),scale,scale,0,merge_color(c_white,c_black,bg_fade),1)
draw_sprite_ext(sprite_index,floor(img_spd),floor(x),floor(y),scale,scale,0,merge_color(c_white,c_black,bg_fade),1)
if spike=true
{
    if floor(img_spd)=3
    draw_sprite_ext(sprSun_BossSpk,0,floor(x),floor(y),scale,scale,0,merge_color(c_white,c_black,bg_fade),1)
    draw_sprite_ext(sprSun_BossSpk2,0,floor(x),floor(y),scale,scale,0,merge_color(c_white,c_black,bg_fade),1)
}

                if flash=true && global.hitflash>0 && global.pausegame=false{
                draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
                draw_rectangle_color(x-50, y-70, x+50, y+200, c_white, c_white, c_white, c_white, false);}
                draw_set_blend_mode(bm_normal)

draw_sprite_blend_ext(sprBossAura,aura,floor(x),floor(y)+122,scale,scale*2,0,c_white,1,bm_add)
