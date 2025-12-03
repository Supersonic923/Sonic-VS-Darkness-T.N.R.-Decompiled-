    temporal_mask   =   mask_index;
    mask_index      =   maskMid;

    // Test collision
    collision_test  =   player_collision_wood2( floor(argument0 + sin(degtorad(argument2)) * 11),
                                          floor(argument1 + cos(degtorad(argument2)) * 11),
                                          layer );
    // Special case: if normal collision test failed, check for collision within platform
    if (!collision_test && !ground && y_speed >= 0)
    {
        // In order to this to collide, we require to check if the bottom sensor collides
        // at the normal position, but not at the centre of the mask: This is because,
        // this way we check if we're landing on the surface of the platform, and this way
        // we prevent the player to land on somewhere else
        collision_test = place_meeting(floor(argument0 + sin(degtorad(argument2)) * 11),
                                       floor(argument1 + cos(degtorad(argument2)) * 11),
                                       objWoodPlat) &&
                        !place_meeting(floor(argument0), floor(argument1), objWoodPlat);
    }
    return collision_test
    
    mask_index      =   temporal_mask;
