/*
*       player_collision_main2( x, y, angle, mask);
*
*   =============================================
*
*   This functions returns if the main sensor has collided
*
*/

    /* This function is used essentially for collision detection with slopes up.
       It just detect collision of the main sensor (the big sensor that involves the
       main collisions).
    */

    // Store the actual mask for setting it up later
    temporal_mask   =   mask_index;
    mask_index      =   argument3;

    // Transform angle to radians and precalculate cosine and sine
    argument2   = degtorad(argument2);
    cosine      = cos(argument2);
    sine        = sin(argument2);

    // Test collision
    collision_test  =   player_collision( floor(argument0 - sine * 8),
                          floor(argument1 - cosine * 8), layer );

    // Set to the old mask
    mask_index      =   temporal_mask;

    // Calculate the direction
    return  collision_test;
