    // player_collision(x, y, layer)
    if (place_meeting(argument0, argument1, objWoodSolid))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objWoodSolidM))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objWoodPlat) && ground)  return true;    // Check for platform (only while on ground)
    if (place_meeting(argument0, argument1, objWoodPlatM) && ground)  return true;    // Check for platform (only while on ground)
    if (place_meeting(argument0, argument1, objWoodLow) && layer=0)  return true;           // Check for low layer
    if (place_meeting(argument0, argument1, objWoodHigh) && layer=1) return true;           // Check for high layer
