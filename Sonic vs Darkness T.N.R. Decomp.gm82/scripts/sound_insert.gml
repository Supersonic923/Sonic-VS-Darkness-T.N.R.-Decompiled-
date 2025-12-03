if (ds_map_exists(global.__allsounds,argument0))
exit;
//FMODSetPassword("bubby"); // hide after release
if(sound_exists(argument0))
{
    //show_message("Code 1")
    var sn; sn = "sounds\"+sound_get_name(argument0) + ".wav";//".wav";

    //FMODProtection(sn);

    var sond; sond = FMODSoundAdd(sn,false,false);
    if(sond == 0) show_debug_message("Failed to load sound: " + sn);
    FMODSoundSetMaxVolume(sond,1)

    ds_map_add(global.__allsoundsLoaded,string_lower(sn),1);
    ds_map_add(global.__allsounds,argument0,sond);
    ds_map_add(global.__allsoundsPlaying,argument0,0);
    ds_map_add(global.__allsoundsGetPlay,argument0,0);
    ds_map_add(global.__allsoundsEffect,argument0,sond);
    global.sfxtotal+=1
    global.fgeteffect[global.sfxtotal]=0
}
