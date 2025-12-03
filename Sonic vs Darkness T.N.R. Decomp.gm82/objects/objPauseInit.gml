#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=false
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=false
{
    if global.reverb=true{
    global.backtoreverb=true
    global.reverb=false}
    sound_pause_all()

    joystick_rumble(0,0,0)
    FMODGroupSetPaused(3,1)
    FMODGroupSetPaused(2,1)
    FMODGroupSetPaused(1,1)
    FMODGroupSetPaused(4,1)
    FMODInstanceSetPaused(global.BGMR,1)
    room_persistent=true;//Make the current room persistent so everything is the same when we come back
    screen_save('pause_back.bmp');//Save the current screen to a file
    room_goto(rmPause);//Go to the pause room
    background_replace(bg_Pause,'pause_back.bmp',0,1);//Replace the pause room background with the newly saved image
    file_delete('pause_back.bmp');//Delete the image file because we no longer need it
}

go=true
instance_destroy()
