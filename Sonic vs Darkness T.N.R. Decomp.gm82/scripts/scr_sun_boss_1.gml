if attack_timer=0
{
    // Slide Attack
    if slide_attack=true || slide_attack2=true
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
            if to_side=0
            {
                if x<646
                to_side=1
                else
                to_side=-1

                if slide_attack=true
                {
                    if to_side=-1
                    end_x=396
                    else
                    end_x=896
                }
                else
                {
                    if to_side=-1
                    end_x=646+sprite_width/2
                    else
                    end_x=646-sprite_width/2
                }
            }
            else
            {
                if to_side=1
                {
                    if x<end_x
                    {
                        x+=5

                        with objPlayer
                        hitrumble=2
                        global.camshake=10
                        global.camlength=8

                        if plank=0
                        repeat(choose(2,3))
                        {
                            with instance_create(x-5,y+10,objSun_BossDeb){
                            hspeed=random_range(-3,-10)
                            vspeed=random_range(-3,-10)}
                            plank=5
                        }
                    }
                    else
                    retreat=true
                }
                else if to_side=-1
                {
                    if x>end_x
                    {
                        x-=5

                        with objPlayer
                        hitrumble=2
                        global.camshake=5
                        global.camlength=8

                        if plank=0
                        repeat(choose(2,3))
                        {
                            with instance_create(x+5,y+10,objSun_BossDeb){
                            hspeed=random_range(3,10)
                            vspeed=random_range(-3,-10)}
                            plank=5
                        }
                    }
                    else
                    retreat=true
                }
            }
        }



        // Move the tentacle off the ship
        if retreat=true
        {
            if depth<35
            depth=35
            mask_index=nomask
            if y<1350
            y-=move_speed
            else
            {
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
                slide_attack=false
                slide_attack2=false
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
