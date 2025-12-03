 //BOSSES
        objHandle = player_collision_main_enemy(x, y, objBossHitArea);
        if (objHandle != noone)
        {
            if room=rmBOSSRUN
            {
                if global.hitflash=0 && objNight_Boss.nohit=false
                {
                    if (action == action_rolling || action == action_jumping || action == action_spindash || action == action_stomping || action=action_slash
                    || (animation == "homeroll" || animation == "crouch_slide" || animation=="home" || animation=="homejump" || animation="jumping2"
                    || animation="righttrick" || action=action_ride)
                    || invincibility == 1 || invincibility == 3 || homing || shield==3) || (instance_exists(objBoostPar)) || (instance_exists(objSupersonic))
                    {
                        // Bounce
                        if (!ground)
                        {
                            action=action_jumping
                            // Get the angle between the bumper and Sonic and then reset the and y speeds
                            angle_to_bumper = degtorad(round(wrap_angle(point_direction(x, y, objHandle.x, objHandle.y)-90)/22.5)*22.5);
                            x_speed = max(sin(wrap_angle(angle_to_bumper-global.gravity_angle))*7,0);
                            y_speed = cos(wrap_angle(angle_to_bumper-global.gravity_angle))*7;
                        }

                        /*if homing=1
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
                        }*/
                        hitrumble=10
                       // with objTarget
                        //instance_destroy()
                        if global.specialfx>1
                        instance_create(mean(x,objHandle.x),mean(y,objHandle.y),objImpact);

                        global.Score+=300

                        if global.boost>5
                        global.boost-=5
                        else
                        global.boost=0

                        // Destroy enemy
                        with(objHandle)
                        {
                            global.bossdamage+=174/global.boss_life
                            if global.bossdamage>=174
                            instance_destroy()
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
                            if global.bossdamage>=(174/global.boss_life)*(global.boss_life-(global.boss_life/3)) && pinch=false//(174/global.boss_life)*(global.boss_life-3)
                            {
                            sound_play(choose(vcEHurtP,vcEHurtP2,vcEHurtP,))
                            pinch=true}
                            else{
                            with objBossPar
                            hurt_choose()}
                            hit=true}
                        }
                    } else {

                    player_hurt();}
                }
            }
            else
            {
                if global.hitflash=0 && objSun_Boss.nohit=false
                {
                    if ((action == action_jumping || action == action_stomping || action=action_slash
                    || (animation == "homeroll" || animation=="home" || animation=="homejump" || animation="jumping2")
                    || invincibility == 1 || invincibility == 3 || homing || shield==3) || (instance_exists(objBoostPar)) || (instance_exists(objSupersonic)))
                    && y<objHandle.y && objHandle.spike=false
                    {
                        // Bounce
                        if (!ground)
                        {
                            action=action_jumping
                            // Get the angle between the bumper and Sonic and then reset the and y speeds
                            angle_to_bumper = degtorad(round(wrap_angle(point_direction(x, y, objHandle.x, objHandle.y)-90)/22.5)*22.5);
                            x_speed = max(sin(wrap_angle(angle_to_bumper-global.gravity_angle))*7,0);
                            y_speed = cos(wrap_angle(angle_to_bumper-global.gravity_angle))*7;
                        }
                        hitrumble=10
                        if global.specialfx>1
                        instance_create(mean(x,objHandle.x),mean(y,objHandle.y),objImpact);

                        global.Score+=300

                        // Destroy enemy
                        with(objHandle)
                        {
                            retreat=true
                            global.bossdamage+=174/global.boss_life

                            if global.bossdamage>=174{
                            sound_play(sndBossDamage2)
                            sound_play(sndBossExplode)
                            with objSun_Boss{
                            dark_fade=-1
                            glitch_fix=0
                            destroy=true
                            alarm[4]=60}
                            with objSun_Barrel
                            {
                                des=true
                                instance_destroy()
                            }
                            hit=true
                            with objBossCont
                            alarm[1]=400}
                            else{
                            sound_play(vcKrakenHurt)
                            sound_play(sndBossDamage2)
                            if global.bossdamage>=(174/global.boss_life)*(global.boss_life-(global.boss_life/3)) && objSun_Boss.pinch=false//(174/global.boss_life)*(global.boss_life-3)
                            {
                                with objSun_Boss{
                                alarm[4]=100
                                pinch=true}
                                with objSun_BossT{
                                if y!=ystart
                                retreat=true}
                            //sound_play(choose(vcEHurtP,vcEHurtP2,vcEHurtP,))
                            }
                            // Bot spawning
                            if global.bossdamage>=(174/global.boss_life)*(global.boss_life/3) && objSun_Boss.pinch=false && objSun_Boss.pinch_half=true
                            {
                                with instance_find(objSUNWaterGun2,0)//instance_nearest(x,y,objSUNWaterGun2)
                                {
                                    alarm[2]=50
                                }
                            }
                            if global.bossdamage>=(174/global.boss_life)*(global.boss_life/3) && objSun_Boss.pinch_half=false
                            {
                                with objSun_Boss{
                                alarm[4]=60
                                pinch_half=true}
                                with objSun_Barrel
                                {
                                    des=true
                                    instance_destroy()
                                }
                            }
                            hit=true}
                        }
                    } else {

                    player_hurt();}
                }
            }
        }
