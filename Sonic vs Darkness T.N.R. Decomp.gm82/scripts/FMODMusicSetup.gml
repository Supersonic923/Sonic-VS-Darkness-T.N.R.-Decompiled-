//FMODMusicSetup(global name, filename, group, maxvolume, loop point, loop point2)

if argument0=0
{
argument0=FMODSoundAdd(argument1,false,true);
FMODSoundSetMaxVolume(argument0,argument3);
}
//global.ADD=argument0
if argument4!=-1{
sizeinms = FMODSoundGetLength(argument0)
FMODSoundSetLoopPoints(argument0,argument4/sizeinms,argument5);}
FMODSoundSetGroup(argument0,argument2);
FMODGroupSetVolume(argument2,global.musicvolume)
if argument4!=-1
return FMODSoundLoop(argument0);
else
return FMODSoundPlay(argument0);
/*
if argument0=0
{
argument0=FMODSoundAdd(argument1,false,true);
FMODSoundSetMaxVolume(argument0,argument3);
}
global.ADD=argument0
if argument4!=-1{
sizeinms = FMODSoundGetLength(global.ADD)
FMODSoundSetLoopPoints(global.ADD,argument4/sizeinms,argument5);}
FMODSoundSetGroup(argument0,argument2);
FMODGroupSetVolume(argument2,global.musicvolume)
if argument4!=-1
return FMODSoundLoop(global.ADD);
else
return FMODSoundPlay(global.ADD);
