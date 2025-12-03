if instance_exists(objWaterLine)
{

// Variables to detect if Player is global.underwater
var wl; wl=instance_nearest(x,y,objWaterLine)


// If Player passes the blocks, Player becomes global.underwater
if y>wl.y
{
if global.underwater=false && y_speed>=0 && screwon=false
{
    if global.underwater=false
    {
        if action!=action_stomping
        y_speed=0

        if abs(objPlayer.y_speed)>8
        instance_create(x,wl.y,objSplashL)
        else
        instance_create(x,wl.y,objSplash)

        if action=action_waterfall
        action=action_normal
    }

    var bgu;
    if instance_exists(objBGSUNLIGHT2)
    bgu=sndBGUnderwaterCove
    else
    bgu=sndBGUnderwater

if !sound_isplaying(bgu){
sound_loop(bgu)
sound_loop(sndBGUnderwater2)
sound_volume(bgu,0)
sound_volume(sndBGUnderwater2,0)}
}
global.underwater=true
}
// If not, reset drown music and take off filter
else
{
    if FMODInstanceIsPlaying(global.BGMD)
    {
        FMODInstanceStop(global.BGMD)}
        if groupause=false
            FMODGroupSetPaused(3,0)
    if global.EFF!=0 && global.filter=1
    {
        FMODEffectFree(global.EFF)
        global.EFF=0
        FMODEffectFree(global.EFFS)
        global.EFFS=0
        FMODEffectFree(global.EFFD)
        global.EFFD=0
        global.filter=0
        sound_fxfree()
    }
    if global.underwater=true
    {
        if abs(objPlayer.y_speed)>8
        instance_create(x,wl.y,objSplashL)
        else
        instance_create(x,wl.y,objSplash)
    }
    global.underwater=false
}


// Keeps player from going global.underwater if running fast enough
if y<wl.y && abs(x_speed)>8 && !place_meeting(x,y,objWaterCancel)// && y_speed<16
    global.solidwater=true
else
{
    if animation="crouch_slide" && (player_collision_bottom_object(x,y+3,angle,maskBig,objWaterTop))
    x_speed=6*animation_direction
    global.solidwater=false
}

}
// If global.underwater, subtract time and turn on filter
if (global.underwater=true)// && !instance_exists(objFadeOut)
{
    if drown=2100 && global.EFF=0 && !instance_exists(objFadeOut){
    FMODEffectFree(global.EFF)
    FMODEffectFree(global.EFFS)
    FMODEffectFree(global.EFFD)
    global.EFF=0
    global.EFFS=0
    global.EFFD=0
    global.EFF=FMODGroupAddEffect(3,10)
    global.EFFS=FMODGroupAddEffect(1,10)
    global.EFFD=FMODGroupAddEffect(2,10)
    sound_reverb()
    FMODEffectSetParamValue(global.EFF,2,.05);
    FMODEffectSetParamValue(global.EFFS,2,.05);
    FMODEffectSetParamValue(global.EFFD,2,.05);
    global.filter=1}

    if drown>0 && invincibility!=1
    drown-=1

    if attention>0 && invincibility!=1
    attention-=1

    if invincibility=1
    {
        drown=2100
        attention=280
    }

    if attention=0{
    if drown>1400
    sound_play(sndUDAttention)
    else if drown>750
    sound_play(sndUDWarning)
    attention=280}

    if bubble>0
    bubble-=1

    if bubble=choose(50,20)||bubble=0{
    set=choose(1,2,3)
    if set=1{
    instance_create(x,y,objSBubble)}
    if set=2{
    instance_create(x,y,objSBubble) with instance_create(x,y,objSBubble) image_index=1}
    if set=3{
    with instance_create(x,y,objSBubble) image_index=1}
    bubble=100}
}
// Reset variables if not global.underwater
else
{
    //global.underwater=false
    drown=2100
    bubble=100
    attention=280
}
// If times up, Player dies
if drown=0
{
    global.drowned=true
    instance_destroy()
    drown=1700
    FMODGroupSetPaused(3,0)
}
// If getting close to drowning, start drowning music
if drown=750
{
    FMODGroupSetPaused(3,1)
    if FMODInstanceIsPlaying(global.BGMS)
    FMODInstanceStop(global.BGMS)
    global.BGMD = FMODMusicSetup(global.DROWN, "music/SvD_Drown.ogg", 4, .55, -1, 1)//FMODSoundPlay(global.DROWN)
}
