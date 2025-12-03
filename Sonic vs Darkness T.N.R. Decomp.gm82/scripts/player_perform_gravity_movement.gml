

    // ---- Calculate movement speed for Y -------------------------------------
    var _MovementSpeed, _MovementSteps, _Movement;

    _MovementSpeed = 0;

    if (action != action_climb)
    {
       exit;
    }

    else if (action == action_climb)
    {
       _MovementSpeed = ClimbRate*ClimbMotion;
    }

            //Actual movement
                x   +=  _MovementSpeed*sin(degtorad(angle));
                y   +=  _MovementSpeed*cos(degtorad(angle));

                // move the player outside in case he has got stuck into the floor or the ceiling
                while (player_collision_top( x, y, 0, maskMid ) == true )
                {
                    x += sin(degtorad(angle));
                    y += cos(degtorad(angle));
                }

                while (player_collision_bottom( x, y, 0, maskMid ) == true )
                {
                    y   -=  cos(degtorad(angle));
                }


            // wall collision (yeah, again, we should perform that since the y axys has recently changed)
            while (player_collision_right( x, y, angle, maskMid ) == true )
            {
                x   -=  cos(degtorad(angle));
                y   +=  sin(degtorad(angle));
            }

            while (player_collision_left( x, y, angle, maskMid ) == true )
            {
                x   +=  cos(degtorad(angle));
                y   -=  sin(degtorad(angle));
            }
