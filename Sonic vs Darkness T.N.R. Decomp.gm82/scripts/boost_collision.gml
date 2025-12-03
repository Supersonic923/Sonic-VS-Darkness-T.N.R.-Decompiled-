
    // boost_collision(x, y, layer)

    if (place_meeting(argument0, argument1, objBreakSolid) || place_meeting(argument0, argument1, objBreakSolid2))
        return false;    // Void breakable objects

    if (place_meeting(argument0, argument1, objSolid))
        return true;    // Check for normal solid

    if (argument2 == 0){
        if place_meeting(argument0, argument1, objLow)     return true;             // Check for low layer
        if place_meeting(argument0, argument1, objPlatformLow) && ground     return true;             // Check for low layer
    }
    else{
        if place_meeting(argument0, argument1, objHigh)    return true;            // Check for high layer
        if place_meeting(argument0, argument1, objPlatformHigh) && ground    return true;}            // Check for high layer
