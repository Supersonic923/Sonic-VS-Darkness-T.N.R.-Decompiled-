
    global.reverb=true

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
            if FMODInstanceIsPlaying(inst)
            {
                if instance_exists(objWaterLine)
                {
                    /*if y<objWaterLine.y // Lowpass
                    {
                        global.fgeteffect[i]=FMODInstanceAddEffect(inst,10,1);
                        FMODEffectSetParamValue(global.fgeteffect[i],2,.05);
                    }
                    else // Reverb
                    */
                    {
                        global.fgeteffect[i]=FMODInstanceAddEffect(inst,13,1);
                        FMODInstanceSetVolume(inst,global.soundvolume-.3);
                    }
                }
            }
        }
        i+=1;
    }
    FMODInstanceSetVolume(global.railreverb,global.soundvolume-.95)
    global.railreverb=FMODInstanceAddEffect(global.BGMR,13,1)
    /*if FMODInstanceIsPlaying(global.fgetloop)
    global.fgeteffect=FMODInstanceAddEffect(global.fgetloop,13,1);
    if FMODInstanceIsPlaying(global.fgetsound)
    global.fgeteffect2=FMODInstanceAddEffect(global.fgetsound,13,1);
