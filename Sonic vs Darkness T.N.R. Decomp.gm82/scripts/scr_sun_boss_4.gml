if attack_timer=0
{
    // HOLD
    if hold=true && rise_delay=0
    {
        // Slam the tentacle down
        if y<slam_max && retreat=false
        {
            y+=slam_speed
            mask_index=sprite_index

            if img_spd<3
            img_spd+=img_rate
            if slam_speed<12
            slam_speed+=slam_rate

            if y>=slam_max
            {
                sound_play(sndBossSlam)
            }
        }

        if y>=slam_max && retreat=false
        {
            // Decide which side to slide to based on position
            if final_time>0
            {
                //final_time-=1
            }
            else
            {
                retreat=true
            }
        }



        // Move the tentacle off the ship
        if retreat=true
        {
            if depth<35
            depth=35
            mask_index=nomask
            if y<780
            y-=move_speed
            else
            {
                //sound_play(sndSplash2)
                y=ystart
                retreat=false
                x=xstart
                scale=1
                move_speed=5
                attack_timer=-1
                to_side=0
                hold=false
                delay=false
                depth=30
                img_spd=0
                bg_fade=0
                slam_speed=0
                brothers=-1
                avoid=-1
                quad=false
                move_over=false
                height_max=1068
                slam_max=1240
                final_time=400
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
