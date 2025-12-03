    temporal_mask   =   mask_index;
    mask_index      =   maskBigger;
    // player_collision(x, y, layer)
    if (place_meeting(argument0, argument1, objWaterSolid))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objWaterSolidM))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objWaterPlat) && ground) return true;    // Check for platform (only while on ground)
    if (place_meeting(argument0, argument1, objWaterPlatM) && ground) return true;    // Check for platform (only while on ground)
    if (place_meeting(argument0, argument1, objWaterLow) && layer=0)  return true;         // Check for low layer
    if (place_meeting(argument0, argument1, objWaterHigh) && layer=1)  return true;          // Check for high layer

    mask_index      =   temporal_mask;
