#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Vol=0
sound_volume(sndFanAir2,0)
if !sound_isplaying(sndFanAir2)
sound_loop(sndFanAir2)
else{
sound_stop(sndFanAir2)
sound_loop(sndFanAir2)
}
sound_volume(sndFanAir2,0)
pan=global.fgetloop
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var maxd;
maxd=1
if instance_exists(objCamera)
{
    {
        if maxd-distance_to_object(objCamera)/300<=1
            Vol=maxd-distance_to_object(objCamera)/300
        sound_volume(sndFanAir2,Vol)
    FMODInstanceSetPan(pan,min(max((x-objCamera.x)/300,-1),1));
    }
}
else
sound_volume(sndFanAir2,Vol)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objCamera) && instance_exists(objTubeWind)
{
x=instance_nearest(objCamera.x,objCamera.y,objTubeWind).x
y=instance_nearest(objCamera.x,objCamera.y,objTubeWind).y
}
