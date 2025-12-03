     // player_collision(x, y, layer)
    if (place_meeting(argument0, argument1, objGrassSolid))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objGrassSolidM))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objGrassPlat) && ground)  return true;    // Check for platform (only while on ground)
    if (place_meeting(argument0, argument1, objGrassPlatM) && ground)  return true;    // Check for platform (only while on ground)
    if (place_meeting(argument0, argument1, objGrassLow) && layer=0)  return true;         // Check for low layer
    if (place_meeting(argument0, argument1, objGrassHigh) && layer=1)  return true;          // Check for high laye
