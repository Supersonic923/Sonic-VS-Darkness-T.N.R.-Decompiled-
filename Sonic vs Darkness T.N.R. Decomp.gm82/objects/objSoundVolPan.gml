#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vp_sound=snd
vp_sound_instance=-1

Vol=0

alarm[0]=240
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Backup destroy
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var maxd;
maxd=1
if instance_exists(objPlayer)
{
        //if maxd-distance_to_object(objPlayer)/200<=1
            //Vol=maxd-distance_to_object(objPlayer)/200
            Vol=max(global.soundvolume-point_distance(x,y,objPlayer.x,objPlayer.y)/700,0)
        FMODInstanceSetVolume(vp_sound_instance,Vol)//sound_volume(vp_sound,Vol)

    FMODInstanceSetPan(vp_sound_instance,min(max((x-objPlayer.x)/200,-1),1));
}
else
FMODInstanceSetVolume(vp_sound_instance,Vol)//sound_volume(vp_sound,Vol)


if !FMODInstanceIsPlaying(vp_sound_instance)
instance_destroy()


// the lower the divisible number, the quieter the sound gets when leaving
