//--------Homing attack---------------------------------------------------
        if global.player="Sonic" || global.player="Supersonic"
        {hom_sond=sndHomeAttack hom_jump=objSonicJump hom_wav=objHomeAWaveB}
        else
        {hom_sond=sndHomeAttack2 hom_jump=objShadowJump hom_wav=objHomeAWaveR}

        if homing=0
        near_hom=instance_nearest_home()
        if near_hom=0{
        with objTarget
                instance_destroy()}

        if homing=1 && near_hom!=0
        {
            if instance_exists(objHoming) && instance_exists(objTarget) && instance_exists(near_hom)
            {
                    if homehit=false
                    {
                        y_speed=0;
                        x_speed=0;
                        if animation!="rolling"{
                        action=action_normal
                        animation="rolling"}

                        move_towards_point(near_hom.x,near_hom.y,12)
                    }
                    else
                    {
                        motion_set(0,0);
                        homing=0
                    }
            }
            else
            {
                homehit=true
                motion_set(0,0);
                homing=0
            }
            if !instance_exists(objTarget)
            {
                homehit=true
                motion_set(0,0);
                homing=0
            }
        }
        if notarget=0 && near_hom!=0 && homing=0 && instance_exists(near_hom) && notargt=0
        {
            if !ground && stomp=false && lightdash=0 && (phase=false && visible=true) && action!=action_dive && path_index!=pathtrick1 && path_index!=pathtrick2 && path_index!=pathramp1
            && (action=action_normal || action=action_jumping || action=action_spring_jump)
            {
                    if !instance_exists(objTarget){
                    tg=instance_create(near_hom.x,near_hom.y,objTarget)
                    tg.near_hom=near_hom}
                    else
                    {
                    objTarget.x=near_hom.x
                    objTarget.y=near_hom.y
                    objTarget.near_hom=near_hom
                    }
                    if (key_action_pressed||home_delay=true) && stomplag<3 && animation!="homejump"
                    {
                        if homing=0{
                            homing=1;
                            sound_stop(hom_sond)
                            sound_play(hom_sond)
                            if global.specialfx>1{
                            instance_create(x,y,hom_wav)
                            if !instance_exists(hom_jump)
                            instance_create(x,y,hom_jump)}
                        }
                        homehit=false
                        home_delay=false
                    }
                    if key_action_pressed{
                    if animation="homejump" && nomovet<=25
                    home_delay=true
                    else
                    home_delay=false}

            }
            else if instance_exists(near_hom){
            with objTarget
            instance_destroy()}
        }
