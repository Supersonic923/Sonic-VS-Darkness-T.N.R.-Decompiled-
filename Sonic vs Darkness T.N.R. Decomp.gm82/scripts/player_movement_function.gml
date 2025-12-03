
                //Squish Player
        /*if animation!="crouch_slide" && animation!="grindduck"
        if (player_collision_top_obj(x,y,angle,maskMid,objCrushBlock)) || player_collision_main_object( x, y, objCrushBlock)
        if (player_collision_bottom_obj(x,y,angle,maskMid,objSolid))
        //if !(player_collision_left_object(x,y,angle,maskMid,objSolid))
        //if !(player_collision_right_object(x,y,angle,maskMid,objSolid))
        instance_destroy()

        if animation!="crouch_slide" && animation!="grindduck"
        if((player_collision_top_obj(x,y,angle,maskMid,objSolid)) && slide=1)
        instance_destroy()

        if animation!="grindduck" && slide=1
        if (player_collision_left_object(x,y,angle,maskBig,objDuckDeath)) || (player_collision_right_object(x,y,angle,maskBig,objDuckDeath))
        || player_collision_main_object( x, y , objDuckDeath)
        instance_destroy()*/

        if (player_collision_top_obj(x,y,angle,maskMid,objCrushBlock)) || player_collision_main_object( x, y, objCrushBlock)
        if (player_collision_bottom_obj(x,y,angle,maskMid,objSolid))
        instance_destroy()




    // movement control

    // ========== PART 1 ==============================================================================================
        /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         -> X movement.
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        */

        x   +=  cos(degtorad(angle)) * x_speed;
        y   -=  sin(degtorad(angle)) * x_speed;

        if x_speed<0
        hook=-1
        if x_speed>0
        hook=1
        if x_speed=0
        hook=0

            // move the player outside in case he has got stuck into the wall and stops from teleporting
            while (x_speed > 0 && (player_collision_right( x, y, angle, maskMid ) == true)) && phase=false
            {
                x   -=  cos(degtorad(angle));
                y   +=  sin(degtorad(angle));
            }

            while (x_speed < 0 && (player_collision_left( x, y, angle, maskMid ) == true)) && phase=false
            {
                x   +=  cos(degtorad(angle));
                y   -=  sin(degtorad(angle));
            }


    // ========== PART 2 ==============================================================================================
        /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         -> Y movement.
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        */

        if (ground == false)
        {
            if action=action_super && y_speed<0
            y   -=  abs(y_speed);
            else if action!=action_super
            y   +=  y_speed;

                // Homing Stopper
                while (player_collision_top( x, y, angle, maskMid ) == true ) && homing=1 // while
                {
                y+=1
                homehit=true
                motion_set(0,0);
                homing=0
                y=yprevious
                }
                while (player_collision_bottom( x, y, angle, maskMid ) == true ) && homing=1 // while
                {
                y-=1
                homehit=true
                motion_set(0,0);
                homing=0
                y=yprevious
                }

                // move the player outside in case he has got stuck into the floor or the ceiling
                while (y_speed < 0 && player_collision_top( x, y, 0, maskMid ) == true ) && phase=false // while
                {
                    y   +=  1;
                        homehit=true
                        motion_set(0,0);
                        homing=0
                }

                while (y_speed > 0 && player_collision_bottom( x, y, 0, maskMid ) == true ) && phase=false // while
                {
                    y   -=  1;
                        homehit=true
                        motion_set(0,0);
                        homing=0
                }

                //EDGE FLICKER FIX
                if edgetime>0
                    edgetime-=1
                if (y_speed >= 0 && player_collision_bottom( x, y, 0, maskBig ) == true) && phase=false
                    if edgetime>0
                        edgefix=true

                if edgefix=true
                {
                    x+=animation_direction
                    edgefix=false
                }

                // check for landing
                if (y_speed >= 0 && player_collision_bottom( x, y, 0, maskBig ) == true) && phase=false
                {
                    if ( player_collision_left_edge( x, y, 0) && player_collision_right_edge( x, y, 0) ) && !player_collision_bottom_object(x, y, angle, maskBig ,objSUNAnchor)
                        angle   =   player_get_angle( x, y, 0);
                    else
                        angle   =   0;

                        homehit=true
                        motion_set(0,0);
                        homing=0

                    x_speed -=  sin(degtorad(angle)) * y_speed;
                    if shield=4 && key_d_direct
                    {
                        ground=false
                        if y_speed<12
                        y_speed=-y_speed*.99
                        else
                        y_speed=-12
                        action=action_jumping
                        sound_play(sndTrampoline)
                        instance_create(x,y+17,objSplashLandShield)
                    }
                    else
                    {
                        y_speed =   0;
                        ground  =   true;

                        edgetime=4
                        if player_collision_main_object(x, y, objNIGHTCoaster)!=noone
                        landsnd=snd
                        else if (player_collision_watrLD( x, y, angle ) == true)
                        landsnd=watrL
                        else if (player_collision_woodLD( x, y, angle ) == true)
                        landsnd=woodL
                        else if (player_collision_concLD( x, y, angle ) == true)
                        landsnd=concL
                        else if (player_collision_metalLD( x, y, angle ) == true)
                        landsnd=mtlL
                        else
                        landsnd=comL

                        if action=action_normal
                        sound_play(landsnd)

                        if (action == action_spring_jump)
                        {
                            action=action_normal;
                            if animation!="spinboost"{
                            animation="ground_roll"
                            groll=true}
                            sound_play(landsnd)
                        }

                        // return to the normal state if the character was hurt
                        if (action == action_hurt) || (action == action_trip)
                        {
                            action = action_normal;
                            if instance_exists(objBossLooper)
                            x_speed=5
                        }
                        // return to the normal state if the character was jumping
                        if (action == action_jumping || action == action_sideroll || action == action_hang || action == action_trick
                            || action=action_waterfall)
                        {
                            action = action_normal;
                            sound_play(landsnd)
                        }
                        if (action == action_stomping)
                        {
                            //action = action_normal;
                        }
                        if player_collision_bottom_obj(x,y,angle,maskBig,objWaterSpout){
                        animation="waterspout"
                        animation_direction=1}
                    }
                }

            // wall collision (yeah, again, we should perform that since the y axys has recently changed)
            while (player_collision_right( x, y, angle, maskMid ) == true ) && phase=false // while
            {
                x   -=  cos(degtorad(angle));
                y   +=  sin(degtorad(angle));
                homehit=true
                motion_set(0,0);
                homing=0
            }

            while (player_collision_left( x, y, angle, maskMid ) == true ) && phase=false // while
            {
                x   +=  cos(degtorad(angle));
                y   -=  sin(degtorad(angle));
                homehit=true
                motion_set(0,0);
                homing=0
            }
        }

    // ========== PART 3 ==============================================================================================
        /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         -> Slopes!
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        */
        if (ground == true) && phase=false
        {


            if ( player_collision_main( x, y )) && ( !player_collision_main2( x, y ,angle,maskMid) ) &&
            !(angle=0 && (animation="crouch_slide" || animation="grindduck"))
            {
                do
                {
                    x   -=  sin(degtorad(angle));
                    y   -=  cos(degtorad(angle));
                } until ( !player_collision_main( x, y ) )
                homehit=true
                motion_set(0,0);
                homing=0
            }
            else if ( player_collision_main_object( x, y, objPlatform) )  && instance_exists(objPlatform) && animation!="grindduck" && action!=action_elevator
            {
                if y<instance_nearest(x,y,objPlatform).y{
                do
                {
                    x   -=  sin(degtorad(angle));
                    y   -=  cos(degtorad(angle));
                } until ( !player_collision_main_object( x, y , objPlatform) )
                homehit=true
                motion_set(0,0);
                homing=0}
            }
            if ( player_collision_slope( x, y, angle, maskMid ) && !player_collision_main( x, y ) )
            {
                do
                {
                    x   +=  sin(degtorad(angle));
                    y   +=  cos(degtorad(angle));
                } until ( player_collision_main( x, y ) )
                homehit=true
                motion_set(0,0);
                homing=0
            }
        }
        if ground=false && phase=false
        if ( player_collision_main_object( x, y , objPlatform) )  && instance_exists(objPlatform) && animation!="grindduck" && action!=action_elevator
            {
                if y_speed>15{
                do
                {
                    y   -=  cos(degtorad(angle));
                } until ( !player_collision_main_object( x, y , objPlatform) )}
            }

    // ========== PART 4 ==============================================================================================
        /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         -> Other stuff
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        */

        // fall if there isn't enough speed
        //--ground
        if (angle > 80 && angle < 280 && ground == true && abs(x_speed) < 3 && slide=0) && wheel=false && phase=false
        {
            y_speed =   -sin(degtorad(angle))*x_speed;
            x_speed =   cos(degtorad(angle))*x_speed;
            ground  =   false;
        }
        //--rail
        if (angle > 90 && angle < 270 && ground == true && abs(x_speed) < 3 && (slide=1 || animation="slide")) && wheel=false && phase=false
        {
            y_speed =   -sin(degtorad(angle))*x_speed;
            x_speed =   cos(degtorad(angle))*x_speed;
            ground  =   false;
        }
        
        // fall off the ground if the edges aren't colliding
        if (ground == true && angle != 0 &&
            (player_collision_left_edge( x, y, angle ) == false || player_collision_right_edge( x, y, angle ) == false  )) && wheel=false
        {
            y_speed =   -sin(degtorad(angle))*x_speed;
            x_speed =   cos(degtorad(angle))*x_speed;
            ground  =   false;
        }

        // get new angle
        if (ground == true && player_collision_left_edge( x, y, angle ) && player_collision_right_edge( x, y, angle ))
        && !player_collision_bottom_object(x, y, angle, maskBig ,objSUNAnchor)
        && phase=false
        {
            // Store the new angle
            angle_holder   =   player_get_angle( x, y, angle );

            // Check if difference is less than 45. If it is, linear interpolate the angle, so it results on smoother rotation.
            // Otherwise, set the new angle normally. Remember that linear interpolation formula is the next:
            //
            // final = a*t + b*(1-t); where t is the interpolation value, wich goes from 0 to 1
            //
            // There's also a shorter and faster method, wich is the one we're going to use:
            //
            // final = a + (b-a)*t;

            if (abs(angle-angle_holder)<45) angle = angle + (angle_holder-angle)*0.5;
            else                            angle = angle_holder;
        } else {
            angle   =   0;
        }

        // Calculate distance between current position and previous position
        x_distance=x-xprevious
        y_distance=y-yprevious

        //Moving Platforms
        //Execute the script
        scrPlayerHandleObjectsMovingPlatform();
