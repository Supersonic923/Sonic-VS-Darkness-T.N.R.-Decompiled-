#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Vol=0
sound_volume(sndHUBWaterfall,0)
sound_loop(sndHUBWaterfall)
sound_volume(sndHUBWaterfall,0)
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
        if maxd-distance_to_object(objCamera)/800<=1
            Vol=maxd-distance_to_object(objCamera)/800
        sound_volume(sndHUBWaterfall,Vol)
    FMODInstanceSetPan(pan,min(max((x-objCamera.x)/800,-1),1));
    }
}
else
sound_volume(sndHUBWaterfall,Vol)

// the lower the divisible number, the quieter the sound gets when leaving
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objCamera) && instance_exists(objWFCreate2){
x=instance_nearest(objCamera.x,objCamera.y,objWFCreate2).x
y=instance_nearest(objCamera.x,objCamera.y,objWFCreate2).y}
