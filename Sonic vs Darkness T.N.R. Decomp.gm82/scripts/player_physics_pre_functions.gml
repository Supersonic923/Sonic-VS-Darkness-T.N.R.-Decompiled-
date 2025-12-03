 objHandle= player_collision_main_object(x+x_speed*2, y+y_speed*2, objBoxWooden);
 if objHandle!=noone
 {
        if objHandle.gravity!=0
        with objHandle
        instance_destroy()
        else
        {
            if (instance_exists(objBoostPar) || animation="crouch_slide" || action=action_soaring) && y>objHandle.y{
            with objHandle
            instance_destroy()}
            if action=action_stomping
            with objHandle
            instance_destroy()
        }
 }
 objHandle= player_collision_main_object(x+x_speed*2, y+y_speed*2, objLightBox);
 if objHandle!=noone
 {
        if action=action_stomping || animation="crouch_slide" || instance_exists(objBoostPar) || abs(x_speed)>10
        with objHandle
        instance_destroy()
 }
 objHandle= player_collision_main_object(x+x_speed, y+y_speed*2, objBreakSolid);
 if objHandle!=noone
 {
        if action=action_stomping || abs(y_speed)>7
        with objHandle
        {
            instance_destroy()
            sound_play(sndStoneBreak)
        }
 }
 objHandle= player_collision_main_object(x+x_speed*2, y, objBreakSolid2);
 if objHandle!=noone
 {
        if abs(x_speed)>8
        {
        with objHandle{
        add=other.x_speed/4

            if instance_place(x,y-1,objBreakSolid2)!=noone
            with instance_place(x,y-1,objBreakSolid2)
            instance_destroy()

            if instance_place(x,y+1,objBreakSolid2)!=noone
            with instance_place(x,y+1,objBreakSolid2)
            instance_destroy()
            sound_play(sndStoneBreak)

        instance_destroy()}}
 }
 objHandle= player_collision_main_object(x, y+y_speed*2, objDoorSwitch2);
 if objHandle!=noone
 {
        with objHandle
        event_perform(ev_collision,objPlayer)
 }
 objHandle= player_collision_main_object(x, y+y_speed*2, objBoxSwitch2);
 if objHandle!=noone
 {
        with objHandle
        event_perform(ev_collision,objPlayer)
 }
 objHandle= player_collision_main_object(x, y+y_speed*2, objFlameSwitch2);
 if objHandle!=noone
 {
        with objHandle
        event_perform(ev_collision,objPlayer)
 }


 if path_index=pth_Pipe01 || path_index=pth_Pipe02
 path_pipe=true
 else
 path_pipe=false



    // ---- Anchor ----------------------------------------------------------------------
    objHandle = player_collision_top_object(x, y, angle, maskMain ,objSUNAnchor);
    if (objHandle != noone)
    {
        if y>objHandle.y+100 && objHandle.vspeed!=0
        instance_destroy()
    }

    // ---- Bounce Platforms ----------------------------------------------------------------------
    objHandle = player_collision_main_object(x,y+y_speed*2,objBounceSolid);
    if (objHandle != noone) && y_speed>=0 && angle=0
    {
        ground=false
        y_speed=max(max(abs(y_speed),4)*-1.2,-15)
        animation_reset=true
        action=action_jumping
        animation="airjump"
        sound_play(sndBounce)
        instance_create(x,objHandle.y+5,objSplashLandShield)
        homehit=true
        airb=true
        stomp=true
    }
    // ---- Rock Cover ----------------------------------------------------------------------
    objHandle = player_collision_main_object(x,y+y_speed*2,objSUNRock);
    if (objHandle != noone)
    {
        if ((action=action_jumping && y_speed>2) || action=action_stomping) && action!=action_pipe
        {
            with objHandle
            instance_destroy()
            action=action_jumping
            y_speed = -3.5
            //x_speed = -2*animation_direction
            nomovet=20
        }
    }
    objHandle = player_collision_main_object(x+x_speed*2,y+y_speed*2,objSUNRock2);
    if (objHandle != noone)
    {
        if ((action=action_jumping && (abs(y_speed)>2)||abs(x_speed)>2) || action=action_stomping) && action!=action_pipe
        {
            action=action_jumping
            angle_to_bumper = degtorad(round(wrap_angle(point_direction(x, y, objHandle.x, objHandle.y)-90)/22.5)*22.5);
            x_speed = sin(wrap_angle(angle_to_bumper-global.gravity_angle))*3.5;
            y_speed = cos(wrap_angle(angle_to_bumper-global.gravity_angle))*3.5;
            //x_speed = -2*animation_direction
            nomovet=20
            with objHandle
            instance_destroy()
        }
    }
    objHandle = player_collision_main_object(x+x_speed*2,y+y_speed*2,objSUNRock3);
    if (objHandle != noone)
    {
        if ((action=action_jumping && (abs(y_speed)>2)||abs(x_speed)>2) || action=action_stomping) && action!=action_pipe
        {
            action=action_jumping
            angle_to_bumper = degtorad(round(wrap_angle(point_direction(x, y, objHandle.x, objHandle.y)-90)/22.5)*22.5);
            x_speed = sin(wrap_angle(angle_to_bumper-global.gravity_angle))*3.5;
            y_speed = cos(wrap_angle(angle_to_bumper-global.gravity_angle))*3.5;
            //x_speed = -2*animation_direction
            nomovet=20
            with objHandle
            instance_destroy()
        }
    }

    if slide=false{
    if player_collision_main_obj( x, y, maskMain, objRailLow)
    layer=1
    else if player_collision_main_obj( x, y, maskMain, objRailHigh)
    layer=0}
