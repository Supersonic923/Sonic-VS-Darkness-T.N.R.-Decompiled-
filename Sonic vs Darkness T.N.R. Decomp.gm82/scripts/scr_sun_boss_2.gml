if attack_timer=0 && move_over=false
{
    // Slam Attack
    if slam_attack=true || slam_attack2=true || final_attack2=true
    {
        with objSun_BossT{
        if brothers=objSun_Boss.hitbox4 && delay=3
        brothers=objSun_Boss.hitbox3
        if brothers=objSun_Boss.hitbox4 && delay=2
        brothers=objSun_Boss.hitbox2
        delay-=1}

        // Slam the tentacle down
        if y<slam_max && retreat=false && (final_attack2=false || (final_attack2=true && (x<=574 || x>=720)))
        {
            y+=slam_speed
            mask_index=sprite_index

            if img_spd<3
            img_spd+=img_rate
            if slam_speed<12
            slam_speed+=slam_rate

            if y>=slam_max
            {
                with objPlayer
                hitrumble=2
                global.camshake=15
                global.camlength=18
                sound_play(sndBossSlam)
                if height_max=1068 && (objSun_Boss.barrel>2 || objSun_Boss.pinch=true) && spike=false
                {
                    with instance_create(choose(264,1008),1188,objSun_Barrel){
                    if x=1008
                    hspeed*=-1}
                }
                    objSun_Boss.barrel+=1
            }
        }

        if y>=slam_max && retreat=false
        {
            slam_time-=1
            if slam_time=0
            retreat=true
        }



        // Move the tentacle off the ship
        if retreat=true
        {
            if depth<35
            depth=35
            mask_index=nomask
            if (y<1350 && final_attack2=false) || (y<780 && final_attack2=true)
            y-=move_speed
            else
            {
                if final_attack2=false
                if global.splash_sound=0{
                sound_play(sndSplash2)
                global.splash_sound=3}
                y=ystart
                retreat=false
                x=xstart
                scale=1
                move_speed=5
                attack_timer=-1
                to_side=0
                slam_attack=false
                slam_attack2=false
                final_attack2=false
                delay=false
                depth=30
                img_spd=0
                bg_fade=0
                slam_time=140
                slam_speed=0
                brothers=-1
                avoid=-1
                quad=false
                move_over=false
                height_max=1068
                slam_max=1240
            }

            if move_speed>-5
            move_speed-=.2

            scale-=.005

            if img_spd>0
            img_spd-=.1

            bg_fade+=.008
        }

    }
}
