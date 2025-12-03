//replaces GM sound add

//check if initialized
//show_message("initGMSEmulate")

if(!variable_global_get("__FunctionsReplaced"))
{
//show_message("FunctionsReplaced")

    //create map
    global.__allsounds = ds_map_create();
    global.__allsoundsLoaded  = ds_map_create();
    global.__allsoundsPlaying = ds_map_create();
    global.__allsoundsGetPlay = ds_map_create();
    global.__allsoundsEffect = ds_map_create();
    global.reverb=false
    global.backtoreverb=false
    global.fgetloop=0
    global.fgeteffect[0]=0
    global.fgetsound=0
    global.fgeteffect2=0
    global.soundpause=false
    global.sfxtotal=0
    global.railreverb=0

var i; i = 0;
    //initialized = true
    global.__FunctionsReplaced = true;
    //add a blank 0 sound
 repeat(argument0)
    {
        if(sound_exists(i))
        {
            global.sfxtotal+=1
            global.fgeteffect[global.sfxtotal]=0
        }
        i+=1;
    }
   }/* var i; i = 0;
    //map the original sounds, you can set these, in the gmk to a stub tiny .wav file
    //thes sounds in the gmk will never play. A copu of the original
    //was created in the OrigSnds folder
    FMODSetPassword("bubby");
    repeat(argument0)
    {
        if(sound_exists(i))
        {
            var sn; sn = "sounds\"+sound_get_name(i) + ".wav";

            FMODProtection(sn);

            var sond; sond = FMODSoundAdd(sn,false,false);
            if(sond == 0) show_debug_message("Failed to load sound: " + sn);
            FMODSoundSetMaxVolume(sond,1)

            ds_map_add(global.__allsoundsLoaded,string_lower(sn),1);
            ds_map_add(global.__allsounds,i,sond);
            ds_map_add(global.__allsoundsPlaying,i,0);
            ds_map_add(global.__allsoundsGetPlay,i,0);
            ds_map_add(global.__allsoundsEffect,i,sond);
            global.sfxtotal+=1
            global.fgeteffect[global.sfxtotal]=0
        }
        i+=1;
    }
}
