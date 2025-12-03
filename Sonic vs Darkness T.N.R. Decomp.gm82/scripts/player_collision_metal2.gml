    // player_collision(x, y, layer)
    if (place_meeting(argument0, argument1, objMetalSolid))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objMetalSolidM))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objMetalPlat) && ground) return true;    // Check for platform (only while on ground)
    if (place_meeting(argument0, argument1, objMetalPlatM) && ground) return true;    // Check for platform (only while on ground)
    if (place_meeting(argument0, argument1, objMetalLow) && layer=0)    return true;         // Check for low layer
    if (place_meeting(argument0, argument1, objMetalHigh) && layer=1)   return true;         // Check for high layer*/
