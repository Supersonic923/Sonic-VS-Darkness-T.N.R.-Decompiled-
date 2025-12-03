#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Vol=0
sound_volume(sndFlameTrapLp,0)
if !sound_isplaying(sndFlameTrapLp)
sound_loop(sndFlameTrapLp)
else{
sound_stop(sndFlameTrapLp)
sound_loop(sndFlameTrapLp)
}
sound_volume(sndFlameTrapLp,0)
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
        sound_volume(sndFlameTrapLp,Vol)
    }
    FMODInstanceSetPan(pan,min(max((x-objCamera.x)/600,-1),1));
}
else
sound_volume(sndFlameTrapLp,Vol)


// the lower the divisible number, the quieter the sound gets when leaving
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmRAD{
if instance_exists(objCamera) && instance_exists(objRadJetBig){
x=instance_nearest(objCamera.x,objCamera.y,objRadJetBig).x
y=instance_nearest(objCamera.x,objCamera.y,objRadJetBig).y}
else if instance_exists(objCamera){
x=-1000
y=-1000}
}
else{
if instance_exists(objCamera) && instance_exists(objFlameTrapT){
x=instance_nearest(objCamera.x,objCamera.y,objFlameTrapT).x
y=instance_nearest(objCamera.x,objCamera.y,objFlameTrapT).y}
else if instance_exists(objCamera){
x=-1000
y=-1000}

}
