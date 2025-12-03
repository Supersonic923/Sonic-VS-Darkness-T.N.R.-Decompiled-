
    // player_hurt()
    if (invincibility) exit;

    if room=rmTRAIN
    global.shield=1

        if homing=1
        {
        motion_set(0,0)
        homing=0
        }

    // check if the player had a shield or is player 2
    if (global.shield)
    {
        if room!=rmTRAIN && global.specialfx>1
        switch (global.shield)
        {
            case 1:
            if global.player="Sonic"
            instance_create(x,y,objSpinGlow)
            else
            instance_create(x,y,objSpinGlowO)
            break;
            case 2:
            instance_create(x,y,objSpinGlowP)
            break;
            case 3:
            instance_create(x,y,objSpinGlow3)
            break;
            case 4:
            instance_create(x,y,objSpinGlow)
            break;
        }
        if global.shield=2 && global.shieldlayer=1
        global.shieldlayer=0
        else
        global.shield  = 0;

        if argument0=false
        {
            action  = action_hurt;
            if (sign(x_speed) != 0) && other.object_index!=objSpikeBomb
            {
                x_speed = -2.7*sign(x_speed);
                animation_direction = -sign(x_speed);
            }
            else if other.object_index!=objSpikeBomb x_speed = -2.7*animation_direction;
            if surf=false{
            y_speed = -4;
            ground  = false;
            player_set_angle(0);}
        }

        else
        {
            action  = action_trip;
            animation_direction = -sign(x_speed);
            y_speed = -4;
            ground  = false;
            player_set_angle(0);
        }

        // Cancel speed change
        if animation="waterfall" || animation="waterfall2" || animation="waterfall3"
        {
            x_speed=0
            y_speed=0
            action=action_waterfall
        }

        invincibility       = 2;
        invincibility_timer = 240;

        sound_play(sndHurt);

    }
    else if (global.Rings)
    {
        if surf=false
        rings_create_ringloss(min(20, global.Rings), x, y-4);
        //if global.Rings>=20 // This is where you program Recover Ring, keep in mind, something seems buggy in it
        //global.Rings -= floor(global.Rings*.6);
        //else
        global.Rings = 0;

        if argument0=false
        {
            action  = action_hurt;
            if (sign(x_speed) != 0) && other.object_index!=objSpikeBomb
            {
                x_speed = -2.7*sign(x_speed);
                animation_direction = -sign(x_speed);
            }
            else if other.object_index!=objSpikeBomb x_speed = -2.7*animation_direction;
            if surf=false{
            y_speed = -4;
            ground  = false;
            player_set_angle(0);}
        }
        else
        {
            action  = action_trip;
            animation_direction = -sign(x_speed);
            y_speed = -4;
            ground  = false;
            player_set_angle(0);
        }

        // Cancel speed change
        if animation="waterfall" || animation="waterfall2" || animation="waterfall3"
        {
            x_speed=0
            y_speed=0
            action=action_waterfall
        }

        invincibility       = 2;
        invincibility_timer = 240;
        hurt_ring_delay     = 40;

        sound_play(sndRingLose);

        if instance_exists(objSonic)
        sound_play(choose(vcBHurt,vcBHurt2,vcBHurt3,snd))
        else if instance_exists(objShadow)
        sound_play(choose(vcRHurt,vcRHurt2,snd))

    }
    else if (global.Rings=0)
    with objPlayer
    instance_destroy()
