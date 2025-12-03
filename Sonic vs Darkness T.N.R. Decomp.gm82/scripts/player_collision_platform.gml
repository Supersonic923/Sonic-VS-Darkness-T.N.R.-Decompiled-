// player_collision_platform(x, y, layer, land check)

    if (place_meeting(argument0, argument1, objSolid))
        return true;    // Check for normal solid

    if argument3=0
    {
        if (place_meeting(argument0, argument1, objPlatform) && //ground &&
            (player_collision_solid_bottom( x, y, angle, maskBig ) == false || (player_collision_platform_bottom( x, y, angle, maskBig ) == true &&
            player_collision_platform_main( x, y, angle, maskBig ) == false)))
            return true; // Check for platform (only while on ground) //((abs(angle)!=90 && abs(angle)!=270) || slide=true))
    }
    else
    {
        if (place_meeting(argument0, argument1, objPlatform))
            return true; // Check for platform (only while on ground) //((abs(angle)!=90 && abs(angle)!=270) || slide=true))
    }

    if (argument2 == 0){
        if place_meeting(argument0, argument1, objLow)     return true;             // Check for low layer
        if place_meeting(argument0, argument1, objPlatformLow) && ground     return true;             // Check for low layer
    }
    else{
        if place_meeting(argument0, argument1, objHigh)    return true;            // Check for high layer
        if place_meeting(argument0, argument1, objPlatformHigh) && ground    return true;}            // Check for high layer
