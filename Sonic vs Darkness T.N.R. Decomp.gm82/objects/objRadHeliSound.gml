#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Vol=0
sound_volume(sndRadHeli,0)
sound_loop(sndRadHeli)
sound_volume(sndRadHeli,0)
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
        sound_volume(sndRadHeli,Vol)
    }
}
else
sound_volume(sndRadHeli,Vol)

// the lower the divisible number, the quieter the sound gets when leaving
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objCamera) && instance_exists(objRadHeli){
x=instance_nearest(objCamera.x,objCamera.y,objRadHeli).x
y=instance_nearest(objCamera.x,objCamera.y,objRadHeli).y}
