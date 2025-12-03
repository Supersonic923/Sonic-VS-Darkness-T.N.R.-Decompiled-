    // player_collision(x, y, layer)
    if (place_meeting(argument0, argument1, objDirtSolid))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objDirtSolidM))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objDirtPlat) && ground) return true;    // Check for platform (only while on ground)
    if (place_meeting(argument0, argument1, objDirtPlatM) && ground) return true;    // Check for platform (only while on ground)
    if (place_meeting(argument0, argument1, objDirtLow) && layer=0)      return true;       // Check for low layer
    if (place_meeting(argument0, argument1, objDirtHigh) && layer=1)  return true;          // Check for high layer
