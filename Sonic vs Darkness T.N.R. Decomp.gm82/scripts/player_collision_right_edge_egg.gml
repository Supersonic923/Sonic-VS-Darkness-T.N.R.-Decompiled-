/*
*   player_collision_right_edge(x,y,angle)
*
*   =============================================
*
*   This functions returns if the right edge sensor has collided
*   on the given angle.
*
*/

    /* The edges collision detection scripts. These are another big pilar of the
       engine. These are used for detecting if an edge surrounds the characters,
       so we know if we need to check angle or not.

       These are placed each at the sides of the character and it's a line of kind
       of 23 pixels wich detects, if it's colliding, we can check collision because
       it's a slope and not an edge. Here, we use the special "image_index", for
       using the prerotated images of the mask sprite.
       
       It isn't much difficult but helps a lot :D
    */

    // Store the actual mask for setting it up later
    temporal_mask   =   mask_index;
    temporal_index  =   sprite_index;
    temporal_image  =   image_index;

    mask_index      =   maskLinesEgg;
    sprite_index    =   maskLinesEgg;
    image_index     =   floor(argument2);  // 0 to 359 possible images

    // Test collision
    collision_test  =   player_collision_platform( floor(argument0 + cos(degtorad(argument2)) * 18 +
                                                     sin(degtorad(argument2)) * 21),
                                                   floor(argument1 - sin(degtorad(argument2)) * 18 +
                                                     cos(degtorad(argument2)) * 21),
                                                   layer );

    // Set to the old mask
    mask_index      =   temporal_mask;
    sprite_index    =   temporal_index;
    image_index     =   temporal_image;

    // Calculate the direction
    return  collision_test;
