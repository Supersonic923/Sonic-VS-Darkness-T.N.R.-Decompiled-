
        global.reverb=false

    var i; i = 0;
    //map the original sounds, you can set these, in the gmk to a stub tiny .wav file
    //thes sounds in the gmk will never play. A copu of the original
    //was created in the OrigSnds folder
    repeat(global.sfxtotal)
    {
        if(sound_exists(i))
        {
            var sond; sond = ds_map_find_value(global.__allsounds,i);
            var inst; inst = ds_map_find_value(global.__allsoundsPlaying,i)
            if FMODInstanceIsPlaying(inst) && FMODEffectGetActive(global.fgeteffect[i]){
            FMODEffectFree(global.fgeteffect[i],13,1);
            FMODInstanceSetVolume(global.fgetsound,global.soundvolume)}
        }
        i+=1;
    }
    FMODInstanceSetVolume(global.railreverb,global.soundvolume)
    FMODEffectFree(global.railreverb)
    global.railreverb=0
    /*if FMODInstanceIsPlaying(global.fgetloop) && FMODEffectGetActive(global.fgeteffect)
        FMODEffectFree(global.fgeteffect);
        if FMODInstanceIsPlaying(global.fgetsound) && FMODEffectGetActive(global.fgeteffect2)
        FMODEffectFree(global.fgeteffect2);
