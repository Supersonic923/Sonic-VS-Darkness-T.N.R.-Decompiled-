sound_insert(argument0)
show_debug_message("Looping " + string(argument0))
//this gets the sound. 0, null sound if not found
if(!ds_map_exists(global.__allsounds,argument0)) exit;

var sond; sond = ds_map_find_value(global.__allsounds,argument0);
global.fgetloop = FMODSoundLoop(sond);
ds_map_replace(global.__allsoundsPlaying,argument0,global.fgetloop);
ds_map_replace(global.__allsoundsGetPlay,argument0,global.fgetloop);

// Master Volume
FMODInstanceSetVolume(global.fgetloop,global.soundvolume)

// Reverb
if global.reverb=true{
if instance_exists(objWaterLine){
if y<objWaterLine.y
{

    global.fgeteffect[argument0]=FMODInstanceAddEffect(global.fgetloop,10,1);
    FMODEffectSetParamValue(global.fgeteffect[argument0],2,.05);
}
else
global.fgeteffect[argument0]=FMODInstanceAddEffect(global.fgetloop,13,1);
FMODInstanceSetVolume(global.fgetloop,global.soundvolume-.3)

ds_map_replace(global.__allsoundsEffect,argument0,global.fgeteffect);}}
