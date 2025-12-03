if(!ds_map_exists(global.__allsounds,argument0)) return 0;

var sond; sond = ds_map_find_value(global.__allsounds,argument0+1);

var inst; inst = ds_map_find_value(global.__allsoundsPlaying,argument0);

var ispl; ispl = FMODInstanceIsPlaying(inst);

//ds_map_replace(global.__allsoundsPlaying,argument0,ispl);
return ispl;
