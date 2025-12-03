#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Vol=0
sound_volume(sndSpinner,0)
if !sound_isplaying(sndSpinner)
sound_loop(sndSpinner)
else{
sound_stop(sndSpinner)
sound_loop(sndSpinner)
}
sound_volume(sndSpinner,0)
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
        if maxd-distance_to_object(objCamera)/600<=1
            Vol=maxd-distance_to_object(objCamera)/600
        sound_volume(sndSpinner,Vol)
    }
    FMODInstanceSetPan(pan,min(max((x-objCamera.x)/600,-1),1));
}
else
sound_volume(sndSpinner,Vol)


// the lower the divisible number, the quieter the sound gets when leaving
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objCamera) && instance_exists(objNegaCopterC){
x=instance_nearest(objCamera.x,objCamera.y,objNegaCopterC).x
y=instance_nearest(objCamera.x,objCamera.y,objNegaCopterC).y}
