#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timez=3
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objDialogueBox){
msg=global.connection_error_msg
u=instance_create(0,0,objConfirmDecision)
u.msg=msg
u.design="purple"
u.conf=false}
else
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if timez>0 && !instance_exists(objConfirmDecision)
{
    timez-=1
    if timez=0{
    op=instance_create(0,0,objFadeOut)
    op.alph=-.05}
}



    if instance_exists(objFadeOut)
    if objFadeOut.alph=1{
    FMODInstanceStop(global.BGM)
    global.ADD=0
    room_goto(rmLOADING)
    instance_destroy()}
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objConfirmDecision)
    if objConfirmDecision.alpha2=1
    {
        with objConfirmDecision
        instance_destroy()
        sound_play(sndMenuAccept2)
    }
