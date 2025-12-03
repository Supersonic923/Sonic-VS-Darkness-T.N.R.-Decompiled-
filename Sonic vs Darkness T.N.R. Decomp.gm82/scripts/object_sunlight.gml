    // ---- Waterfall Slide ----------------------------------------------------------------------
    objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objWaterSlidePar);
    if (objHandle != noone) && ground=true
    {
        if action!=action_fake_hurt{
        if !sound_isplaying(sndWaterSkidBoost)
        sound_loop(sndWaterSkidBoost)
        water_skid=8}

        action=action_fake_hurt
        x_speed=5
        animation_direction=-1
        with objBoostPar
        instance_destroy()

        if water_skid=0
        {
            with instance_create(x+(4*animation_direction),y+(12),objWaterSkidNC)
            {
                image_xscale=sign(other.x-other.previous_x)
                image_angle=-30
                depth=-.5
            }
            water_skid=8
        }
    }

    // ---- SUN Water Gun ----------------------------------------------------------------------
    objHandle = player_collision_main_object(x, y, objSUNWaterGun);
    if (objHandle != noone)
    {
        if objHandle.chosen=false && x_speed>0
        {
            homing=0
            ground=false
            animation_direction=1
            animation="airjump"
            x_speed=0
            y_speed=0
            x=objHandle.x-objHandle.mrge
            y=objHandle.y
            sound_play(sndSpinDashCharge2)
            action=action_cannon
            objHandle.active=true
            objHandle.chosen=true

            with objBoostPar
            instance_destroy()
        }
    }
    objHandle = player_collision_main_object(x, y, objSUNWaterGun2);
    if (objHandle != noone)
    {
        if objHandle.chosen=false && ground=false && y<objHandle.y-58 && y_speed>0
        {
            homing=0
            ground=false
            animation_direction=1
            animation="airjump"
            x_speed=0
            y_speed=0
            x=objHandle.mrge2
            y=objHandle.y-objHandle.mrge
            sound_play(sndSpinDashCharge2)
            action=action_cannon
            objHandle.active=true
            objHandle.chosen=true
            objHandle.depth=objHandle.depth_change

            with objArrowSpin
            instance_destroy()

            with objBoostPar
            instance_destroy()
        }
    }

    // ---- SUN Catapult ----------------------------------------------------------------------
    objHandle = player_collision_main_object(x, y, objSUNCatapult2);
    if (objHandle != noone)
    {
        if objHandle.release=false
        {
            homing=0
            ground=false
            animation_direction=1
            animation="airjump"
            x_speed=0
            y_speed=0
            x=objHandle.x+lengthdir_x(136,objHandle.image_angle+90)
            y=objHandle.y+lengthdir_y(136,objHandle.image_angle+90)
            sound_play(sndCatapult)
            sound_play(sndSpinDashCharge2)
            action=action_cannon
            objHandle.release=true

            with objBoostPar
            instance_destroy()
        }
    }

    // ---- Waterfall Slide Down ----------------------------------------------------------------------
    objHandle = player_collision_main_object(x, y, objWaterfallSlide);
    if (objHandle != noone) && (ground=false && ( (y_speed>0 && animation!="waterfall3") || (animation="waterfall3" && ((y_speed>8&&nomovet=0)||(y_speed>4.5&&nomovet>0)) ) ) )
    && !player_collision_bottom_object(x, y, angle, maskBig ,objWaterfallSlideB)
    {
        homing=0
        if animation!="waterfall"
        sound_play(sndSplash)
        action=action_waterfall
        animation="waterfall"
        animation_direction=1
        y_speed=min(y_speed,3)
        x_speed=0
        x=objHandle.x+16
        if !instance_exists(objWaterSlideB)
        instance_create(x,y,objWaterSlideB)
        if !instance_exists(objWaterSlideF)
        instance_create(x,y,objWaterSlideF)
    }
    else if action=action_waterfall && animation!="waterfall2" && animation!="waterfall3"
    action=action_normal

    // ---- SUN Swing ----------------------------------------------------------------------
    objHandle = player_collision_main_object(x, y, objSUNSwing);
    if (objHandle != noone)
    {
        if objHandle.activate=false
        {
            homing=0
            ground=false
            animation_direction=1
            animation="airjump"
            x_speed=0
            y_speed=0
            x=objHandle.x
            y=objHandle.y
            sound_play(sndCatapult)
            sound_play(sndSpinDashCharge2)
            action=action_cannon
            objHandle.activate=true
            if instance_exists(objBoostPar)
            objHandle.rt=5

            with objBoostPar
            instance_destroy()
        }
    }

    // ---- SUN Cart ----------------------------------------------------------------------
    objHandle = player_collision_main_object(x, y, objSUNCart);
    if (objHandle != noone) && y_speed>=0 && ground=true
    {
        if objHandle.go=false{
        sound_loop(sndRollerCoaster)
        ridemove=true
        ground=true
        action=action_ride
        animation="ride2"
        animation_direction=1
        y_speed=0
        x_speed=0
        x=objHandle.x
        objHandle.go=true
        no_boost=true}
    }
    // ---- Speed Tube E----------------------------------------------------------------------
    objHandle = player_collision_main_object(x, y, objSpeedTubeE);
    if (objHandle != noone) && ground=true && action=action_speed_tube
    {
        action=action_normal
        animation = "flightdash"
        animation_direction=1
        y_speed=-3
        x_speed=8
        ground=false
        nomovet=80
        sound_play(sndSplash)
    }
    // ---- Speed Tube ----------------------------------------------------------------------
    objHandle = player_collision_main_object(x, y, objSpeedTubeS);
    if (objHandle != noone) && y_speed>=0 && ground=false && action!=action_speed_tube
    {
        sound_play(sndSpinDashCharge2)
        action=action_speed_tube
        animation_direction=1
        y_speed=0
        x_speed=0
        x=objHandle.x+32
        y=objHandle.y-14
    }
    // ---- Anchor Script ----------------------------------------------------------------------
    objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objSUNAnchor)
    if (objHandle != noone) && y_speed>=0 && ground=true
    {
        if objHandle.special=true && objHandle.lock_it=false
        {
            if x<objHandle.x-15
            x_speed=1
            else if x>objHandle.x+15
            x_speed=-1
            else
            x_speed=0

            if x_speed=0
            goal=true
        }
    }
