if player_collision_bottom_obj(x,y,angle,maskBig,objParRail) ||
(player_collision_bottom_obj(x,y,angle,maskBig,objRailLow) && layer=0) ||
(player_collision_bottom_obj(x,y,angle,maskBig,objRailHigh) && layer=1) return false;
return true
/*if player_collision_bottom_obj(x,y,angle,maskBig,objSolid) return true;
if player_collision_bottom_obj(x,y,angle,maskBig,objPlatform) return true;
if player_collision_bottom_obj(x,y,angle,maskBig,objHigh) return true;
if player_collision_bottom_obj(x,y,angle,maskBig,objLow) return true;
return false;
