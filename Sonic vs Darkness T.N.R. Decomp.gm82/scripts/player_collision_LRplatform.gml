
    // player_collision(x, y, layer)
    if (place_meeting(argument0, argument1, objSolid))    return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objPlatform)) return true;    // Check for platform (without needing to be in ground)
    if (argument2 == 0) return place_meeting(argument0, argument1, objLow);             // Check for low layer
    else                return place_meeting(argument0, argument1, objHigh);            // Check for high layer
