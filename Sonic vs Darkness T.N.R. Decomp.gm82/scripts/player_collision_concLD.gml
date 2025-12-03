    temporal_mask   =   mask_index;
    mask_index=maskBigger
        // player_collision(x, y, layer)
    if (place_meeting(argument0, argument1, objConcSolid))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objConcSolidM))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objReflectSolid))              return true;    // Check for normal solid
    if (place_meeting(argument0, argument1, objConcPlat) && ground) return true;    // Check for platform (only while on ground)
    if (place_meeting(argument0, argument1, objConcPlatM) && ground) return true;    // Check for platform (only while on ground)
    if (place_meeting(argument0, argument1, objConcLow) && layer=0)  return true;           // Check for low layer
    if (place_meeting(argument0, argument1, objConcHigh) && layer=1) return true;           // Check for high layer

    mask_index      =   temporal_mask;
