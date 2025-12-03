var i; i = 0;
var t; t=global.sfxtotal*2
    //map the original sounds, you can set these, in the gmk to a stub tiny .wav file
    //thes sounds in the gmk will never play. A copu of the original
    //was created in the OrigSnds folder
    repeat(t)
    {
        if(sound_exists(i))
        {
            var sond; sond = ds_map_find_value(global.__allsounds,i);
            var inst; inst = ds_map_find_value(global.__allsoundsPlaying,i)
            if FMODInstanceIsPlaying(inst){
            FMODInstanceSetPaused(inst,true)}
        }
        i+=1;
    }
