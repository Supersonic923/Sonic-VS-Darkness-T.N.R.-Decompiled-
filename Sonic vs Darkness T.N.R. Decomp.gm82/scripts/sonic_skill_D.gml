// SUPER SONIC
if global.so_skill_D=3
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
