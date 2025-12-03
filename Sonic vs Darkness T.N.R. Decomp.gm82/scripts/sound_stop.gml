if(!ds_map_exists(global.__allsounds,argument0)) exit;
var sond; sond = ds_map_find_value(global.__allsounds,argument0);
var inst; inst = ds_map_find_value(global.__allsoundsPlaying,argument0)
var playing; playing = ds_map_find_value(global.__allsoundsGetPlay,argument0)
ds_map_replace(global.__allsoundsPlaying,argument0,0);
ds_map_replace(global.__allsoundsGetPlay,argument0,0);
FMODInstanceStop(inst)
