if global.online_mode=true
{
    if online_sounds(argument0) && object_index!=objOnlineMasterSound//object_index=objSonic || object_index=objShadow || object_index=objBlaze || object_index=objSupersonic
    //|| object_index=objSupershadow || object_index=objSilver
    {
        i=instance_create(x,y,objOnlineMasterSound)
        i.online_sound=argument0
        gms_instance_sync(i,is_onetime | isc_local,"online_sound")
        exit;
    }
}

sound_insert(argument0)

//this gets the sound. 0, null sound if not found
//show_message(string(argument0+1))
if(!ds_map_exists(global.__allsounds,argument0)) //argument0
{
//show_debug_message("error " + string(argument0))
exit;
}
//show_debug_message("Playing " + string(argument0))
var sond; sond = ds_map_find_value(global.__allsounds,argument0);//argument0
//show_message(string(snd))

global.fgetsound = FMODSoundPlay(sond);

ds_map_replace(global.__allsoundsPlaying,argument0,global.fgetsound);

ds_map_replace(global.__allsoundsGetPlay,argument0,global.fgetsound);


// Master Volume
FMODInstanceSetVolume(global.fgetsound,global.soundvolume)

// Pan
if instance_exists(objPlayer)
{
    if objPlayer.goal=false
    {
        if object_index!=objTarget && object_index!=objMonitorItemLogo && object_index!=objNegaChaser && object_index!=objController
        && object_index!=objOnlineHUD && object_index!=objOnlinePause && object_index!=objOnlineStageSelect && object_index!=objDialogue// && object_index!=objOnlineMasterSound
        {
            ///Auto volume and pan object
            if sound_get_kind(argument0)=2
            {
                with instance_create(x,y,objSoundVolPan){
                vp_sound=sond
                vp_sound_instance=global.fgetsound}
            }
            else
            {
                if x>objPlayer.x && x<objPlayer.x+300
                FMODInstanceSetPan(global.fgetsound,point_distance(x,y,objPlayer.x,y)/300);
                else if x<objPlayer.x && x>objPlayer.x-300
                FMODInstanceSetPan(global.fgetsound,-point_distance(x,y,objPlayer.x,y)/300);
                else if x>objPlayer.x+300
                FMODInstanceSetPan(global.fgetsound,1);
                else if x<objPlayer.x-300
                FMODInstanceSetPan(global.fgetsound,-1);

                FMODInstanceSetVolume(global.fgetsound,max(global.soundvolume-point_distance(x,y,objPlayer.x,objPlayer.y)/700,0))
            }
            /*show_message("Volume: "+string(global.soundvolume)+"#Distance: "+string(global.soundvolume-point_distance(x,y,objPlayer.x,objPlayer.y)/700)+
            "#X-Pos: "+string(x)+"#Y-Pos: "+string(y)+
            "#Pl-X-Pos: "+string(objPlayer.x)+"#Pl-Y-Pos: "+string(objPlayer.y))*/

        }
    }
}
/*
var obj;

obj=instance_create(x,y,objSoundPanner)
with obj
obj.otherobj=object_index
*/

// Reverb
if global.reverb=true
{
    if instance_exists(objWaterLine)
    {
        if y<objWaterLine.y
        {
            global.fgeteffect[argument0]=FMODInstanceAddEffect(global.fgetsound,10,1);
            FMODEffectSetParamValue(global.fgeteffect[argument0],2,.05);
            FMODEffectSetDefaultVol(global.fgeteffect[argument0],1)
        }
        else{
        global.fgeteffect[argument0]=FMODInstanceAddEffect(global.fgetsound,13,1);
        FMODInstanceSetVolume(global.fgetsound,global.soundvolume-.3)
        }
    }
}
return global.fgetsound;

//show_message("Done")
