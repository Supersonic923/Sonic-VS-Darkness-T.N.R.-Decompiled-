
    // player_hurt()
    if (invincibility) exit;

    shield=1

    // check if the player had a shield or is player 2
    if (shield)
    {
        if shield=2 && shieldlayer=1
        shieldlayer=0
        else
        shield  = 0;

        action  = action_hurt;
        if (sign(x_speed) != 0) && other.object_index!=objSpikeBomb
        {
            x_speed = -2.7*sign(x_speed);
            animation_direction = -sign(x_speed);
        }
        else if other.object_index!=objSpikeBomb x_speed = -2.7*animation_direction;
        y_speed = -4;
        ground  = false;
        player_set_angle(0);

        invincibility       = 2;
        invincibility_timer = 240;

        sound_play(sndHurt);

    }
    else if (global.Rings)
    {
        rings_create_ringloss(min(20, global.Rings), x, y-4);
        global.Rings = 0;

        action  = action_hurt;
        if (sign(x_speed) != 0) && other.object_index!=objSpikeBomb
        {
            x_speed = -2.7*sign(x_speed);
            animation_direction = -sign(x_speed);
        }
        else if other.object_index!=objSpikeBomb x_speed = -2.7*animation_direction;
        y_speed = -4;
        ground  = false;
        player_set_angle(0);

        invincibility       = 2;
        invincibility_timer = 240;

    }
    else if (global.Rings=0)
    with objPlayerAI
    instance_destroy()
