#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.7
Vol=0
sound_volume(sndElectricFan,0)
sound_loop(sndElectricFan)
sound_volume(sndElectricFan,0)
instance_create(x,y-10,objAirSound)
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
        if maxd-distance_to_object(objCamera)/200<=1
            Vol=maxd-distance_to_object(objCamera)/200
        sound_volume(sndElectricFan,Vol)
    }
    FMODInstanceSetPan(pan,min(max((x-objCamera.x)/200,-1),1));
}
else
sound_volume(sndElectricFan,Vol)


// the lower the divisible number, the quieter the sound gets when leaving
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objCamera) && instance_exists(objFan){
x=instance_nearest(objCamera.x,objCamera.y,objFan).x
y=instance_nearest(objCamera.x,objCamera.y,objFan).y}
