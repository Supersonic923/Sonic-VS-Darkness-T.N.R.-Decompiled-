var i; i = 0;
    //map the original sounds, you can set these, in the gmk to a stub tiny .wav file
    //thes sounds in the gmk will never play. A copu of the original
    //was created in the OrigSnds folder
    repeat(global.sfxtotal*2)
    {
        if(sound_exists(i))
        {
            var sond; sond = ds_map_find_value(global.__allsounds,i);
            var inst; inst = ds_map_find_value(global.__allsoundsPlaying,i)
            ds_map_replace(global.__allsoundsPlaying,argument0,0);
            FMODSoundFree(sond)
        }
        i+=1;
    }
