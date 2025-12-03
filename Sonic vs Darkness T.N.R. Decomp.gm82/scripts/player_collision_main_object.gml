/*
*       player_collision_main_object( x, y, object );
*
*   =============================================
*
*   This functions returns if the main sensor has collided
*
*/

    // Store the actual mask for setting it up later
    if instance_exists(argument2)
    {
        temporal_mask   =   mask_index;
        if animation="crouch_slide" || animation="grindduck"
        mask_index      =   maskMain2;
        else
        mask_index      =   maskMain;

        // Test collision
        collision_test  =   instance_place( floor(argument0), floor(argument1), argument2 );

        // Set to the old mask
        mask_index      =   temporal_mask;

        // Calculate the direction
        return  collision_test;
    }
    return noone;
