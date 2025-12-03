#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Vol=0
sound_volume(sndAnchorReel,0)
if !sound_isplaying(sndAnchorReel)
sound_loop(sndAnchorReel)
else{
sound_stop(sndAnchorReel)
sound_loop(sndAnchorReel)
}
sound_volume(sndAnchorReel,0)
pan=global.fgetloop

set_effect=-1
ef_type=-1
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
        sound_volume(sndAnchorReel,Vol)
    }
    FMODInstanceSetPan(pan,min(max((x-objCamera.x)/600,-1),1));
}
else
sound_volume(sndAnchorReel,Vol)


// the lower the divisible number, the quieter the sound gets when leaving
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Reverb / Lowpass
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.reverb=true
{
    if instance_exists(objWaterLine)
    {
        if y<objWaterLine.y // Lowpass
        {
            if ef_type=-1
            {
                ef_type=0
                set_effect=FMODInstanceAddEffect(pan,10,1);
                FMODEffectSetParamValue(set_effect,2,.05);
            }
            else if ef_type=1
            {
                if FMODEffectGetActive(set_effect)
                FMODEffectFree(set_effect)
                ef_type=0
                set_effect=FMODInstanceAddEffect(pan,10,1);
                FMODEffectSetParamValue(set_effect,2,.05);
            }
        }
        else // Reverb
        {
            if ef_type=-1
            {
                ef_type=1
                set_effect=FMODInstanceAddEffect(pan,13,1);
            }
            else if ef_type=0
            {
                if FMODEffectGetActive(set_effect)
                FMODEffectFree(set_effect)
                ef_type=1
                set_effect=FMODInstanceAddEffect(pan,13,1);
            }
        }
    }
}
else
{
    if set_effect!=-1
    {
        FMODEffectFree(set_effect)
        set_effect=-1
        ef_type=-1
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objCamera) && instance_exists(objSUNAnchor)
{
    var (achor)=instance_nearest(objCamera.x,objCamera.y,objSUNAnchor)
    if achor.delay=0 && achor.y>achor.ystart && achor.detect=false
    {
        x=achor.x
        y=achor.y+90
    }
    else
    {
        x=-1000
        y=-1000
    }
}
else if instance_exists(objCamera){
x=-1000
y=-1000}
