if (instance_exists(objEnemyParent) && abs(x_speed)<1 && global.boost<127) || attackdelay=true
{
    var eneme;
    var dir;
    eneme=instance_nearest_ext(x,y,objEnemyParent)
    if eneme=-1
    exit;
    if distance_to_point(eneme.x,eneme.y)<400 && ((x+50<eneme.x && animation_direction=1) || (x-50>eneme.x && animation_direction=-1)) || attackdelay=true
    {
    if ground=true && (!key_down && !key_up){
    x_speed=0
    attackdelay=true
    if attackdelay=true && animation_frame=116{
    instance_create(x,y,objChaosSpear)
    dir=instance_create(x,y,objSnakeEf)
    dir.image_xscale=animation_direction
    attackdelay=false
    }
    animation="attack"}
    }
}
else if (abs(x_speed)<1 && global.boost<127) //|| attackdelay=true
{
    if ground=true && (!key_down && !key_up){
    x_speed=0
    attackdelay=true
    if attackdelay=true && animation_frame=116{
    instance_create(x,y,objChaosSpear)
    dir=instance_create(x,y,objSnakeEf)
    dir.image_xscale=animation_direction
    attackdelay=false
    }
    animation="attack"}
}

/*if global.use17=true && global.boost<92 && distance_to_object(objRingD) >= 80{
cct=true
instance_create(x,y,objSdwTeleport)}*/


// SUPER SHADOW
if global.sh_skill_D=3
{
    if action!=action_super
    {
        if ground=true{
        action=action_super
        animation="super3"
        x_speed=0
        instance_create(x,y,objEmeraldSwirl)}
        else
        {
        y_speed=0
        action=action_super
        animation="super2"
        animation_skip  = 3;
        x_speed=0
        instance_create(x,y,objEmeraldSwirl)
        }

                if FMODInstanceIsPlaying(global.BGMS)
                FMODInstanceStop(global.BGMS)
                if FMODInstanceIsPlaying(global.BGM)
                FMODInstanceStop(global.BGM)
                if FMODInstanceIsPlaying(global.BGMD)
                FMODInstanceStop(global.BGMD)
                if FMODInstanceIsPlaying(global.BGMINV)
                FMODInstanceStop(global.BGMINV)

                global.BGM = FMODMusicSetup(global.SUP, "music/SvD_Supersonic.ogg", 3, .9, -1, 1)
    }
    /*
    if FMODInstanceIsPlaying(global.BGMS)
                FMODInstanceStop(global.BGMS)
                if FMODInstanceIsPlaying(global.BGMD)
                FMODInstanceStop(global.BGMD)
                if !FMODInstanceIsPlaying(global.BGMINV)
                {
                objPlayer.groupause=true
                FMODGroupSetPaused(3,1)
                global.BGMINV = FMODMusicSetup(global.INV, "music/SvD_Supersonic.ogg", 1, .9, -1, 1)}}
     */
}
