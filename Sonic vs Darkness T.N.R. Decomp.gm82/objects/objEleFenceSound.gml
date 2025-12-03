#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Vol=0
sound_volume(sndElectricLp,0)
if !sound_isplaying(sndElectricLp)
sound_loop(sndElectricLp)
else{
sound_stop(sndElectricLp)
sound_loop(sndElectricLp)
}
sound_volume(sndElectricLp,0)
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
        if maxd-distance_to_object(objCamera)/500<=1
            Vol=maxd-distance_to_object(objCamera)/500
        sound_volume(sndElectricLp,Vol)
    }
    FMODInstanceSetPan(pan,min(max((x-objCamera.x)/500,-1),1));
}
else
sound_volume(sndElectricLp,Vol)


// the lower the divisible number, the quieter the sound gets when leaving
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objCamera) && instance_exists(objEleFence3){
x=instance_nearest(objCamera.x,objCamera.y,objEleFence3).x
y=instance_nearest(objCamera.x,objCamera.y,objEleFence3).y}
else if instance_exists(objCamera){
x=-1000
y=-1000}
