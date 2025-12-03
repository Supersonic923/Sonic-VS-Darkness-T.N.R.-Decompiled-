var i; i = 0;
    //map the original sounds, you can set these, in the gmk to a stub tiny .wav file
    //thes sounds in the gmk will never play. A copu of the original
    //was created in the OrigSnds folder
    //FMODSetPassword("bubby");
    //repeat(argument0)
    {
        if(sound_exists(argument0)) // put comment if load all at once
        {
            var sn; sn = "sounds\"+argument0+".wav"; // put comment before "sounds and add argument0 before it if load all at once
            //FMODProtection(sn);

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

/*argument0 = string_replace_all(argument0,"/","\")
//Make sure it's not loaded alread
var v; v = ds_map_find_value(global.__allsounds,argument0);
if(v) return v;

//find the next available entry
var i; i = 0;
while(ds_map_find_value(global.__allsounds,i)==-1) i+=1;
//add it in
var sond; sond = FMODSoundAdd(argument0,false,false);
FMODSoundSetMaxVolume(sond,1)

//if(i==7)
//{
//    show_message(string(snd))
//show_message(string(argument0))
//    }
ds_map_add(global.__allsoundsLoaded,string_lower(argument0),
                1);               
ds_map_add(global.__allsounds,i,
                sond);
ds_map_add(global.__allsoundsPlaying,i,0);

ds_map_add(global.__allsoundsGetPlay,i,0);

ds_map_add(global.__allsoundsEffect,i,
                sond);

if(sond == 0) show_debug_message("Failed to load sound: " + argument0)

return i;
//Now the sounds are indexed in map
//the original sound_add
