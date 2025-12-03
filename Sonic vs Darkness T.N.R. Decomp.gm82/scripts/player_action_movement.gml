


        //--------------------- x movement ---------------------

        /*if action=action_dive{
            x_acceleration=.2
            top_x_speed=10}*/

        // only activate normal control while we're idle or jumping 
        if ( action == action_normal || action == action_jumping || action == action_trick || action == action_sliding_jump || action == action_pushing || action == action_spring_jump || action == action_super_spring_jump || action=action_dive
         || ((shield == 3 || shield == 4) && action == action_shield) || action == action_corkscrew  || action == action_corkscrew_roll || slide=1) && checknend=false && pauseplay=false && goal=false && nomove=false && nomovet=0 && move_lag=0
        {
            // acceleration
            if (action=action_corkscrew || action=action_corkscrew_roll) && (cork="up/down"||cork="swirl")
            {
                if (key_left_direct && y_speed < top_x_speed)  y_speed += x_acceleration;}
            else
            {
                if animation="crouch_slide" || animation="skiddinga" && x_speed<0 && hor_lock=0
                {
                    x_speed += x_acceleration;
                }
                else
                {
                    if (key_left_direct && x_speed > -top_x_speed) && animation!="attack" && hor_lock=0
                    {
                        x_speed -= x_acceleration;
                    }
                }
            }
            if (action=action_corkscrew || action=action_corkscrew_roll) && (cork="up/down"||cork="swirl")
            {
                if (key_right_direct && y_speed > -top_x_speed)
                y_speed -= x_acceleration;
            }
            else
            {
                if animation="crouch_slide" || animation="skiddinga" && x_speed>0 && hor_lock=0
                {
                    x_speed -= x_acceleration;
                }
                else
                {
                    if (key_right_direct && x_speed < top_x_speed) && animation!="attack" && hor_lock=0
                    {
                        x_speed += x_acceleration;
                    }
                }
            }

            // deacceleration while no key is pressed
            if (ground || action == action_corkscrew || action == action_corkscrew_roll || action=action_dive) && cork="left/right"
            {
                if (!key_left_direct && x_speed < 0)
                {
                    x_speed += x_acceleration;
                    // set to 0 when we full stop (this is performed due the floating point precision, otherwise some odd
                    // decimals will still remain in there)
                    if (x_speed > 0) x_speed  = 0;
                }

                if (!key_right_direct && x_speed > 0)
                {
                    x_speed -= x_acceleration;
                    // set to 0 when we full stop (this is performed due the floating point precision, otherwise some odd
                    // decimals will still remain in there)
                    if (x_speed < 0) x_speed = 0;
                }
            }
            // deacceleration while no key is pressed
            else if (ground || action == action_corkscrew || action == action_corkscrew_roll || action=action_dive) && (cork="up/down"||cork="swirl")
            {
                if (!key_left_direct && y_speed > 0)
                {
                    y_speed -= x_acceleration;
                    // set to 0 when we full stop (this is performed due the floating point precision, otherwise some odd
                    // decimals will still remain in there)
                    if (y_speed < 0) y_speed  = 0;
                }

                if (!key_right_direct && y_speed < 0)
                {
                    y_speed += x_acceleration;
                    // set to 0 when we full stop (this is performed due the floating point precision, otherwise some odd
                    // decimals will still remain in there)            
                    if (y_speed > 0) y_speed = 0;
                }
            }
            
            else if (ground || action=action_dive)
            {
                if (!key_left_direct && x_speed < 0)
                {
                    x_speed += x_acceleration;
                    // set to 0 when we full stop (this is performed due the floating point precision, otherwise some odd
                    // decimals will still remain in there)
                    if (slide=1 || animation="slide") && !(relative_angle > 35 && relative_angle < 325)
                    {
                    if (x_speed > -3) x_speed  = -3;}
                    else 
                    if (x_speed > 0) x_speed  = 0;
                }

                if (!key_right_direct && x_speed > 0)
                {
                    x_speed -= x_acceleration;
                    // set to 0 when we full stop (this is performed due the floating point precision, otherwise some odd
                    // decimals will still remain in there)
                    if (slide=1 || animation="slide") && !(relative_angle > 35 && relative_angle < 325)
                    {
                    if (x_speed < 3) x_speed  = 3;}
                    else            
                    if (x_speed < 0) x_speed = 0;
                }
            }


        }
        
        //Make Speed Limit
        if abs(x_speed)>max_x_speed
        x_speed-=x_acceleration*animation_direction;

        // deacceleration on slopes.
        if (ground == true && relative_angle > 35 && relative_angle < 325) && wheel=false
        {
            if ( action == action_rolling )
            {
                // first check where the character is heading to
                if ( x_speed > 0 )  // the character is heading to the right
                {
                    if ( angle < 180 ) 
                        // the character is going up a slope...
                        x_speed -=  sin(degtorad(angle)) * roll_decc_factor_up;
                    else                
                        // the character is going down a slope
                        x_speed -=  sin(degtorad(angle)) * roll_decc_factor_down;
                } 
                else // the character is heading to the left
                {            
                    if ( angle > 180 ) 
                        // the character is going up a slope...
                        x_speed -=  sin(degtorad(angle)) * roll_decc_factor_up;
                    else                      
                        // the character is going down a slope
                        x_speed -=  sin(degtorad(angle)) * roll_decc_factor_down;            
                }
            } 
            else if slide=true || animation="slide"
            {
                // first check where the character is heading to
                if ( x_speed > 0 )  // the character is heading to the right
                {
                    if ( angle < 180 )
                    {
                        // the character is going up a slope...
                        x_speed -=  sin(degtorad(angle)) * slide_decc;
                    }
                    else
                        // the character is going down a slope
                        x_speed -=  sin(degtorad(angle)) * slide_acc;
                } 
                else // the character is heading to the left
                {            
                    if ( angle > 180 )
                    {
                        // the character is going up a slope...
                        x_speed -=  sin(degtorad(angle)) * slide_decc;
                    }
                    else
                        // the character is going down a slope
                        x_speed -=  sin(degtorad(angle)) * slide_acc;
                }
            }
            else
            {
                // first check where the character is heading to
                if ( x_speed > 0 )  // the character is heading to the right
                {
                    if ( angle < 180 )
                    {
                        // the character is going up a slope...
                        x_speed -=  sin(degtorad(angle)) * slope_decc_factor;
                        if sign(x_speed)=-1 && hor_lock=0
                        hor_lock=30
                    }
                    else
                        // the character is going down a slope
                        x_speed -=  sin(degtorad(angle)) * slope_acc_factor;
                } 
                else // the character is heading to the left
                {            
                    if ( angle > 180 )
                    {
                        // the character is going up a slope...
                        x_speed -=  sin(degtorad(angle)) * slope_decc_factor;
                        if sign(x_speed)=1 && hor_lock=0
                        hor_lock=30
                    }
                    else
                        // the character is going down a slope
                        x_speed -=  sin(degtorad(angle)) * slope_acc_factor;
                }
            }
        }
        
        
        if slide=1{
        if animation!="grindduck"{
        if player_collision_left(x,y,angle,maskBig) && x_speed<0
        x_speed=x_speed*-1
        
        if player_collision_right(x,y,angle,maskBig) && x_speed>0
        x_speed=x_speed*-1}
        
        else{
        if player_collision_left(x,y,angle,maskBig2) && x_speed<0
        x_speed=x_speed*-1
        if player_collision_right(x,y,angle,maskBig2) && x_speed>0
        x_speed=x_speed*-1}
        }
        if !key_down || !place_meeting(x,y,objRailDuck)
        rollcancel=false

        // ---- Others ---------------------------------------------------------------------

        // fall if there isn't enough speed
        if (relative_angle > 80 && relative_angle < 280 && ground == true && abs(x_speed) < 3 && slide=0) && wheel=false && phase=false
        {
            y_speed =   -sin(degtorad(relative_angle))*x_speed;
            x_speed =   cos(degtorad(relative_angle))*x_speed;
            ground  =   false;
        }

        if (angle > 90 && angle < 270 && ground == true && abs(x_speed) < 3 && (slide=1 || animation="slide")) && wheel=false && phase=false
        {
            y_speed =   -sin(degtorad(angle))*x_speed;
            x_speed =   cos(degtorad(angle))*x_speed;
            ground  =   false;
        }

        // fall off the ground if the edges aren't colliding
        if (ground == true && angle != global.gravity_angle && !player_collision_bottom_object(x, y, angle, maskBig ,objSUNAnchor) &&
            (player_collision_left_edge( x, y, angle ) == false || player_collision_right_edge( x, y, angle ) == false  )) && wheel=false
        {
            y_speed =   -sin(degtorad(relative_angle))*x_speed;
            x_speed =   cos(degtorad(relative_angle))*x_speed;
            ground  =   false;
        }
        

        // get new angle
        if (ground == true && player_collision_left_edge( x, y, angle ) && player_collision_right_edge( x, y, angle )) && !player_collision_bottom_object(x, y, angle, maskBig ,objSUNAnchor)
            player_set_angle(player_get_angle( x, y, angle ));
        else
            player_set_angle(global.gravity_angle);
            
            
            
        // full stop when we're colliding a wall
        if animation!="crouch_slide" && animation!="grindduck"{
        if (x_speed > 0 && ((player_collision_right(x,y,angle,maskBig)))) && screwon=false && phase=false
        {
            homehit=true
                motion_set(0,0);
                homing=0
            x_speed = 0;
        }
        if (x_speed < 0 && ((player_collision_left(x,y,angle,maskBig)))) && screwon=false && phase=false
        {
            homehit=true
                motion_set(0,0);
                homing=0
            x_speed = 0;
        }}
        else{
        if (x_speed > 0 && player_collision_right(x,y,angle,maskBig2)) && screwon=false && phase=false
        {
            x_speed = 0;
            homehit=true
                motion_set(0,0);
                homing=0
        }
        if (x_speed < 0 && player_collision_left(x,y,angle,maskBig2)) && screwon=false && phase=false
        {
            x_speed = 0;
            homehit=true
                motion_set(0,0);
                homing=0
        }}

        //--------------------- y movement ---------------------

        if (ground) && phase=false
        {
            homehit=true
                motion_set(0,0);
                homing=0
            y_speed = 0;

            // return to the normal state if the character was jumping
            if animation!="climbrise" && animation!="climbrise2"{
            if (action == action_jumping || action == action_sliding_jump || action == action_spring_jump|| action == action_super_spring_jump
            || ((shield == 2 || shield == 3) && action == action_shield)) action = action_normal
            else if (shield == 4 && action == action_shield)
            {
                ground = false;
                y_speed =-6.5
                action = action_jumping;
            }
            else if (action == action_hurt)
            {
                action = action_normal;
                x_speed = 0;
            }

            // check if the player is really on the ground
            if (player_collision_bottom(x,y,angle,maskBig) == false)
            {
                ground = false;
                player_set_angle(global.gravity_angle);
            }
            }
        }
        else if phase=false && animation!="climbrise" && animation!="climbrise2" && nofall=0
        {
            // Add gravity
            if (action != action_sliding && action != action_pipe && action != action_corkscrew && action != action_corkscrew_roll && action != action_super_spring_jump
            && action!=action_cannon) && y_speed<max_y_speed
                y_speed += y_acceleration;

            // check if for some reason the player has landed
            if (y_speed >= 0 && player_collision_bottom(x,y,angle,maskBig) == true)
            {
                homehit=true
                motion_set(0,0);
                homing=0
                ground = true;

                // return to the normal state if the character was jumping
                if (action == action_jumping || action == action_sliding_jump || action == action_spring_jump || action == action_trick
                || ((shield == 2 || shield == 3) && action == action_shield))
                {
                    action = action_normal;
                }
                else if (shield == 4 && action == action_shield)
                {
                    ground = false;
                    y_speed =-6.5;
                    action = action_jumping;
                }
                else if (action == action_hurt)
                {
                    action = action_normal;
                    x_speed = 0;
                }
            }

            // check if we're on the air but we collided with the ceiling
            if (y_speed < 0 && player_collision_top(x,y,angle,maskBig) == true)
            if shield=4 && key_d_direct{
            y_speed=-y_speed
            sound_play(sndTrampoline)
            var bounce;
            bounce=instance_create(x,y-17,objSplashLandShield)
            bounce.image_yscale=-1}
            else
                y_speed     = 0;
        }
