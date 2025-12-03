    // ---- Night Firework ----------------------------------------------------------------------
    objHandle = player_collision_main_object(x, y, objNIGHTFirework);
    if (objHandle != noone) && ((ground=false && y_speed>0) || homing=1 || ground=true)
    {
        if objHandle.go=false && objHandle.speed=0{
        homing=0
        ridemove=false
        ground=false
        action=action_ride
        animation_direction=1
        y_speed=0
        x_speed=0
        x=objHandle.x
        y=objHandle.y-11
        with objHandle{
        instance_create(x-sprite_width/2-13,y,objNIGHTFireworkF)
        go=true
        target=0}}
    }

    // ---- Night Coaster ----------------------------------------------------------------------
    objHandle = player_collision_main_object(x, y, objNIGHTCoaster);
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
        objHandle.go=true}
    }
