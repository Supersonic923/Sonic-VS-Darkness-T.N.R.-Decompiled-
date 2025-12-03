
    // player_hurt()
    if (invincibility) exit;

    // check if the player had a shield or is player 2
    if (shield)
    {
        switch (shield)
        {
            case 1:
            instance_create(x,y,objSpinGlow3)
            break;
            case 2:
            instance_create(x,y,objSpinGlowP)
            break;
            case 3:
            instance_create(x,y,objSpinGlowG)
            break;
            case 4:
            instance_create(x,y,objSpinGlow)
            break;
        }
        if shield=2 && shieldlayer=1
        shieldlayer=0
        else
        shield  = 0;

        action  = action_trip;
        animation_direction = -sign(x_speed);
        y_speed = -4;
        ground  = false;
        player_set_angle(0);

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

        action  = action_trip;
        animation_direction = -sign(x_speed);
        y_speed = -4;
        ground  = false;
        player_set_angle(0);

        invincibility       = 2;
        invincibility_timer = 240;

        sound_play(sndRingLose);

        if instance_exists(objSonic)
        sound_play(choose(vcBHurt,vcBHurt2,vcBHurt3,snd))
        else if instance_exists(objShadow)
        sound_play(choose(vcRHurt,vcRHurt2,snd))

    }
    else if (global.Rings=0)
    with objPlayer
    instance_destroy()
