if (player_collision_top_obj (x,y,angle,maskBig,objSpikeDown)) && (player_collision_bottom_object (x,y,angle,maskBig,objSpike)||(player_collision_bottom_object (x,y,angle,maskBig,objSpikeAn)))
instance_destroy()

//up spikes
if animation!="crouch_slide" && animation!="grindduck"{
if (player_collision_top_obj (x,y,angle,maskBig,objSpikeDown)) && y_speed<=0
{
    if global.Rings=0 && global.shield=0 && invincibility=0 && room!=rmTRAIN
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
            sound_play(sndSpikeDamage)
        }
    }

}

//down spikes
if (player_collision_bottom_obj2 (x,y,angle,maskBig,objSpike)) && y_speed>=0
{
    if global.Rings=0 && global.shield=0 && invincibility=0 && room!=rmTRAIN
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
            sound_play(sndSpikeDamage)
        }
    }

}

//left spikes
if (player_collision_left_object (x,y,angle,maskBig,objSpikeLeft)) && x_speed<=0 && angle>-45 && angle<45
{
    if global.Rings=0 && global.shield=0 && invincibility=0 && room!=rmTRAIN
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
            sound_play(sndSpikeDamage)
        }
    }

}

//right spikes
if (player_collision_right_object (x,y,angle,maskBig,objSpikeRight)) && x_speed>=0 && angle>-45 && angle<45
{
    if global.Rings=0 && global.shield=0 && invincibility=0 && room!=rmTRAIN
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
            sound_play(sndSpikeDamage)
        }
    }

}

//animated spikes
if (player_collision_bottom_object (x,y,angle,maskBig,objSpikeAn)) && y_speed>=0
{
    if global.Rings=0 && global.shield=0 && invincibility=0 && room!=rmTRAIN
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
            sound_play(sndSpikeDamage)
        }
    }

}
//trap spikes
if (player_collision_top_obj (x,y,angle,maskBig,objSpikeTrap)) && y_speed<=0
{
    if global.Rings=0 && global.shield=0 && invincibility=0 && room!=rmTRAIN
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
            sound_play(sndSpikeDamage)
        }
    }

}
}
//up spikes
else{
if (player_collision_top_obj (x,y,angle,maskBig2,objSpikeDown)) && y_speed<=0
{
    if global.Rings=0 && global.shield=0 && invincibility=0 && room!=rmTRAIN
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
            sound_play(sndSpikeDamage)
        }
    }

}

//down spikes
if (player_collision_bottom_object (x,y,angle,maskBig2,objSpike)) && y_speed>=0
{
    if global.Rings=0 && global.shield=0 && invincibility=0 && room!=rmTRAIN
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
            sound_play(sndSpikeDamage)
        }
    }

}

//left spikes
if (player_collision_left_object (x,y,angle,maskBig2,objSpikeLeft)) && x_speed<=0 && angle>-45 && angle<45
{
    if global.Rings=0 && global.shield=0 && invincibility=0 && room!=rmTRAIN
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
            sound_play(sndSpikeDamage)
        }
    }

}

//right spikes
if (player_collision_right_object (x,y,angle,maskBig2,objSpikeRight)) && x_speed>=0 && angle>-45 && angle<45
{
    if global.Rings=0 && global.shield=0 && invincibility=0 && room!=rmTRAIN
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
            sound_play(sndSpikeDamage)
        }
    }

}

//animated spikes
if (player_collision_bottom_object (x,y,angle,maskBig2,objSpikeAn)) && y_speed>=0
{
    if global.Rings=0 && global.shield=0 && invincibility=0 && room!=rmTRAIN
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
            sound_play(sndSpikeDamage)
        }
    }

}
//trap spikes
if (player_collision_top_obj (x,y,angle,maskBig,objSpikeTrap)) && y_speed<=0
{
    if global.Rings=0 && global.shield=0 && invincibility=0 && room!=rmTRAIN
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
            sound_play(sndSpikeDamage)
        }
    }

}
}
