//w
        objHandle = player_collision_main_enemy(x, y, objEnemy);
        if (objHandle != noone)
        {
            if (objHandle.harmful && !invincibility)
            {
                var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) instance_destroy()}
                else
                player_hurt();}
                else
                player_hurt();
            }
            else
            {
                if (action == action_rolling || action == action_jumping || action == action_spindash || action == action_stomping || action=action_slash
                || (animation == "homeroll" || animation == "crouch_slide" || animation=="home" || animation=="homejump" || animation="jumping2"
                || animation="righttrick" || action=action_ride)
                || invincibility == 1 || invincibility == 3 || homing || shield==3) || (instance_exists(objBoostPar)) || (instance_exists(objSupersonic))
                {
                    // Bounce
                    if (!ground && y_speed>0) && action!=action_stomping
                    {
                        y_speed = -y_speed*0.99;
                    }

                    if homing=1
                    {
                        homehit=true
                        motion_set(0,0);
                        action=action_normal
                        animation="homejump" // home
                        if global.specialfx>1
                        instance_create(x,y,objSpinGlow)
                        if global.player="Sonic" || global.player="Supersonic"
                        sound_play(choose(snd,snd,vcBAttack,vcBAttack2))
                        else
                        sound_play(choose(snd,snd,vcRAttack,vcRAttack2))
                        x_speed=0
                        y_speed=-3.5
                        x=other.x
                        y=other.y
                        homing=0
                        hitrumble=10
                        nomovet=20//30
                    }
                    hitrumble=10
                    with objTarget
                    instance_destroy()
                    if global.specialfx>1
                    instance_create(mean(x,objHandle.x),mean(y,objHandle.y),objImpact);

                    // Destroy enemy
                    with(objHandle) instance_destroy();
                } else {var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) instance_destroy()}
                else
                player_hurt();}
                else
                player_hurt();}
            }
        }

                //w
        objHandle = player_collision_main_object(x, y, objEnemyForce);
        if (objHandle != noone)
        {
            if (objHandle.harmful && !invincibility)
            {
                var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) instance_destroy()}
                else
                player_hurt();}
                else
                player_hurt();
            }
            else
            {
                if (action == action_rolling || action == action_jumping || action == action_spindash || action == action_stomping || action=action_slash
                || (animation == "homeroll" || animation == "crouch_slide" || animation=="home" || animation=="homejump" || animation="jumping2"
                || animation="righttrick" || action=action_ride)
                || invincibility == 1 || invincibility == 3 || homing=1 || shield==3) || (instance_exists(objBoostPar)) || (instance_exists(objSupersonic))
                {
                    // Bounce
                    if (!ground && y_speed>0) && action!=action_stomping
                    {
                        y_speed = -y_speed*0.99;
                    }

                    if global.specialfx>1
                    instance_create(mean(x,objHandle.x),mean(y,objHandle.y),objImpact);

                    if homing=1
                    {
                        with(objHandle) instance_destroy()
                        homehit=true
                        motion_set(0,0);
                        action=action_normal
                        animation="homejump"
                        if global.specialfx>1
                        instance_create(x,y,objSpinGlow)
                        if global.player="Sonic" || global.player="Supersonic"
                        sound_play(choose(snd,snd,vcBAttack,vcBAttack2))
                        else
                        sound_play(choose(snd,snd,vcRAttack,vcRAttack2))
                        x_speed=0
                        y_speed=-3.5 // 4
                        //x=other.x
                        //y=other.y
                        homing=0
                        nomovet=20
                    }
                    else{
                    with(objHandle){ hspeed=objPlayer.x_speed instance_destroy()}}

                    hitrumble=10
                    with objTarget
                    instance_destroy()

                } else {var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) instance_destroy()}
                else
                player_hurt();}
                else
                player_hurt();}
            }
        }

        objHandle = player_collision_main_object(x, y, objEnemyBig);
        if (objHandle != noone)
        {
            if (objHandle.harmful && !invincibility)
            {
                var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3)) life-=1 blink=60}}
                else if objHandle.blink=0
                player_hurt();}
                else if objHandle.blink=0
                player_hurt();
            }
            else
            {
                if (action == action_rolling || action == action_jumping || action == action_spindash || action == action_stomping || action=action_slash
                || (animation == "homeroll" || animation == "crouch_slide" || animation=="home" || animation=="homejump" || animation="jumping2"
                || animation="righttrick" || action=action_ride)
                || invincibility == 1 || invincibility == 3 || homing=1) || (instance_exists(objBoostPar)) || (instance_exists(objSupersonic))
                {
                    // Bounce
                    if (!ground && y_speed>0) && action!=action_stomping && objHandle.blink=0
                    {
                        y_speed = -y_speed*0.99;
                    }

                    if homing=1 && objHandle.blink=0
                    {
                        homehit=true
                        motion_set(0,0);
                        action=action_normal
                        animation="homejump"
                        if global.specialfx>1
                        instance_create(x,y,objSpinGlow)
                        if global.player="Sonic" || global.player="Supersonic"
                        sound_play(choose(snd,snd,vcBAttack,vcBAttack2))
                        else
                        sound_play(choose(snd,snd,vcRAttack,vcRAttack2))
                        x_speed=0
                        y_speed=-3.5
                        x=other.x
                        y=other.y
                        homing=0
                        nomovet=20
                    }
                    if objHandle.blink=0{
                    hitrumble=10
                    with objTarget
                    instance_destroy()}

                    if objHandle.blink=0 && global.specialfx>1
                    instance_create(mean(x,objHandle.x),mean(y,objHandle.y),objImpact);

                    // Destroy enemy
                    with(objHandle){ if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2)) life-=1 blink=60
                    if life>0
                    repeat(choose(2,3))instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objBNP)}}
                } else {var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2)) life-=1 blink=60}}
                else if objHandle.blink=0
                player_hurt();}
                else if objHandle.blink=0
                player_hurt();}
            }
        }

       player_boss_handle()

        //ww
        objHandle = player_collision_main_object(x, y, objRing);
        if (objHandle != noone) && animation!="waterfall3"
        {
            with(objHandle)
            {
                if motion=false{
                global.Score+=10;
                if global.no_boost_replish=false
                {
                    if global.boost>2
                    global.boost-=2
                    else
                    global.boost=0}
                }
                collected = true;
                instance_destroy();
                sound_play(sndRing);
            }
            global.Rings += 1;
        }

        objHandle = player_collision_main_object(x, y, objRingLoss);
        if (objHandle != noone && action != action_hurt && action != action_trip) && (hurt_ring_delay = 0 || action=action_normal)
        {
            with(objHandle)
            {
                if replenish=true
                {
                    global.Score+=10;
                    if global.no_boost_replish=false{
                    if global.boost>2
                    global.boost-=2
                    else
                    global.boost=0}
                }
                collected = true;
                instance_destroy();
                sound_play(sndRing);
            }
            global.Rings += 1;
        }

        //ww
        objHandle = player_collision_main_object(x, y, objRingD);
        if (objHandle != noone && action != action_hurt && action != action_trip) && global.HUB=false
        {
            with(objHandle)
            {
                if motion=false{
                global.Score+=10;
                if global.boost>2
                global.boost-=2
                else
                global.boost=0}
                collected = true;
                instance_destroy();
                sound_play(sndRing);
            }
            global.Rings += 1;
        }

        // ---- Ramps ----------------------------------------------------------------------
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objRampJump);
        if (objHandle != noone)
        {
            if x_speed<=3 && ground=true
            x_speed+=x_acceleration*4
        }
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objButtonJump);
        if (objHandle != noone)
        {
            if x_speed<=3 && ground=true
            x_speed+=x_acceleration*4
        }
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objTrickJump);
        if (objHandle != noone)
        {
            if x_speed<=3 && ground=true
            x_speed+=x_acceleration*4
        }
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objPushJump);
        if (objHandle != noone)
        {
            if x_speed<=3 && ground=true
            x_speed+=x_acceleration*4
        }
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objSmRamp);
        if (objHandle != noone)
        {
            if x_speed<=3 && ground=true
            x_speed+=x_acceleration*4
        }

        // ---- Bumpers ------------------------------------------------------------------------------
        objHandle = player_collision_main_object(x, y, objBumper);
        if (objHandle != noone)
        {
            action=action_jumping
            // Get the angle between the bumper and Sonic and then reset the and y speeds
            angle_to_bumper = degtorad(round(wrap_angle(point_direction(x, y, objHandle.x, objHandle.y)-90)/22.5)*22.5);
            x_speed = sin(wrap_angle(angle_to_bumper-global.gravity_angle))*7;
            y_speed = cos(wrap_angle(angle_to_bumper-global.gravity_angle))*7;

            objHandle.alarm[0]    = 20;
            objHandle.image_speed = 0.5;
            ground = false;
            objHandle.limit+=1
            if objHandle.limit<6
            global.Score += 20;
            sound_play(sndBumper);
            if global.specialfx>2
            instance_create(objHandle.x,objHandle.y,objSpinGlowW)
            hitrumble=5

        }

        // ---- Rotating Wheel ----------------------------------------------------------------------
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objGravityWheel);
        if (objHandle != noone)
        {
            wheel = true;
        }
        else
        wheel=false

        // ---- Conveyor Belt ----------------------------------------------------------------------
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objConveyorBelt);
        if (objHandle != noone) && ground=true
        {
            if objHandle.reverse=false{ if player_collision_left( x, y, angle, maskBig ) == false
            x-=max(x_speed*.5,2)}
            else{ if player_collision_right( x, y, angle, maskBig ) == false
            x+=max(-x_speed*.5,2)}
        }
        //objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objInvConveyor);
        if instance_exists(objBossLooper) && goal=false //(objHandle != noone) && ground=true
        {
            var x1view;
            x1view=view_xview[1]+view_wview[1]

            if player_collision_left( x-max(x_speed*.6,8), y, angle, maskBig ) == false && animation!="homeroll" && homing=0{
            if (checknend=true && !instance_exists(objBossPar) && x<=x1view-view_wview[1]/2 && x>(x1view-view_wview[1]/2)-10)
            || (checknend=true && instance_exists(objBossPar) && x<=x1view-view_wview[1]/1.5 && x>(x1view-view_wview[1]/1.5)-10)
            conx=-(global.bossspeed+2)//x-=10
            else if (checknend=true && !instance_exists(objBossPar) && x>x1view-view_wview[1]/2) || (checknend=true && instance_exists(objBossPar) && x>x1view-view_wview[1]/1.5) && objBossLooper.localspeed<=global.bossspeed
            conx=-(global.bossspeed+4)//x-=12
            else if checknend=true && global.bossspeed>objBossLooper.localspeed
            conx=-(x_speed)-1//x-=10
            else
            conx=-max(x_speed*.6,global.bossspeed)//x-=max(x_speed*.6,8)

            if action=action_hurt
            conx=-global.bossspeed/6

            if animation="crouch_slide" || animation="crouch_slide2"
            conx=-global.bossspeed/1.2

            x   +=  cos(degtorad(angle)) * conx;
            y   -=  sin(degtorad(angle)) * conx;}
        }

        // ---- Pole Slide ----------------------------------------------------------------------
        objHandle = player_collision_main_object(x, y, objPoleTwirl);
        if (objHandle != noone) && twirl=0 && action!=action_hurt
        {
            if action!=action_twirl
            {
            homing=0
            sound_stop(sndPoleSlide)
            sound_loop(sndPoleSlide)
            action=action_twirl
            x=objHandle.x}
        }
        else if action=action_twirl{
        action=action_normal}
        if twirl>0
        twirl-=1

        // ---- Pole Bounce ----------------------------------------------------------------------
        objHandle = player_collision_bottom_object(x, y, angle, maskBig, objPoleBounce);
        if (objHandle != noone) && ground=false && y_speed>0
        {
            if y<objHandle.y-7{
            sound_play(sndPoleBounce)
            objHandle.sprite_index=sprPoleBounceA
            objHandle.image_index=0
            stomplag    =   10;
            action=action_normal
            animation="ramp"
            animation_reset=true
            x_speed=0
            y_speed=-min((objHandle.x-x)/objHandle.bounce_rate+3,objHandle.bounce_max)}
        }
        objHandle = player_collision_bottom_object(x, y, angle, maskBig, objPoleBounce2);
        if (objHandle != noone) && ground=false && y_speed>0
        {
            if y<objHandle.y-7{
            sound_play(sndPoleBounce)
            objHandle.sprite_index=sprPoleBounce2A
            objHandle.image_index=0
            stomplag    =   10;
            action=action_normal
            animation="ramp"
            animation_reset=true
            x_speed=0
            y_speed=-min((x-objHandle.x)/objHandle.bounce_rate+3,objHandle.bounce_max)}
        }


        // ---- Capsule ----------------------------------------------------------------------
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objCapsuleTop);
        if (objHandle != noone) && ground=true
        {
            ground=false
            action=action_jumping
            y_speed=-3
            with objHandle
            instance_destroy()
        }

        // ---- Falling Platforms ------------------------------------------------------------
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objFallPlatform);
        if (objHandle != noone) && ground=true
        {
            with objHandle
            {
                if fall=0{
                fall=60
                vspeed=2}
            }
        }


        // ---- Tunnels ----------------------------------------------------------------------

        // DOWN
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objTubeD);
        if (objHandle != noone) && action!=action_pipe && y_distance>0
        {
            if y_speed<=0
            y_speed=y_distance
            angle=0
            ground=false
            x=objHandle.x+16
            action=action_pipe
            tun_d="down"
            with objBoostPar
            instance_destroy()
            sound_play(sndSpinDashCharge2)
            //if room=rmSUNLIGHT || room=rmSUNLIGHT2
            //depth=20
        }
        objHandle = player_collision_main_object(x, y, objTubeD);
        if (objHandle != noone) && action=action_pipe && y_speed<0
        {
            with objHandle
            {
                if place_meeting(x,y,objSUNRock)
                with instance_place(x,y,objSUNRock)
                instance_destroy()
            }
            instance_create(objHandle.x+16,objHandle.y,objTunnelSteam)
            action=action_spring_jump
            animation="jumping2"
            y_speed=-8
            tun_d=""
            phase=false
            y=objHandle.y
        }

        // UP
        objHandle = player_collision_top_object(x, y, angle, maskBig ,objTubeU);
        if (objHandle != noone) && action!=action_pipe && y_distance<0
        {
            if y_speed>=0
            y_speed=y_distance
            angle=0
            ground=false
            x=objHandle.x+16
            action=action_pipe
            tun_d="up"
            sound_play(sndSpinDashCharge2)
            with objBoostPar
            instance_destroy()
            //if room=rmSUNLIGHT || room=rmSUNLIGHT2
            //depth=20
        }
        objHandle = player_collision_main_object(x, y, objTubeU);
        if (objHandle != noone) && action=action_pipe && y_speed>0
        {
            with objHandle
            {
                if place_meeting(x,y,objSUNRock)
                with instance_place(x,y,objSUNRock)
                instance_destroy()
            }
            action=action_spring_jump
            v=instance_create(objHandle.x+16,objHandle.y+32,objTunnelSteam)
            v.image_angle=180
            animation="jumping2"
            y_speed=8
            tun_d=""
            phase=false
            y=objHandle.y
        }

        // LEFT
        objHandle = player_collision_left_object(x, y, angle, maskBig ,objTubeL);
        if (objHandle != noone) && action!=action_pipe && x_distance<0
        {
            if x_speed>=0
            x_speed=x_distance
            angle=0
            ground=false
            y=objHandle.y+16
            action=action_pipe
            tun_d="left"
            sound_play(sndSpinDashCharge2)
            with objBoostPar
            instance_destroy()
            //if room=rmSUNLIGHT || room=rmSUNLIGHT2
            //depth=20
        }
        objHandle = player_collision_main_object(x, y, objTubeL);
        if (objHandle != noone) && action=action_pipe && x_speed>0
        {
            with objHandle
            {
                if place_meeting(x,y,objSUNRock)
                with instance_place(x,y,objSUNRock)
                instance_destroy()
            }
            v=instance_create(objHandle.x+18,objHandle.y+16,objTunnelSteam)
            v.image_angle=-90
            action=action_spring_jump
            animation="jumping2"
            x_speed=max(abs(x_speed),abs(y_speed),8)
            tun_d=""
            phase=false
            x=objHandle.x
        }

        // RIGHT
        objHandle = player_collision_right_object(x, y, angle, maskBig ,objTubeR);
        if (objHandle != noone) && action!=action_pipe && x_distance>0
        {
            if x_speed<=0
            x_speed=x_distance
            angle=0
            ground=false
            y=objHandle.y+16
            action=action_pipe
            tun_d="right"
            sound_play(sndSpinDashCharge2)
            with objBoostPar
            instance_destroy()
            //if room=rmSUNLIGHT || room=rmSUNLIGHT2
            //depth=20
        }
        objHandle = player_collision_main_object(x, y, objTubeR);
        if (objHandle != noone) && action=action_pipe && x_speed<0
        {
            with objHandle
            {
                if place_meeting(x,y,objSUNRock2)
                with instance_place(x,y,objSUNRock2)
                instance_destroy()
            }
            v=instance_create(objHandle.x+18,objHandle.y+16,objTunnelSteam)
            v.image_angle=90
            action=action_spring_jump
            if global.player="Shadow"
            animation="jumping3"
            else
            animation="jumping2"
            x_speed=max(abs(x_speed),abs(y_speed),8)*-1
            tun_d=""
            phase=false
            x=objHandle.x
        }

        if tun_d="down"{
        y_speed=max(abs(x_speed),abs(y_speed),8)
        x_speed=0
        with objBBoostTrail
        destroy=true}
        if tun_d="up"{
        y_speed=max(abs(x_speed),abs(y_speed),8)*-1
        x_speed=0
        with objBBoostTrail
        destroy=true}
        if tun_d="left"{
        x_speed=max(abs(x_speed),abs(y_speed),8)*-1
        y_speed=0
        with objBBoostTrail
        destroy=true}
        if tun_d="right"{
        x_speed=max(abs(x_speed),abs(y_speed),8)
        y_speed=0
        with objBBoostTrail
        destroy=true}

        if tun_d!=""
        phase=true

        if room=rmNIGHT || room=rmNIGHT2
        object_nightlite()
        if room=rmSUNLIGHT || room=rmSUNLIGHT2 || room=rmSUNLIGHTB
        object_sunlight()
