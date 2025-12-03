/*
*       player_collision_bottom_obj( x, y, angle, mask, object );
*
*   =============================================
*
*   This functions returns if the bottom sensor has collided
*
*/

    /* Up and down collision functions works in a very similar way than the
       left/right ones. The only difference is in how we swap the trigonometric
       functions in order to calculate the position projected over the Y axys. For
       example:

       If for calculating the x projected/rotated positions is:

        rotated_x = x + cos( angle ) * distance;
        rotated_y = y - sin( angle ) * distance;

       The same for y projected/rotated position is:
        rotated_x = x + sin( angle ) * distance;
        rotated_y = y + cos( angle ) * distance;

       This is the main difference. The other stuff is the same
    */

    // Store the actual mask for setting it up later
    if instance_exists(argument4)
    {
        temporal_mask   =   mask_index;
        mask_index      =   argument3;

        // Test collision
            if (y_speed >= 0){
        collision_test = place_meeting(floor(argument0 + sin(degtorad(argument2)) * 11),
                                           floor(argument1 + cos(degtorad(argument2)) * 11),
                                           argument4) &&
                            !place_meeting(floor(argument0), floor(argument1), argument4);}





                          mask_index=temporal_mask;

        return  collision_test;
    }
    return noone;
