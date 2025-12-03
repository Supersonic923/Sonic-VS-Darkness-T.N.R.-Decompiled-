//this gets the sound. 0, null sound if not found
//show_message(string(argument0+1))
if(!ds_map_exists(global.__allsounds,argument0)) exit;

var sond; sond = ds_map_find_value(global.__allsounds,argument0);

var inst; inst = ds_map_find_value(global.__allsoundsPlaying,argument0);

//var vol; vol =
FMODInstanceSetVolume(inst,argument1+(global.soundvolume-1));
